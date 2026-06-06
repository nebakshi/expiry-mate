import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/extensions/date_extensions.dart';
import '../../../../core/theme/responsive.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../recipes/presentation/recipe_providers.dart';
import '../../../scanner/presentation/scanner_providers.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/product_enums.dart';
import '../providers/product_providers.dart';

/// PLAN §7.9 — Product detail. Supports edit (→ confirm flow), delete,
/// mark consumed, change reminders, and add/edit a note.
class ProductDetailScreen extends ConsumerStatefulWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  late Product _product;

  @override
  void initState() {
    super.initState();
    _product = widget.product;
  }

  /// Keeps the local copy in sync with the live inventory stream so that, after
  /// an edit elsewhere, this screen reflects the latest values.
  Product get _live {
    final list = ref.watch(inventoryStreamProvider).valueOrNull;
    if (list == null) return _product;
    return list.firstWhere(
      (p) => p.id == _product.id,
      orElse: () => _product,
    );
  }

  bool get _busy => ref.watch(productControllerProvider).isLoading;

  @override
  Widget build(BuildContext context) {
    final p = _live;
    final status = p.status;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
        actions: [
          IconButton(
            tooltip: 'Edit',
            icon: const Icon(Icons.edit_outlined),
            onPressed: _busy ? null : () => _edit(p),
          ),
          IconButton(
            tooltip: 'Delete',
            icon: const Icon(Icons.delete_outline),
            onPressed: _busy ? null : () => _confirmDelete(p),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _Header(product: p),
          const SizedBox(height: AppSpacing.lg),
          _ExpiryCard(product: p),
          const SizedBox(height: AppSpacing.lg),
          _DetailsCard(product: p),
          const SizedBox(height: AppSpacing.lg),
          _NutritionCard(
            product: p,
            enabled: !_busy,
            onScan: () => _scanNutrition(p),
          ),
          const SizedBox(height: AppSpacing.lg),
          _RecipeButton(productName: p.productName),
          const SizedBox(height: AppSpacing.lg),
          _RemindersCard(
            selected: p.reminderDaysBefore,
            enabled: !_busy && status != ProductStatus.consumed,
            onChanged: (days) => _updateReminders(p, days),
          ),
          const SizedBox(height: AppSpacing.lg),
          _NoteCard(
            note: p.note,
            enabled: !_busy,
            onEdit: () => _editNote(p),
          ),
          const SizedBox(height: AppSpacing.xl),
          _ConsumeButton(
            isConsumed: status == ProductStatus.consumed,
            busy: _busy,
            onPressed: () => _toggleConsumed(p),
          ),
        ],
      ),
    );
  }

  Future<void> _edit(Product p) async {
    final edited = await showModalBottomSheet<Product>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) => _EditSheet(product: p),
    );
    if (edited == null) return;
    final ok = await ref.read(productControllerProvider.notifier).update(
          edited.copyWith(updatedAt: DateTime.now()),
        );
    if (!mounted) return;
    if (ok) {
      setState(() => _product = edited);
      showSuccess(context, 'Product updated');
    } else {
      showError(context, 'Could not update product');
    }
  }

  Future<void> _updateReminders(Product p, List<int> days) async {
    final ok = await ref
        .read(productControllerProvider.notifier)
        .update(p.copyWith(reminderDaysBefore: days, updatedAt: DateTime.now()));
    if (!mounted) return;
    if (ok) {
      setState(() => _product = p.copyWith(reminderDaysBefore: days));
      showSuccess(context, 'Reminders updated');
    } else {
      showError(context, 'Could not update reminders');
    }
  }

  Future<void> _editNote(Product p) async {
    final controller = TextEditingController(text: p.note ?? '');
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Note'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: 'e.g. opened, keep in door shelf…',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, controller.text.trim()),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (result == null) return;
    final ok = await ref.read(productControllerProvider.notifier).update(
          p.copyWith(
            note: result.isEmpty ? null : result,
            updatedAt: DateTime.now(),
          ),
        );
    if (!mounted) return;
    if (ok) {
      setState(() => _product = p.copyWith(note: result.isEmpty ? null : result));
      showSuccess(context, 'Note saved');
    } else {
      showError(context, 'Could not save note');
    }
  }

  Future<void> _toggleConsumed(Product p) async {
    final markConsumed = p.status != ProductStatus.consumed;
    final ok = await ref
        .read(productControllerProvider.notifier)
        .markConsumed(p, markConsumed);
    if (!mounted) return;
    if (ok) {
      setState(() => _product = p.copyWith(isConsumed: markConsumed));
      showSuccess(
        context,
        markConsumed ? 'Marked as consumed' : 'Moved back to inventory',
      );
    } else {
      showError(context, 'Could not update status');
    }
  }

  Future<void> _scanNutrition(Product p) async {
    final picker = ImagePicker();
    final shot = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 90,
    );
    if (shot == null || !mounted) return;

    final ocrRes =
        await ref.read(ocrServiceProvider).recogniseFromFile(shot.path);
    if (!mounted) return;

    switch (ocrRes) {
      case Success(:final value):
        final data = ref.read(nutritionParserProvider).parse(value);
        if (data == null) {
          showError(context,
              'Could not detect nutrition info. Try with clearer focus.');
          return;
        }
        final updated = p.copyWith(
          calories: data.calories,
          protein: data.protein,
          fat: data.fat,
          carbs: data.carbs,
          fiber: data.fiber,
          sugar: data.sugar,
          nutritionSource: 'OCR',
          updatedAt: DateTime.now(),
        );
        final ok =
            await ref.read(productControllerProvider.notifier).update(updated);
        if (!mounted) return;
        if (ok) {
          setState(() => _product = updated);
          showSuccess(context, 'Nutrition info updated');
        } else {
          showError(context, 'Could not save nutrition data');
        }
      case Err(:final failure):
        showError(context, failure.message);
    }
  }

  Future<void> _confirmDelete(Product p) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete product?'),
        content: Text(
          '“${p.productName}” and its reminders will be removed permanently.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.expired),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await ref.read(productControllerProvider.notifier).delete(p);
    if (!mounted) return;
    if (ok) {
      showSuccess(context, 'Product deleted');
      context.pop();
    } else {
      showError(context, 'Could not delete product');
    }
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final imgSize = Responsive.isSmallDevice ? 56.0 : 72.0;
    final imgIconSize = Responsive.isSmallDevice ? 26.0 : 34.0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: imgSize,
          height: imgSize,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            image: product.imageUrl != null
                ? DecorationImage(
                    image: NetworkImage(product.imageUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: product.imageUrl == null
              ? Icon(product.category.icon,
                  size: imgIconSize, color: AppColors.primary)
              : null,
        ),
        SizedBox(width: Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.productName,
                style: TextStyle(
                    fontSize: Responsive.fontSize(19),
                    fontWeight: FontWeight.w800),
              ),
              if (product.brand != null && product.brand!.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  product.brand!,
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              StatusBadge(product.status),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExpiryCard extends StatelessWidget {
  const _ExpiryCard({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final status = product.status;
    return _Card(
      child: Row(
        children: [
          Icon(Icons.event_outlined, color: status.color),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.expiryDate.displayDate,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              const SizedBox(height: 2),
              Text(
                product.expiryDate.daysLeftLabel,
                style: TextStyle(color: status.color, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    return _Card(
      child: Column(
        children: [
          _row(Icons.category_outlined, 'Category', product.category.label, muted),
          _divider(),
          _row(Icons.place_outlined, 'Storage', product.storageLocation.label, muted),
          _divider(),
          _row(Icons.numbers_outlined, 'Quantity',
              '${product.quantity} ${product.unit}', muted),
          if (product.manufacturingDate != null) ...[
            _divider(),
            _row(Icons.precision_manufacturing_outlined, 'Manufactured',
                product.manufacturingDate!.displayDate, muted),
          ],
          if (product.barcode != null && product.barcode!.isNotEmpty) ...[
            _divider(),
            _row(Icons.qr_code_2_outlined, 'Barcode', product.barcode!, muted),
          ],
          _divider(),
          _row(Icons.fact_check_outlined, 'Date source',
              _sourceLabel(product.parsedBy), muted),
        ],
      ),
    );
  }

  String _sourceLabel(String parsedBy) => switch (parsedBy.toUpperCase()) {
        'OCR' => 'Scanned (OCR)',
        'API' => 'Product database',
        _ => 'Entered manually',
      };

  Widget _divider() => const Divider(height: AppSpacing.lg);

  Widget _row(IconData icon, String label, String value, Color mutedColor) {
    return Row(
      children: [
        Icon(icon, size: 20, color: mutedColor),
        const SizedBox(width: AppSpacing.md),
        Text(label, style: TextStyle(color: mutedColor)),
        const Spacer(),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

class _RemindersCard extends StatelessWidget {
  const _RemindersCard({
    required this.selected,
    required this.enabled,
    required this.onChanged,
  });

  final List<int> selected;
  final bool enabled;
  final ValueChanged<List<int>> onChanged;

  static const _options = [0, 1, 2, 3, 7, 14, 30];

  @override
  Widget build(BuildContext context) {
    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Reminders',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
          const SizedBox(height: AppSpacing.sm),
          Opacity(
            opacity: enabled ? 1 : 0.5,
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: _options.map((days) {
                final isSel = selected.contains(days);
                return FilterChip(
                  label: Text(days.reminderLabel),
                  selected: isSel,
                  onSelected: enabled
                      ? (sel) {
                          final next = List<int>.of(selected);
                          if (sel) {
                            next.add(days);
                          } else {
                            next.remove(days);
                          }
                          if (next.isEmpty) next.add(0);
                          onChanged(next..sort());
                        }
                      : null,
                  selectedColor: AppColors.primary.withValues(alpha: 0.15),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  const _NoteCard({
    required this.note,
    required this.enabled,
    required this.onEdit,
  });

  final String? note;
  final bool enabled;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final hasNote = note != null && note!.isNotEmpty;
    final colors = Theme.of(context).colorScheme;
    return _Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.sticky_note_2_outlined,
              size: 20, color: colors.onSurfaceVariant),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Note',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                Text(
                  hasNote ? note! : 'No note yet.',
                  style: TextStyle(
                    color: hasNote
                        ? colors.onSurface
                        : colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: enabled ? onEdit : null,
            child: Text(hasNote ? 'Edit' : 'Add'),
          ),
        ],
      ),
    );
  }
}

class _RecipeButton extends ConsumerWidget {
  const _RecipeButton({required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quota = ref.watch(recipeQuotaProvider);
    final hasQuota = quota.valueOrNull ?? false;
    if (!hasQuota) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => context.push('/recipes', extra: [productName]),
        icon: const Icon(Icons.restaurant_outlined, size: 18),
        label: const Text('Get recipe ideas'),
      ),
    );
  }
}

class _NutritionCard extends StatelessWidget {
  const _NutritionCard({
    required this.product,
    required this.enabled,
    required this.onScan,
  });

  final Product product;
  final bool enabled;
  final VoidCallback onScan;

  @override
  Widget build(BuildContext context) {
    final hasData = product.hasNutrition;
    final colors = Theme.of(context).colorScheme;

    return _Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.local_fire_department_outlined,
                  size: 20, color: colors.onSurfaceVariant),
              const SizedBox(width: AppSpacing.sm),
              const Expanded(
                child: Text('Nutrition',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              ),
              TextButton.icon(
                onPressed: enabled ? onScan : null,
                icon: Icon(hasData ? Icons.refresh : Icons.camera_alt_outlined,
                    size: 16),
                label: Text(hasData ? 'Update' : 'Scan label'),
              ),
            ],
          ),
          if (hasData) ...[
            if (product.nutritionSource != null)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Text(
                  'Per ${product.nutritionPer} · Source: ${_sourceLabel(product.nutritionSource!)}',
                  style: TextStyle(fontSize: 12, color: colors.onSurfaceVariant),
                ),
              ),
            _NutritionRow(
              items: [
                if (product.calories != null)
                  _NutrientItem('Calories', '${product.calories!.toStringAsFixed(0)}', 'kcal'),
                if (product.protein != null)
                  _NutrientItem('Protein', product.protein!.toStringAsFixed(1), 'g'),
                if (product.fat != null)
                  _NutrientItem('Fat', product.fat!.toStringAsFixed(1), 'g'),
              ],
            ),
            if (product.carbs != null || product.fiber != null || product.sugar != null) ...[
              const SizedBox(height: AppSpacing.sm),
              _NutritionRow(
                items: [
                  if (product.carbs != null)
                    _NutrientItem('Carbs', product.carbs!.toStringAsFixed(1), 'g'),
                  if (product.fiber != null)
                    _NutrientItem('Fiber', product.fiber!.toStringAsFixed(1), 'g'),
                  if (product.sugar != null)
                    _NutrientItem('Sugar', product.sugar!.toStringAsFixed(1), 'g'),
                ],
              ),
            ],
          ] else
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(
                'No nutrition data yet.',
                style: TextStyle(color: colors.onSurfaceVariant),
              ),
            ),
        ],
      ),
    );
  }

  String _sourceLabel(String source) => switch (source.toUpperCase()) {
        'API' => 'Product database',
        'OCR' => 'Scanned',
        _ => 'Manual',
      };
}

class _NutrientItem {
  const _NutrientItem(this.label, this.value, this.unit);
  final String label;
  final String value;
  final String unit;
}

class _NutritionRow extends StatelessWidget {
  const _NutritionRow({required this.items});
  final List<_NutrientItem> items;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map((item) => Expanded(
                child: Column(
                  children: [
                    Text(
                      '${item.value}${item.unit}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

class _ConsumeButton extends StatelessWidget {
  const _ConsumeButton({
    required this.isConsumed,
    required this.busy,
    required this.onPressed,
  });

  final bool isConsumed;
  final bool busy;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton.icon(
        onPressed: busy ? null : onPressed,
        icon: Icon(isConsumed
            ? Icons.undo_rounded
            : Icons.check_circle_outline_rounded),
        label: Text(
          isConsumed ? 'Move back to inventory' : 'Mark as consumed',
          style: TextStyle(fontSize: Responsive.fontSize(14)),
        ),
        style: FilledButton.styleFrom(
          padding: EdgeInsets.symmetric(
              vertical: Responsive.isSmallDevice ? 10 : 14),
          backgroundColor:
              isConsumed ? AppColors.textSecondary : AppColors.primary,
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final pad = Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.lg;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(pad),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}

/// Inline editor for the core editable fields. Returns an updated [Product]
/// (same id) via Navigator.pop, or null on cancel.
class _EditSheet extends StatefulWidget {
  const _EditSheet({required this.product});
  final Product product;

  @override
  State<_EditSheet> createState() => _EditSheetState();
}

class _EditSheetState extends State<_EditSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _brand;
  late final TextEditingController _quantity;
  late ProductCategory _category;
  late StorageLocation _storage;
  late DateTime _expiry;

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    _name = TextEditingController(text: p.productName);
    _brand = TextEditingController(text: p.brand ?? '');
    _quantity = TextEditingController(text: '${p.quantity}');
    _category = p.category;
    _storage = p.storageLocation;
    _expiry = p.expiryDate;
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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final updated = widget.product.copyWith(
      productName: _name.text.trim(),
      brand: _brand.text.trim().isEmpty ? null : _brand.text.trim(),
      category: _category,
      storageLocation: _storage,
      quantity: int.tryParse(_quantity.text.trim()) ?? 1,
      expiryDate: _expiry,
    );
    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(
          AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.lg + bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Edit product',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _name,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Product name',
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _brand,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Brand (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<ProductCategory>(
                    initialValue: _category,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    items: ProductCategory.values
                        .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c.label),
                            ))
                        .toList(),
                    onChanged: (c) =>
                        setState(() => _category = c ?? _category),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DropdownButtonFormField<StorageLocation>(
                    initialValue: _storage,
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Storage',
                      border: OutlineInputBorder(),
                    ),
                    items: StorageLocation.values
                        .map((s) => DropdownMenuItem(
                              value: s,
                              child: Text(s.label),
                            ))
                        .toList(),
                    onChanged: (s) => setState(() => _storage = s ?? _storage),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _quantity,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: InkWell(
                    onTap: _pickExpiry,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Expiry date',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(_expiry.displayDate),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _submit,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Save changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
