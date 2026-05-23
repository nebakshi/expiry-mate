import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/extensions/date_extensions.dart';
import 'product_enums.dart';

/// Mirrors PLAN §8.2 products document. Immutable; mutate via [copyWith].
class Product extends Equatable {
  const Product({
    required this.id,
    required this.userId,
    required this.productName,
    required this.expiryDate,
    this.barcode,
    this.brand,
    this.category = ProductCategory.other,
    this.storageLocation = StorageLocation.pantry,
    this.imageUrl,
    this.quantity = 1,
    this.unit = 'unit',
    this.manufacturingDate,
    this.bestBeforeText,
    this.ocrRawText,
    this.parsedBy = 'MANUAL',
    this.reminderDaysBefore = AppConstants.defaultReminderDaysBefore,
    this.notificationIds = const [],
    this.note,
    this.isConsumed = false,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String userId;
  final String? barcode;
  final String productName;
  final String? brand;
  final ProductCategory category;
  final StorageLocation storageLocation;
  final String? imageUrl;
  final int quantity;
  final String unit;
  final DateTime expiryDate;
  final DateTime? manufacturingDate;
  final String? bestBeforeText;
  final String? ocrRawText;
  final String parsedBy; // OCR | MANUAL | API
  final List<int> reminderDaysBefore;
  final List<int> notificationIds;
  final String? note;
  final bool isConsumed;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Status is *derived*, never stored stale (PLAN §9).
  ProductStatus get status {
    if (isConsumed) return ProductStatus.consumed;
    if (isExpired(expiryDate)) return ProductStatus.expired;
    if (isExpiringSoon(expiryDate)) return ProductStatus.expiringSoon;
    return ProductStatus.fresh;
  }

  bool get isExpiredNow => isExpired(expiryDate);

  Product copyWith({
    String? productName,
    String? barcode,
    String? brand,
    ProductCategory? category,
    StorageLocation? storageLocation,
    String? imageUrl,
    int? quantity,
    String? unit,
    DateTime? expiryDate,
    DateTime? manufacturingDate,
    String? bestBeforeText,
    String? ocrRawText,
    String? parsedBy,
    List<int>? reminderDaysBefore,
    List<int>? notificationIds,
    String? note,
    bool? isConsumed,
    DateTime? updatedAt,
  }) {
    return Product(
      id: id,
      userId: userId,
      productName: productName ?? this.productName,
      barcode: barcode ?? this.barcode,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      storageLocation: storageLocation ?? this.storageLocation,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      expiryDate: expiryDate ?? this.expiryDate,
      manufacturingDate: manufacturingDate ?? this.manufacturingDate,
      bestBeforeText: bestBeforeText ?? this.bestBeforeText,
      ocrRawText: ocrRawText ?? this.ocrRawText,
      parsedBy: parsedBy ?? this.parsedBy,
      reminderDaysBefore: reminderDaysBefore ?? this.reminderDaysBefore,
      notificationIds: notificationIds ?? this.notificationIds,
      note: note ?? this.note,
      isConsumed: isConsumed ?? this.isConsumed,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'id': id,
        'userId': userId,
        'barcode': barcode,
        'productName': productName,
        'brand': brand,
        'category': category.wire,
        'storageLocation': storageLocation.wire,
        'imageUrl': imageUrl,
        'quantity': quantity,
        'unit': unit,
        'expiryDate': expiryDate.isoDate,
        'manufacturingDate': manufacturingDate?.isoDate,
        'bestBeforeText': bestBeforeText,
        'ocrRawText': ocrRawText,
        'parsedBy': parsedBy,
        'status': status.wire,
        'reminderDaysBefore': reminderDaysBefore,
        'notificationIds': notificationIds,
        'isConsumed': isConsumed,
        'isExpired': isExpiredNow,
        'note': note,
        'createdAt': Timestamp.fromDate(createdAt),
        'updatedAt': Timestamp.fromDate(updatedAt),
      };

  factory Product.fromFirestore(Map<String, dynamic> d, String docId) {
    DateTime parseDate(dynamic v, {DateTime? fallback}) {
      if (v is Timestamp) return v.toDate();
      if (v is String && v.isNotEmpty) {
        return DateTime.tryParse(v) ?? (fallback ?? DateTime.now());
      }
      return fallback ?? DateTime.now();
    }

    return Product(
      id: (d['id'] as String?) ?? docId,
      userId: (d['userId'] as String?) ?? '',
      barcode: d['barcode'] as String?,
      productName: (d['productName'] as String?) ?? 'Unnamed product',
      brand: d['brand'] as String?,
      category: ProductCategory.fromWire(d['category'] as String?),
      storageLocation: StorageLocation.fromWire(d['storageLocation'] as String?),
      imageUrl: d['imageUrl'] as String?,
      quantity: (d['quantity'] as num?)?.toInt() ?? 1,
      unit: (d['unit'] as String?) ?? 'unit',
      expiryDate: parseDate(d['expiryDate']),
      manufacturingDate:
          d['manufacturingDate'] == null ? null : parseDate(d['manufacturingDate']),
      bestBeforeText: d['bestBeforeText'] as String?,
      ocrRawText: d['ocrRawText'] as String?,
      parsedBy: (d['parsedBy'] as String?) ?? 'MANUAL',
      reminderDaysBefore: (d['reminderDaysBefore'] as List?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          AppConstants.defaultReminderDaysBefore,
      notificationIds: (d['notificationIds'] as List?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      note: d['note'] as String?,
      isConsumed: (d['isConsumed'] as bool?) ?? false,
      createdAt: parseDate(d['createdAt'], fallback: DateTime.now()),
      updatedAt: parseDate(d['updatedAt'], fallback: DateTime.now()),
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        productName,
        barcode,
        brand,
        category,
        storageLocation,
        imageUrl,
        quantity,
        unit,
        expiryDate,
        manufacturingDate,
        bestBeforeText,
        ocrRawText,
        parsedBy,
        reminderDaysBefore,
        notificationIds,
        note,
        isConsumed,
        createdAt,
        updatedAt,
      ];
}
