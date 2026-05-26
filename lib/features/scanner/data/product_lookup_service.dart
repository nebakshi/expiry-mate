import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/app_constants.dart';
import '../../../core/errors/failures.dart';
import '../../product/domain/entities/product_enums.dart';

/// Normalised result of a barcode lookup.
class ProductInfo {
  const ProductInfo({
    required this.barcode,
    this.productName,
    this.brand,
    this.imageUrl,
    this.category = ProductCategory.other,
    this.source = 'unknown',
    this.found = false,
  });

  final String barcode;
  final String? productName;
  final String? brand;
  final String? imageUrl;
  final ProductCategory category;
  final String source;
  final bool found;
}

/// PLAN §16 priority order:
/// local cache → Open Food Facts → Open Beauty Facts → Open Pet Food Facts
/// → UPCitemdb → manual fallback.
class ProductLookupService {
  ProductLookupService({
    FirebaseFirestore? firestore,
    http.Client? client,
  })  : _db = firestore ?? FirebaseFirestore.instance,
        _client = client ?? http.Client();

  final FirebaseFirestore _db;
  final http.Client _client;

  Future<Result<ProductInfo>> lookup(String barcode) async {
    // 1) Firestore barcode cache (fast, free).
    try {
      final cached = await _db
          .collection(AppConstants.barcodeCacheCollection)
          .doc(barcode)
          .get();
      if (cached.exists) {
        final d = cached.data()!;
        return Success(ProductInfo(
          barcode: barcode,
          productName: d['productName'] as String?,
          brand: d['brand'] as String?,
          imageUrl: d['imageUrl'] as String?,
          category: ProductCategory.fromWire(d['category'] as String?),
          source: (d['source'] as String?) ?? 'cache',
          found: true,
        ),);
      }
    } catch (_) {
      // Cache miss / offline — fall through to network.
    }

    // 2) Try each remote source in order.
    final sources = [
      () => _lookupOpenFoodFacts(barcode, 'world.openfoodfacts.org', 'open_food_facts'),
      () => _lookupOpenFoodFacts(barcode, 'world.openbeautyfacts.org', 'open_beauty_facts'),
      () => _lookupOpenFoodFacts(barcode, 'world.openpetfoodfacts.org', 'open_pet_food_facts'),
      () => _lookupUpcItemDb(barcode),
    ];

    var allFailed = true;
    for (final source in sources) {
      try {
        final info = await source();
        allFailed = false;
        if (info != null) {
          _cacheResult(info);
          return Success(info);
        }
      } catch (_) {
        // Source threw (network error) — try next.
      }
    }

    if (allFailed) {
      return const Err(NetworkFailure(
          'Could not reach product database. Enter details manually.'));
    }
    return Err(NotFoundFailure('Product not found for barcode $barcode.'));
  }

  /// Open Food Facts / Open Beauty Facts / Open Pet Food Facts (same API).
  Future<ProductInfo?> _lookupOpenFoodFacts(
      String barcode, String host, String sourceName,) async {
    final uri = Uri.parse(
      'https://$host/api/v2/product/$barcode?fields=product_name,brands,image_url,categories_tags',
    );
    final resp = await _client.get(uri, headers: {
      'User-Agent': AppConstants.offUserAgent,
    },).timeout(const Duration(seconds: 8));

    if (resp.statusCode != 200) return null;
    final json = jsonDecode(resp.body) as Map<String, dynamic>;
    if (json['status'] != 1 || json['product'] == null) return null;

    final p = json['product'] as Map<String, dynamic>;
    final name = (p['product_name'] as String?)?.trim();
    if (name == null || name.isEmpty) return null;

    return ProductInfo(
      barcode: barcode,
      productName: name,
      brand: (p['brands'] as String?)?.split(',').first.trim(),
      imageUrl: p['image_url'] as String?,
      category: _mapCategory(p['categories_tags']),
      source: sourceName,
      found: true,
    );
  }

  /// UPCitemdb free tier (100 req/day, no key needed).
  Future<ProductInfo?> _lookupUpcItemDb(String barcode) async {
    final uri = Uri.parse(
      'https://api.upcitemdb.com/prod/trial/lookup?upc=$barcode',
    );
    final resp = await _client.get(uri, headers: {
      'User-Agent': AppConstants.offUserAgent,
    },).timeout(const Duration(seconds: 8));

    if (resp.statusCode != 200) return null;
    final json = jsonDecode(resp.body) as Map<String, dynamic>;
    final items = json['items'] as List?;
    if (items == null || items.isEmpty) return null;

    final item = items.first as Map<String, dynamic>;
    final name = (item['title'] as String?)?.trim();
    if (name == null || name.isEmpty) return null;

    return ProductInfo(
      barcode: barcode,
      productName: name,
      brand: (item['brand'] as String?)?.trim(),
      imageUrl: (item['images'] as List?)?.firstOrNull as String?,
      category: _mapCategoryFromString(item['category'] as String?),
      source: 'upcitemdb',
      found: true,
    );
  }

  /// Write to Firestore cache so repeat scans are instant.
  Future<void> _cacheResult(ProductInfo info) async {
    try {
      await _db
          .collection(AppConstants.barcodeCacheCollection)
          .doc(info.barcode)
          .set({
        'productName': info.productName,
        'brand': info.brand,
        'imageUrl': info.imageUrl,
        'category': info.category.wire,
        'source': info.source,
        'cachedAt': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      // Non-critical — ignore cache write failures.
    }
  }

  ProductCategory _mapCategory(dynamic tags) {
    if (tags is! List) return ProductCategory.other;
    final joined = tags.join(' ').toLowerCase();
    return _mapCategoryFromString(joined);
  }

  ProductCategory _mapCategoryFromString(String? text) {
    if (text == null || text.isEmpty) return ProductCategory.other;
    final s = text.toLowerCase();
    if (s.contains('dairy') || s.contains('milk') || s.contains('cheese')) {
      return ProductCategory.dairy;
    }
    if (s.contains('bread') || s.contains('bakery')) return ProductCategory.bakery;
    if (s.contains('beverage') || s.contains('drink') || s.contains('juice')) {
      return ProductCategory.beverages;
    }
    if (s.contains('snack') || s.contains('biscuit') || s.contains('chips')) {
      return ProductCategory.snacks;
    }
    if (s.contains('frozen')) return ProductCategory.frozen;
    if (s.contains('meat') || s.contains('fish') || s.contains('seafood')) {
      return ProductCategory.meat;
    }
    if (s.contains('baby')) return ProductCategory.baby;
    if (s.contains('pet')) return ProductCategory.petFood;
    if (s.contains('sauce') || s.contains('condiment') || s.contains('ketchup')) {
      return ProductCategory.pantry;
    }
    return ProductCategory.other;
  }
}
