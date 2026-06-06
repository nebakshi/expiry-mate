/// Parses nutrition values (calories, protein, fat, carbs, fiber, sugar)
/// from raw OCR text of a nutrition label.
class NutritionParserService {
  const NutritionParserService();

  NutritionData? parse(String text) {
    final normalized = text.replaceAll('\n', ' ').toLowerCase();

    final calories = _extractValue(normalized, _caloriePatterns);
    final protein = _extractValue(normalized, _proteinPatterns);
    final fat = _extractValue(normalized, _fatPatterns);
    final carbs = _extractValue(normalized, _carbPatterns);
    final fiber = _extractValue(normalized, _fiberPatterns);
    final sugar = _extractValue(normalized, _sugarPatterns);

    if (calories == null && protein == null && fat == null) return null;

    return NutritionData(
      calories: calories,
      protein: protein,
      fat: fat,
      carbs: carbs,
      fiber: fiber,
      sugar: sugar,
    );
  }

  double? _extractValue(String text, List<RegExp> patterns) {
    for (final pattern in patterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        final valueStr = match.group(1);
        if (valueStr != null) {
          final value = double.tryParse(valueStr.replaceAll(',', '.'));
          if (value != null && value >= 0 && value < 10000) return value;
        }
      }
    }
    return null;
  }

  static final _caloriePatterns = [
    RegExp(r'energy[:\s]*(\d+[.,]?\d*)\s*kcal'),
    RegExp(r'calories?[:\s]*(\d+[.,]?\d*)'),
    RegExp(r'kcal[:\s]*(\d+[.,]?\d*)'),
    RegExp(r'(\d+[.,]?\d*)\s*kcal'),
  ];

  static final _proteinPatterns = [
    RegExp(r'protein[s]?[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'protein[s]?[:\s]*(\d+[.,]?\d*)'),
  ];

  static final _fatPatterns = [
    RegExp(r'total\s*fat[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'fat[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'fat[:\s]*(\d+[.,]?\d*)'),
  ];

  static final _carbPatterns = [
    RegExp(r'carbohydrate[s]?[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'carbs?[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'carbohydrate[s]?[:\s]*(\d+[.,]?\d*)'),
  ];

  static final _fiberPatterns = [
    RegExp(r'fibre?[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'dietary\s*fibre?[:\s]*(\d+[.,]?\d*)'),
    RegExp(r'fibre?[:\s]*(\d+[.,]?\d*)'),
  ];

  static final _sugarPatterns = [
    RegExp(r'sugar[s]?[:\s]*(\d+[.,]?\d*)\s*g'),
    RegExp(r'sugar[s]?[:\s]*(\d+[.,]?\d*)'),
  ];
}

class NutritionData {
  const NutritionData({
    this.calories,
    this.protein,
    this.fat,
    this.carbs,
    this.fiber,
    this.sugar,
  });

  final double? calories;
  final double? protein;
  final double? fat;
  final double? carbs;
  final double? fiber;
  final double? sugar;
}
