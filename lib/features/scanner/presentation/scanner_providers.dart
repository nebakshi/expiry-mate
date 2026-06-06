import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../expiry_parser/data/expiry_parser_service.dart';
import '../data/barcode_scanner_service.dart';
import '../data/nutrition_parser_service.dart';
import '../data/ocr_service.dart';
import '../data/product_lookup_service.dart';

final productLookupServiceProvider =
    Provider<ProductLookupService>((ref) => ProductLookupService());

final ocrServiceProvider = Provider<OcrService>((ref) {
  final service = OcrService();
  ref.onDispose(service.dispose);
  return service;
});

final barcodeScannerServiceProvider = Provider<BarcodeScannerService>((ref) {
  final service = BarcodeScannerService();
  ref.onDispose(service.dispose);
  return service;
});

final expiryParserProvider =
    Provider<ExpiryParserService>((ref) => const ExpiryParserService());

final nutritionParserProvider =
    Provider<NutritionParserService>((ref) => const NutritionParserService());
