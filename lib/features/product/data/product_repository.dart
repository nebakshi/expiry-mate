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
      final id = product.id.isEmpty ? _uuid.v4() : product.id;
      final now = DateTime.now();
      final toSave = product.copyWith(updatedAt: now).copyWithId(id, now);
      await _col(product.userId).doc(id).set(toSave.toFirestore());
      return Success(toSave);
    } on FirebaseException catch (e) {
      return Err(StorageFailure(e.message ?? 'Could not save product.'));
    } catch (_) {
      return const Err(UnknownFailure('Could not save product.'));
    }
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
      createdAt: createdAt,
      updatedAt: now,
    );
  }
}
