import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

/// PLAN §9 — Product status.
enum ProductStatus {
  fresh,
  expiringSoon,
  expired,
  consumed;

  String get wire => name;

  static ProductStatus fromWire(String? v) =>
      ProductStatus.values.firstWhere(
        (e) => e.name == v,
        orElse: () => ProductStatus.fresh,
      );

  String get label => switch (this) {
        ProductStatus.fresh => 'Fresh',
        ProductStatus.expiringSoon => 'Expiring soon',
        ProductStatus.expired => 'Expired',
        ProductStatus.consumed => 'Consumed',
      };

  String localizedLabel(AppLocalizations l10n) => switch (this) {
        ProductStatus.fresh => l10n.statusFresh,
        ProductStatus.expiringSoon => l10n.statusExpiringSoon,
        ProductStatus.expired => l10n.statusExpired,
        ProductStatus.consumed => l10n.statusConsumed,
      };

  Color get color => switch (this) {
        ProductStatus.fresh => AppColors.fresh,
        ProductStatus.expiringSoon => AppColors.expiringSoon,
        ProductStatus.expired => AppColors.expired,
        ProductStatus.consumed => AppColors.consumed,
      };
}

/// PLAN §7.4 / §8.2 — Category.
enum ProductCategory {
  dairy,
  bakery,
  produce,
  meat,
  beverages,
  snacks,
  frozen,
  pantry,
  medicine,
  cosmetics,
  baby,
  petFood,
  other;

  String get wire => name.toUpperCase().replaceAll('PETFOOD', 'PET_FOOD');

  static ProductCategory fromWire(String? v) {
    final norm = (v ?? '').toUpperCase().replaceAll('_', '');
    return ProductCategory.values.firstWhere(
      (e) => e.name.toUpperCase() == norm,
      orElse: () => ProductCategory.other,
    );
  }

  String get label => switch (this) {
        ProductCategory.dairy => 'Dairy',
        ProductCategory.bakery => 'Bakery',
        ProductCategory.produce => 'Produce',
        ProductCategory.meat => 'Meat & Fish',
        ProductCategory.beverages => 'Beverages',
        ProductCategory.snacks => 'Snacks',
        ProductCategory.frozen => 'Frozen',
        ProductCategory.pantry => 'Pantry',
        ProductCategory.medicine => 'Medicine',
        ProductCategory.cosmetics => 'Cosmetics',
        ProductCategory.baby => 'Baby',
        ProductCategory.petFood => 'Pet Food',
        ProductCategory.other => 'Other',
      };

  String localizedLabel(AppLocalizations l10n) => switch (this) {
        ProductCategory.dairy => l10n.categoryDairy,
        ProductCategory.bakery => l10n.categoryBakery,
        ProductCategory.produce => l10n.categoryProduce,
        ProductCategory.meat => l10n.categoryMeat,
        ProductCategory.beverages => l10n.categoryBeverages,
        ProductCategory.snacks => l10n.categorySnacks,
        ProductCategory.frozen => l10n.categoryFrozen,
        ProductCategory.pantry => l10n.categoryPantry,
        ProductCategory.medicine => l10n.categoryMedicine,
        ProductCategory.cosmetics => l10n.categoryCosmetics,
        ProductCategory.baby => l10n.categoryBaby,
        ProductCategory.petFood => l10n.categoryPetFood,
        ProductCategory.other => l10n.categoryOther,
      };

  IconData get icon => switch (this) {
        ProductCategory.dairy => Icons.egg_alt_outlined,
        ProductCategory.bakery => Icons.bakery_dining_outlined,
        ProductCategory.produce => Icons.eco_outlined,
        ProductCategory.meat => Icons.set_meal_outlined,
        ProductCategory.beverages => Icons.local_drink_outlined,
        ProductCategory.snacks => Icons.cookie_outlined,
        ProductCategory.frozen => Icons.ac_unit_outlined,
        ProductCategory.pantry => Icons.kitchen_outlined,
        ProductCategory.medicine => Icons.medication_outlined,
        ProductCategory.cosmetics => Icons.spa_outlined,
        ProductCategory.baby => Icons.child_friendly_outlined,
        ProductCategory.petFood => Icons.pets_outlined,
        ProductCategory.other => Icons.inventory_2_outlined,
      };
}

/// PLAN §7.4 — Storage location.
enum StorageLocation {
  fridge,
  freezer,
  pantry,
  cabinet,
  other;

  String get wire => name.toUpperCase();

  static StorageLocation fromWire(String? v) =>
      StorageLocation.values.firstWhere(
        (e) => e.name.toUpperCase() == (v ?? '').toUpperCase(),
        orElse: () => StorageLocation.pantry,
      );

  String get label => switch (this) {
        StorageLocation.fridge => 'Fridge',
        StorageLocation.freezer => 'Freezer',
        StorageLocation.pantry => 'Pantry',
        StorageLocation.cabinet => 'Cabinet',
        StorageLocation.other => 'Other',
      };

  String localizedLabel(AppLocalizations l10n) => switch (this) {
        StorageLocation.fridge => l10n.storageFridge,
        StorageLocation.freezer => l10n.storageFreezer,
        StorageLocation.pantry => l10n.storagePantry,
        StorageLocation.cabinet => l10n.storageCabinet,
        StorageLocation.other => l10n.storageOther,
      };
}
