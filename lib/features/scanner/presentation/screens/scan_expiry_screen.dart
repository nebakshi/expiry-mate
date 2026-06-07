import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../shared/models/product_draft.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../expiry_parser/domain/expiry_date_candidate.dart';
import '../../data/product_lookup_service.dart';
import '../scanner_providers.dart';

class ScanExpiryScreen extends ConsumerStatefulWidget {
  const ScanExpiryScreen({super.key, required this.draft});
  final ProductDraft draft;

  @override
  ConsumerState<ScanExpiryScreen> createState() => _ScanExpiryScreenState();
}

class _ScanExpiryScreenState extends ConsumerState<ScanExpiryScreen> {
  final _picker = ImagePicker();
  bool _busy = false;
  String? _rawText;
  List<ExpiryDateCandidate> _candidates = const [];
  late ProductDraft _draft = widget.draft;

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
          final candidates =
              ref.read(expiryParserProvider).parse(value);
          setState(() {
            _rawText = value;
            _candidates = candidates;
            _busy = false;
          });
          if (candidates.isEmpty) {
            showError(context, context.l10n.noDateDetected);
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

  void _proceed(DateTime expiry, {String parsedBy = 'OCR'}) {
    final draft = _draft.copyWith(
      expiryDate: expiry,
      ocrRawText: _rawText,
      parsedBy: parsedBy,
    );
    if (draft.hasNutrition) {
      context.pushReplacement('/confirm', extra: draft);
    } else {
      context.pushReplacement('/scan-nutrition', extra: draft);
    }
  }

  Future<void> _searchByName() async {
    final controller = TextEditingController();
    final result = await showDialog<ProductInfo>(
      context: context,
      builder: (ctx) => _ProductSearchDialog(
        controller: controller,
        lookupService: ref.read(productLookupServiceProvider),
      ),
    );
    if (result != null && mounted) {
      setState(() {
        _draft = _draft.copyWith(
          productName: result.productName,
          brand: result.brand,
          imageUrl: result.imageUrl,
          category: result.category,
          calories: result.calories,
          protein: result.protein,
          fat: result.fat,
          carbs: result.carbs,
          fiber: result.fiber,
          sugar: result.sugar,
          nutritionSource: result.hasNutrition ? 'API' : null,
          lookupSource: result.source,
        );
      });
    }
  }

  Future<void> _pickManualDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 7)),
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) _proceed(picked, parsedBy: 'MANUAL');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.scanExpiryDate)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_draft.productName != null)
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
                            '${_draft.productName}'
                            '${_draft.brand != null ? ' · ${_draft.brand}' : ''}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                OutlinedButton.icon(
                  onPressed: _searchByName,
                  icon: const Icon(Icons.search),
                  label: Text(context.l10n.searchProductByName),
                ),
              const SizedBox(height: AppSpacing.md),
              Text(
                context.l10n.scanExpiryInstruction,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.md),
              FilledButton.icon(
                onPressed: _busy ? null : _capture,
                icon: const Icon(Icons.camera_alt_outlined),
                label: Text(_rawText == null
                    ? context.l10n.captureDateLabel
                    : context.l10n.reScan),
              ),
              const SizedBox(height: AppSpacing.md),
              if (_busy)
                const Center(child: CircularProgressIndicator())
              else
                Expanded(child: _buildResults()),
              const SizedBox(height: AppSpacing.sm),
              OutlinedButton.icon(
                onPressed: _pickManualDate,
                icon: const Icon(Icons.edit_calendar_outlined),
                label: Text(context.l10n.pickDateManually),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResults() {
    if (_candidates.isEmpty) {
      return Center(
        child: Text(
          context.l10n.detectedDatesPlaceholder,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      );
    }
    return ListView(
      children: [
        Text(context.l10n.detectedDates,
            style: const TextStyle(fontWeight: FontWeight.w700)),
        const SizedBox(height: AppSpacing.sm),
        ..._candidates.map((c) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      AppColors.primary.withValues(alpha: 0.12),
                  child: Text('${(c.confidence * 100).round()}%',
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark)),
                ),
                title: Text(c.date.displayDate,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(
                  '${c.date.daysLeftLabel} · ${c.parsingMethod.replaceAll('_', ' ')}',
                  style: const TextStyle(fontSize: 12),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                onTap: () => _proceed(c.date),
              ),
            )),
      ],
    );
  }
}

class _ProductSearchDialog extends StatefulWidget {
  const _ProductSearchDialog({
    required this.controller,
    required this.lookupService,
  });

  final TextEditingController controller;
  final ProductLookupService lookupService;

  @override
  State<_ProductSearchDialog> createState() => _ProductSearchDialogState();
}

class _ProductSearchDialogState extends State<_ProductSearchDialog> {
  List<ProductInfo> _results = [];
  bool _searching = false;
  String? _error;

  Future<void> _search() async {
    final query = widget.controller.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _searching = true;
      _error = null;
    });

    final res = await widget.lookupService.searchByNameMultiple(query);
    if (!mounted) return;

    switch (res) {
      case Success(:final value):
        setState(() {
          _results = value;
          _searching = false;
        });
      case Err(:final failure):
        setState(() {
          _error = failure.message;
          _results = [];
          _searching = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(AppSpacing.lg),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(context.l10n.searchProduct,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: context.l10n.searchHintExample,
                      isDense: true,
                    ),
                    onSubmitted: (_) => _search(),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton.filled(
                  onPressed: _searching ? null : _search,
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            if (_searching)
              const Center(child: CircularProgressIndicator())
            else if (_error != null)
              Text(_error!,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error))
            else if (_results.isNotEmpty)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height * 0.4,
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _results.length,
                  itemBuilder: (_, i) {
                    final p = _results[i];
                    return ListTile(
                      dense: true,
                      leading: p.imageUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                p.imageUrl!,
                                width: 36,
                                height: 36,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Icons.fastfood_outlined),
                              ),
                            )
                          : const Icon(Icons.fastfood_outlined),
                      title: Text(p.productName ?? '',
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(
                        [
                          if (p.brand != null) p.brand,
                          if (p.hasNutrition)
                            '${p.calories?.toStringAsFixed(0) ?? '?'} kcal',
                        ].join(' · '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12),
                      ),
                      onTap: () => Navigator.pop(context, p),
                    );
                  },
                ),
              )
            else
              Text(
                context.l10n.typeProductNameHint,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.l10n.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
