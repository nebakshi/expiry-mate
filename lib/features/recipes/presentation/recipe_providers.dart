import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/recipe_service.dart';

final recipeServiceProvider =
    Provider<RecipeService>((ref) => RecipeService());

final recipeQuotaProvider = FutureProvider<bool>((ref) {
  return ref.read(recipeServiceProvider).hasQuota();
});
