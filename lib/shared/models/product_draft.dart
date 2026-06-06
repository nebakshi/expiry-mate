import '../../features/product/domain/entities/product_enums.dart';

/// Carries in-progress product data between scan screens before it's saved
/// as a final [Product]. Kept simple and mutable on copy.
class ProductDraft {
  ProductDraft({
    this.barcode,
    this.productName,
    this.brand,
    this.imageUrl,
    this.category = ProductCategory.other,
    this.storageLocation = StorageLocation.pantry,
    this.quantity = 1,
    this.unit = 'unit',
    this.expiryDate,
    this.manufacturingDate,
    this.ocrRawText,
    this.parsedBy = 'MANUAL',
    this.lookupSource,
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.fiber,
    this.sugar,
    this.nutritionPer = '100g',
    this.nutritionSource,
  });

  factory ProductDraft.empty() => ProductDraft();

  String? barcode;
  String? productName;
  String? brand;
  String? imageUrl;
  ProductCategory category;
  StorageLocation storageLocation;
  int quantity;
  String unit;
  DateTime? expiryDate;
  DateTime? manufacturingDate;
  String? ocrRawText;
  String parsedBy;
  String? lookupSource;
  double? calories;
  double? protein;
  double? fat;
  double? carbs;
  double? fiber;
  double? sugar;
  String nutritionPer;
  String? nutritionSource;

  bool get hasNutrition => calories != null || protein != null || fat != null;

  ProductDraft copyWith({
    String? barcode,
    String? productName,
    String? brand,
    String? imageUrl,
    ProductCategory? category,
    StorageLocation? storageLocation,
    int? quantity,
    String? unit,
    DateTime? expiryDate,
    DateTime? manufacturingDate,
    String? ocrRawText,
    String? parsedBy,
    String? lookupSource,
    double? calories,
    double? protein,
    double? fat,
    double? carbs,
    double? fiber,
    double? sugar,
    String? nutritionPer,
    String? nutritionSource,
  }) {
    return ProductDraft(
      barcode: barcode ?? this.barcode,
      productName: productName ?? this.productName,
      brand: brand ?? this.brand,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      storageLocation: storageLocation ?? this.storageLocation,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      expiryDate: expiryDate ?? this.expiryDate,
      manufacturingDate: manufacturingDate ?? this.manufacturingDate,
      ocrRawText: ocrRawText ?? this.ocrRawText,
      parsedBy: parsedBy ?? this.parsedBy,
      lookupSource: lookupSource ?? this.lookupSource,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      fiber: fiber ?? this.fiber,
      sugar: sugar ?? this.sugar,
      nutritionPer: nutritionPer ?? this.nutritionPer,
      nutritionSource: nutritionSource ?? this.nutritionSource,
    );
  }
}
