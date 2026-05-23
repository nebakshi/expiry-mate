import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import '../../../core/errors/failures.dart';

/// PLAN §15.4 — wraps ML Kit on-device text recognition.
class OcrService {
  OcrService({TextRecognizer? recognizer})
      : _recognizer =
            recognizer ?? TextRecognizer(script: TextRecognitionScript.latin);

  final TextRecognizer _recognizer;

  /// Recognises text from an image file captured by the camera/picker.
  Future<Result<String>> recogniseFromFile(String imagePath) async {
    try {
      final input = InputImage.fromFilePath(imagePath);
      final recognised = await _recognizer.processImage(input);
      final text = recognised.text.trim();
      if (text.isEmpty) {
        return const Err(
            NotFoundFailure('No text detected. Try better lighting.'));
      }
      return Success(text);
    } catch (_) {
      return const Err(UnknownFailure('Text recognition failed.'));
    }
  }

  void dispose() => _recognizer.close();
}
