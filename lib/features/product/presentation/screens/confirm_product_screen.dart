import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/theme/responsive.dart';
import '../../../../shared/models/product_draft.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../settings/presentation/settings_screen.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_enums.dart';
import '../providers/product_providers.dart';

class ConfirmProductScreen extends ConsumerStatefulWidget {
  const ConfirmProductScreen({super.key, required this.draft});
  final ProductDraft draft;

  @override
  ConsumerState<ConfirmProductScreen> createState() =>
      _ConfirmProductScreenState();
}

class _ConfirmProductScreenState extends ConsumerState<ConfirmProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _name;
  late TextEditingController _brand;
  late TextEditingController _quantity;
  late ProductCategory _category;
  late StorageLocation _storage;
  late DateTime _expiry;
  late List<int> _reminders;

  @override
  void initState() {
    super.initState();
    final d = widget.draft;
    _name = TextEditingController(text: d.productName ?? '');
    _brand = TextEditingController(text: d.brand ?? '');
    _quantity = TextEditingController(text: '${d.quantity}');
    _category = d.category;
    _storage = d.storageLocation;
    _expiry = d.expiryDate ?? DateTime.now().add(const Duration(days: 7));
    _reminders = List.of(ref.read(defaultRemindersProvider));
  }

  @override
  void dispose() {
    _name.dispose();
    _brand.dispose();
    _quantity.dispose();
    super.dispose();
  }

  Future<void> _pickExpiry() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiry,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (picked != null) setState(() => _expiry = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final user = ref.read(currentUserProvider);
    if (user == null) {
      showError(context, 'You are not signed in.');
      return;
    }
    final now = DateTime.now();
    final product = Product(
      id: '',
      userId: user.uid,
      productName: _name.text.trim(),
      brand: _brand.text.trim().isEmpty ? null : _brand.text.trim(),
      barcode: widget.draft.barcode,
      imageUrl: widget.draft.imageUrl,
      category: _category,
      storageLocation: _storage,
      quantity: int.tryParse(_quantity.text.trim()) ?? 1,
      unit: widget.draft.unit,
      expiryDate: _expiry,
      ocrRawText: widget.draft.ocrRawText,
      parsedBy: widget.draft.parsedBy,
      reminderDaysBefore: _reminders..sort((a, b) => b.compareTo(a)),
      createdAt: now,
      updatedAt: now,
    );

    final saved = await ref.read(productControllerProvider.notifier).save(product);
    if (!mounted) return;
    if (saved != null) {
      final msg = saved.quantity > product.quantity
          ? '${saved.productName} quantity updated to ${saved.quantity}.'
          : '${saved.productName} saved. Reminders set.';
      showSuccess(context, msg);
      context.go('/home');
    } else {
      final err = ref.read(productControllerProvider);
      if (err case AsyncError(:final error)) {
        showError(context, error is Failure ? error.message : '$error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final saving = ref.watch(productControllerProvider).isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Confirm details')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              _label('Product name'),
              TextFormField(
                controller: _name,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                    hintText: 'e.g. Amul Butter'),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Please enter a product name'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              _label('Brand (optional)'),
              TextFormField(
                controller: _brand,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(hintText: 'e.g. Amul'),
              ),
              const SizedBox(height: AppSpacing.md),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label('Category'),
                        DropdownButtonFormField<ProductCategory>(
                          value: _category,
                          isExpanded: true,
                          isDense: Responsive.isSmallDevice,
                          style: TextStyle(fontSize: Responsive.fontSize(14), color: Theme.of(context).colorScheme.onSurface),
                          items: ProductCategory.values
                              .map((c) => DropdownMenuItem(
                                    value: c,
                                    child: Text(c.label),
                                  ))
                              .toList(),
                          onChanged: (v) =>
                              setState(() => _category = v ?? _category),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Responsive.isSmallDevice ? AppSpacing.sm : AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _label('Storage'),
                        DropdownButtonFormField<StorageLocation>(
                          value: _storage,
                          isExpanded: true,
                          isDense: Responsive.isSmallDevice,
                          style: TextStyle(fontSize: Responsive.fontSize(14), color: Theme.of(context).colorScheme.onSurface),
                          items: StorageLocation.values
                              .map((s) => DropdownMenuItem(
                                    value: s,
                                    child: Text(s.label),
                                  ))
                              .toList(),
                          onChanged: (v) =>
                              setState(() => _storage = v ?? _storage),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              _label('Quantity'),
              TextFormField(
                controller: _quantity,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: '1'),
              ),
              const SizedBox(height: AppSpacing.md),
              _label('Expiry date'),
              InkWell(
                onTap: _pickExpiry,
                borderRadius: BorderRadius.circular(12),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today_outlined),
                  ),
                  child: Text(
                    '${_expiry.displayDate}  ·  ${_expiry.daysLeftLabel}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              _label('Remind me'),
              _ReminderSelector(
                selected: _reminders,
                onChanged: (r) => setState(() => _reminders = r),
              ),
              const SizedBox(height: AppSpacing.xl),
              FilledButton(
                onPressed: saving ? null : _save,
                child: saving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white))
                    : const Text('Save product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14)),
      );
}

class _ReminderSelector extends StatelessWidget {
  const _ReminderSelector({required this.selected, required this.onChanged});
  final List<int> selected;
  final ValueChanged<List<int>> onChanged;

  static const _options = [0, 1, 2, 3, 7, 14, 30];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: _options.map((days) {
        final isSel = selected.contains(days);
        return FilterChip(
          label: Text(days.reminderLabel),
          selected: isSel,
          onSelected: (sel) {
            final next = List<int>.of(selected);
            if (sel) {
              next.add(days);
            } else {
              next.remove(days);
            }
            if (next.isEmpty) next.add(0); // always keep at least one
            onChanged(next);
          },
          selectedColor: AppColors.primary.withValues(alpha: 0.15),
        );
      }).toList(),
    );
  }
}
