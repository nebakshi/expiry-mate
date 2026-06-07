import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../shared/models/product_draft.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../data/nutrition_parser_service.dart';
import '../scanner_providers.dart';

/// Used during the add flow (after expiry scan) and from product detail
/// to scan/update nutrition info from a label photo.
class ScanNutritionScreen extends ConsumerStatefulWidget {
  const ScanNutritionScreen({super.key, required this.draft});
  final ProductDraft draft;

  @override
  ConsumerState<ScanNutritionScreen> createState() =>
      _ScanNutritionScreenState();
}

class _ScanNutritionScreenState extends ConsumerState<ScanNutritionScreen> {
  final _picker = ImagePicker();
  bool _busy = false;
  NutritionData? _parsed;

  Future<void> _capture() async {
    setState(() => _busy = true);
    try {
      final shot = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 90,
      );
      if (shot == null) {
        setState(() => _busy = false);
        return;
      }
      final ocrRes =
          await ref.read(ocrServiceProvider).recogniseFromFile(shot.path);
      if (!mounted) return;

      switch (ocrRes) {
        case Success(:final value):
          final data = ref.read(nutritionParserProvider).parse(value);
          setState(() {
            _parsed = data;
            _busy = false;
          });
          if (data == null) {
            showError(context, context.l10n.couldNotDetectNutrition);
          }
        case Err(:final failure):
          setState(() => _busy = false);
          showError(context, failure.message);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _busy = false);
        showError(context, context.l10n.couldNotCaptureImage);
      }
    }
  }

  void _proceed() {
    final draft = widget.draft.copyWith(
      calories: _parsed?.calories,
      protein: _parsed?.protein,
      fat: _parsed?.fat,
      carbs: _parsed?.carbs,
      fiber: _parsed?.fiber,
      sugar: _parsed?.sugar,
      nutritionSource: 'OCR',
    );
    context.pushReplacement('/confirm', extra: draft);
  }

  void _skip() {
    context.pushReplacement('/confirm', extra: widget.draft);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.scanNutritionLabel)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (widget.draft.productName != null)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle,
                            color: AppColors.fresh),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Text(
                            '${widget.draft.productName}'
                            '${widget.draft.brand != null ? ' · ${widget.draft.brand}' : ''}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              Text(
                context.l10n.nutritionInstruction,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.md),
              FilledButton.icon(
                onPressed: _busy ? null : _capture,
                icon: const Icon(Icons.camera_alt_outlined),
                label: Text(
                    _parsed == null ? context.l10n.captureNutritionLabel : context.l10n.reScan),
              ),
              const SizedBox(height: AppSpacing.md),
              if (_busy)
                const Center(child: CircularProgressIndicator())
              else if (_parsed != null)
                Expanded(child: _NutritionPreview(data: _parsed!))
              else
                Expanded(
                  child: Center(
                    child: Text(
                      context.l10n.detectedNutritionPlaceholder,
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  ),
                ),
              const SizedBox(height: AppSpacing.sm),
              if (_parsed != null)
                FilledButton(
                  onPressed: _proceed,
                  child: Text(context.l10n.useTheseValues),
                ),
              const SizedBox(height: AppSpacing.sm),
              OutlinedButton(
                onPressed: _skip,
                child: Text(context.l10n.skip),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NutritionPreview extends StatelessWidget {
  const _NutritionPreview({required this.data});
  final NutritionData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(context.l10n.detectedValuesPer100g,
                style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.md),
            if (data.calories != null)
              _row(context.l10n.calories, '${data.calories!.toStringAsFixed(0)} kcal'),
            if (data.protein != null)
              _row(context.l10n.protein, '${data.protein!.toStringAsFixed(1)} g'),
            if (data.fat != null)
              _row(context.l10n.fat, '${data.fat!.toStringAsFixed(1)} g'),
            if (data.carbs != null)
              _row(context.l10n.carbs, '${data.carbs!.toStringAsFixed(1)} g'),
            if (data.fiber != null)
              _row(context.l10n.fiber, '${data.fiber!.toStringAsFixed(1)} g'),
            if (data.sugar != null)
              _row(context.l10n.sugar, '${data.sugar!.toStringAsFixed(1)} g'),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
