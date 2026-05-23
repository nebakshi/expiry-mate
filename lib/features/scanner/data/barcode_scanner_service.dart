import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

/// PLAN §15.2 — wraps ML Kit barcode scanning. Used by the live scanner
/// screen which feeds camera frames as [InputImage]s.
class BarcodeScannerService {
  BarcodeScannerService({BarcodeScanner? scanner})
      : _scanner = scanner ??
            BarcodeScanner(formats: [
              BarcodeFormat.ean13,
              BarcodeFormat.ean8,
              BarcodeFormat.upca,
              BarcodeFormat.upce,
              BarcodeFormat.code128,
              BarcodeFormat.code39,
            ]);

  final BarcodeScanner _scanner;

  /// Returns the first decoded barcode value in the image, or null.
  Future<String?> scan(InputImage image) async {
    final barcodes = await _scanner.processImage(image);
    for (final b in barcodes) {
      final raw = b.rawValue;
      if (raw != null && raw.trim().isNotEmpty) return raw.trim();
    }
    return null;
  }

  void dispose() => _scanner.close();
}
