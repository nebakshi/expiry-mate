import 'package:expiry_mate/features/product/domain/entities/product.dart';
import 'package:expiry_mate/features/product/domain/entities/product_enums.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Product make({required int daysFromNow, bool consumed = false}) {
    final now = DateTime.now();
    return Product(
      id: 't',
      userId: 'u',
      productName: 'Test',
      expiryDate: DateTime(now.year, now.month, now.day)
          .add(Duration(days: daysFromNow)),
      isConsumed: consumed,
      createdAt: now,
      updatedAt: now,
    );
  }

  group('Product.status — PLAN §9 banding', () {
    test('future > 7 days is fresh', () {
      expect(make(daysFromNow: 30).status, ProductStatus.fresh);
    });

    test('exactly 7 days is expiring soon', () {
      expect(make(daysFromNow: 7).status, ProductStatus.expiringSoon);
    });

    test('within the week is expiring soon', () {
      expect(make(daysFromNow: 2).status, ProductStatus.expiringSoon);
    });

    test('today is expiring soon (not yet expired)', () {
      expect(make(daysFromNow: 0).status, ProductStatus.expiringSoon);
    });

    test('past expiry is expired', () {
      expect(make(daysFromNow: -1).status, ProductStatus.expired);
    });

    test('consumed overrides everything', () {
      expect(make(daysFromNow: -10, consumed: true).status,
          ProductStatus.consumed);
      expect(make(daysFromNow: 30, consumed: true).status,
          ProductStatus.consumed);
    });
  });

  group('Product Firestore round-trip', () {
    test('toFirestore/fromFirestore preserves core fields', () {
      final now = DateTime(2026, 5, 1, 9, 30);
      final p = Product(
        id: 'abc',
        userId: 'user1',
        productName: 'Amul Milk',
        brand: 'Amul',
        barcode: '8901234567890',
        category: ProductCategory.dairy,
        storageLocation: StorageLocation.fridge,
        quantity: 2,
        unit: 'pack',
        expiryDate: DateTime(2026, 5, 8),
        reminderDaysBefore: const [7, 2, 0],
        createdAt: now,
        updatedAt: now,
      );

      final map = p.toFirestore();
      final back = Product.fromFirestore(map, 'abc');

      expect(back.productName, 'Amul Milk');
      expect(back.brand, 'Amul');
      expect(back.barcode, '8901234567890');
      expect(back.category, ProductCategory.dairy);
      expect(back.storageLocation, StorageLocation.fridge);
      expect(back.quantity, 2);
      expect(back.unit, 'pack');
      expect(back.expiryDate, DateTime(2026, 5, 8));
      expect(back.reminderDaysBefore, const [7, 2, 0]);
    });

    test('category wire format uses PET_FOOD', () {
      expect(ProductCategory.petFood.wire, 'PET_FOOD');
      expect(ProductCategory.fromWire('PET_FOOD'), ProductCategory.petFood);
    });
  });
}
