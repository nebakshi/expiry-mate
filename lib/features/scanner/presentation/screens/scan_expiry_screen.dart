import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/date_extensions.dart';
import '../../../../shared/models/product_draft.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../expiry_parser/domain/expiry_date_candidate.dart';
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
            showError(context,
                'No date detected. Pick the date manually below.');
          }
        case Err(:final failure):
          setState(() => _busy = false);
          showError(context, failure.message);
      }
    } catch (_) {
      if (mounted) {
        setState(() => _busy = false);
        showError(context, 'Could not capture image.');
      }
    }
  }

  void _proceed(DateTime expiry, {String parsedBy = 'OCR'}) {
    final draft = widget.draft.copyWith(
      expiryDate: expiry,
      ocrRawText: _rawText,
      parsedBy: parsedBy,
    );
    context.pushReplacement('/confirm', extra: draft);
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
      appBar: AppBar(title: const Text('Scan expiry date')),
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
                'Point your camera at the printed expiry, "best before", or MFG date.',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.md),
              FilledButton.icon(
                onPressed: _busy ? null : _capture,
                icon: const Icon(Icons.camera_alt_outlined),
                label: Text(_rawText == null
                    ? 'Capture date label'
                    : 'Re-scan'),
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
                label: const Text('Pick date manually'),
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
          'Detected dates will appear here.',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
      );
    }
    return ListView(
      children: [
        const Text('Detected dates',
            style: TextStyle(fontWeight: FontWeight.w700)),
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
