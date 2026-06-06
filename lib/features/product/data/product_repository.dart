import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/errors/failures.dart';
import '../domain/entities/product.dart';

/// PLAN §15.7 — single source of truth for product persistence.
class ProductRepository {
  ProductRepository({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;
  final _uuid = const Uuid();

  CollectionReference<Map<String, dynamic>> _col(String userId) => _db
      .collection(AppConstants.usersCollection)
      .doc(userId)
      .collection(AppConstants.productsCollection);

  /// Live inventory stream, newest expiry first.
  Stream<List<Product>> watchProducts(String userId) {
    return _col(userId)
        .orderBy('expiryDate')
        .snapshots()
        .map((snap) => snap.docs
            .map((d) => Product.fromFirestore(d.data(), d.id))
            .toList());
  }

  Future<Result<Product>> addProduct(
    Product product, {
    required bool isPremium,
  }) async {
    try {
      if (!isPremium) {
        final count = await _activeCount(product.userId);
        if (count >= AppConstants.freePlanProductLimit) {
          return const Err(PlanLimitFailure(
            'Free plan is limited to ${AppConstants.freePlanProductLimit} active products. '
            'Upgrade to Premium for unlimited tracking.',
          ));
        }
      }

      final duplicate = await findDuplicate(product);
      if (duplicate != null) {
        final merged = duplicate.copyWith(
          quantity: duplicate.quantity + product.quantity,
          updatedAt: DateTime.now(),
        );
        await _col(product.userId).doc(duplicate.id).set(merged.toFirestore());
        return Success(merged);
      }

      final id = product.id.isEmpty ? _uuid.v4() : product.id;
      final now = DateTime.now();
      final toSave = product.copyWith(updatedAt: now).copyWithId(id, now);
      await _col(product.userId).doc(id).set(toSave.toFirestore());
      _contributeToBarcodeCache(toSave);
      return Success(toSave);
    } on FirebaseException catch (e) {
      return Err(StorageFailure(e.message ?? 'Could not save product.'));
    } catch (_) {
      return const Err(UnknownFailure('Could not save product.'));
    }
  }

  /// Finds an existing non-consumed product with the same expiry date and
  /// identity (barcode match, or name+brand match if no barcode).
  Future<Product?> findDuplicate(Product product) async {
    final expiryStr = product.expiryDate.toIso8601String().substring(0, 10);
    final col = _col(product.userId);

    Query<Map<String, dynamic>> baseQuery = col
        .where('isConsumed', isEqualTo: false)
        .where('expiryDate', isEqualTo: expiryStr);

    if (product.barcode != null && product.barcode!.isNotEmpty) {
      final snap = await baseQuery
          .where('barcode', isEqualTo: product.barcode)
          .limit(1)
          .get();
      if (snap.docs.isNotEmpty) {
        return Product.fromFirestore(snap.docs.first.data(), snap.docs.first.id);
      }
    }

    final snap = await baseQuery
        .where('productName', isEqualTo: product.productName)
        .limit(1)
        .get();
    if (snap.docs.isNotEmpty) {
      return Product.fromFirestore(snap.docs.first.data(), snap.docs.first.id);
    }

    return null;
  }

  Future<Result<void>> updateProduct(Product product) async {
    try {
      final updated = product.copyWith(updatedAt: DateTime.now());
      await _col(product.userId).doc(product.id).set(updated.toFirestore());
      return const Success(null);
    } on FirebaseException catch (e) {
      return Err(StorageFailure(e.message ?? 'Could not update product.'));
    }
  }

  Future<Result<void>> deleteProduct(String userId, String productId) async {
    try {
      await _col(userId).doc(productId).delete();
      return const Success(null);
    } on FirebaseException catch (e) {
      return Err(StorageFailure(e.message ?? 'Could not delete product.'));
    }
  }

  Future<Result<void>> markConsumed(Product product, bool consumed) async {
    return updateProduct(product.copyWith(isConsumed: consumed));
  }

  Future<int> _activeCount(String userId) async {
    final snap =
        await _col(userId).where('isConsumed', isEqualTo: false).count().get();
    return snap.count ?? 0;
  }

  /// Contributes product data to the shared barcode cache so future scans
  /// by any user auto-fill product info + nutrition.
  Future<void> _contributeToBarcodeCache(Product product) async {
    if (product.barcode == null || product.barcode!.isEmpty) return;
    try {
      await _db
          .collection(AppConstants.barcodeCacheCollection)
          .doc(product.barcode)
          .set({
        'productName': product.productName,
        'brand': product.brand,
        'imageUrl': product.imageUrl,
        'category': product.category.wire,
        'source': 'community',
        'calories': product.calories,
        'protein': product.protein,
        'fat': product.fat,
        'carbs': product.carbs,
        'fiber': product.fiber,
        'sugar': product.sugar,
        'cachedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (_) {
      // Non-critical — ignore cache write failures.
    }
  }
}

/// Small private helper to set the immutable id/createdAt on a fresh product.
extension on Product {
  Product copyWithId(String id, DateTime now) {
    return Product(
      id: id,
      userId: userId,
      productName: productName,
      barcode: barcode,
      brand: brand,
      category: category,
      storageLocation: storageLocation,
      imageUrl: imageUrl,
      quantity: quantity,
      unit: unit,
      expiryDate: expiryDate,
      manufacturingDate: manufacturingDate,
      bestBeforeText: bestBeforeText,
      ocrRawText: ocrRawText,
      parsedBy: parsedBy,
      reminderDaysBefore: reminderDaysBefore,
      notificationIds: notificationIds,
      note: note,
      isConsumed: isConsumed,
      calories: calories,
      protein: protein,
      fat: fat,
      carbs: carbs,
      fiber: fiber,
      sugar: sugar,
      nutritionPer: nutritionPer,
      nutritionSource: nutritionSource,
      createdAt: createdAt,
      updatedAt: now,
    );
  }
}
