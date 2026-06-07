import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../data/recipe_service.dart';
import 'recipe_providers.dart';

class RecipeSuggestionsScreen extends ConsumerStatefulWidget {
  const RecipeSuggestionsScreen({super.key, required this.productNames});
  final List<String> productNames;

  @override
  ConsumerState<RecipeSuggestionsScreen> createState() =>
      _RecipeSuggestionsScreenState();
}

class _RecipeSuggestionsScreenState
    extends ConsumerState<RecipeSuggestionsScreen> {
  List<RecipeSuggestion>? _recipes;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final recipes =
        await ref.read(recipeServiceProvider).suggest(widget.productNames);

    if (!mounted) return;

    if (recipes == null || recipes.isEmpty) {
      setState(() {
        _loading = false;
        _error = 'Could not generate suggestions right now. Try again later.';
      });
    } else {
      setState(() {
        _recipes = recipes;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.recipeIdeas)),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_loading) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: AppSpacing.md),
            Text(context.l10n.thinkingOfRecipes),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.restaurant_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.onSurfaceVariant),
              const SizedBox(height: AppSpacing.md),
              Text(context.l10n.couldNotGenerateRecipes,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
              const SizedBox(height: AppSpacing.md),
              FilledButton(onPressed: _loadRecipes, child: Text(context.l10n.retry)),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Text(
          context.l10n.usingProducts(widget.productNames.join(", ")),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...(_recipes ?? []).map((r) => _RecipeCard(recipe: r)),
      ],
    );
  }
}

class _RecipeCard extends StatefulWidget {
  const _RecipeCard({required this.recipe});
  final RecipeSuggestion recipe;

  @override
  State<_RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<_RecipeCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final r = widget.recipe;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius),
        onTap: () => setState(() => _expanded = !_expanded),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(r.title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  if (r.cookTime != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(r.cookTime!,
                          style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary)),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(r.description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: 13)),
              if (_expanded) ...[
                const SizedBox(height: AppSpacing.md),
                Text(context.l10n.ingredients,
                    style: const
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                ...r.ingredients.map((i) => Padding(
                      padding: const EdgeInsets.only(left: 8, top: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 13)),
                          Expanded(
                              child: Text(i,
                                  style: const TextStyle(fontSize: 13))),
                        ],
                      ),
                    )),
                const SizedBox(height: AppSpacing.md),
                Text(context.l10n.steps,
                    style: const
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                const SizedBox(height: 4),
                ...r.steps.asMap().entries.map((e) => Padding(
                      padding: const EdgeInsets.only(left: 8, top: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${e.key + 1}. ',
                              style: const TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600)),
                          Expanded(
                              child: Text(e.value,
                                  style: const TextStyle(fontSize: 13))),
                        ],
                      ),
                    )),
              ],
              const SizedBox(height: AppSpacing.sm),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
