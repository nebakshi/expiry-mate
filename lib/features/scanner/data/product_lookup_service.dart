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

/// PLAN §16 priority order: local cache → Open Food Facts → manual fallback.
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
        ));
      }
    } catch (_) {
      // Cache miss / offline — fall through to network.
    }

    // 2) Open Food Facts.
    try {
      final uri = Uri.parse(
        '${AppConstants.offBaseUrl}/$barcode?fields=product_name,brands,image_url,categories_tags',
      );
      final resp = await _client.get(uri, headers: {
        'User-Agent': AppConstants.offUserAgent,
      }).timeout(const Duration(seconds: 8));

      if (resp.statusCode == 200) {
        final json = jsonDecode(resp.body) as Map<String, dynamic>;
        if (json['status'] == 1 && json['product'] != null) {
          final p = json['product'] as Map<String, dynamic>;
          final name = (p['product_name'] as String?)?.trim();
          if (name != null && name.isNotEmpty) {
            final info = ProductInfo(
              barcode: barcode,
              productName: name,
              brand: (p['brands'] as String?)?.split(',').first.trim(),
              imageUrl: p['image_url'] as String?,
              category: _mapCategory(p['categories_tags']),
              source: 'open_food_facts',
              found: true,
            );
            return Success(info);
          }
        }
      }
      // 3) Not found → manual fallback (PLAN §16 fallback rule).
      return Err(NotFoundFailure('Product not found for barcode $barcode.'));
    } catch (_) {
      return const Err(NetworkFailure(
          'Could not reach product database. Enter details manually.'));
    }
  }

  ProductCategory _mapCategory(dynamic tags) {
    if (tags is! List) return ProductCategory.other;
    final joined = tags.join(' ').toLowerCase();
    if (joined.contains('dairy') || joined.contains('milk') || joined.contains('cheese')) {
      return ProductCategory.dairy;
    }
    if (joined.contains('bread') || joined.contains('bakery')) {
      return ProductCategory.bakery;
    }
    if (joined.contains('beverage') || joined.contains('drink') || joined.contains('juice')) {
      return ProductCategory.beverages;
    }
    if (joined.contains('snack') || joined.contains('biscuit') || joined.contains('chips')) {
      return ProductCategory.snacks;
    }
    if (joined.contains('frozen')) return ProductCategory.frozen;
    if (joined.contains('meat') || joined.contains('fish') || joined.contains('seafood')) {
      return ProductCategory.meat;
    }
    if (joined.contains('baby')) return ProductCategory.baby;
    return ProductCategory.pantry;
  }
}
