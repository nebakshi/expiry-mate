import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../product/domain/entities/product.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../../../product/presentation/providers/product_providers.dart';
import '../../../product/presentation/widgets/product_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(inventorySummaryProvider);
    final filtered = ref.watch(filteredInventoryProvider);
    final filter = ref.watch(inventoryFilterProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hi${user?.name != null ? ', ${user!.name!.split(' ').first}' : ''} 👋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/scan-barcode'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.qr_code_scanner_rounded),
        label: const Text('Scan'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _SummaryHeader(
              total: summary.total,
              expiringSoon: summary.expiringSoon,
              expired: summary.expired,
            ),
            _SearchBar(
              onChanged: (v) =>
                  ref.read(searchQueryProvider.notifier).state = v,
            ),
            _FilterChips(
              selected: filter,
              onSelected: (f) =>
                  ref.read(inventoryFilterProvider.notifier).state = f,
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(
              child: filtered.when(
                loading: () =>
                    const Center(child: CircularProgressIndicator()),
                error: (e, _) => ErrorView(message: '$e'),
                data: (products) => _InventoryList(products: products),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader({
    required this.total,
    required this.expiringSoon,
    required this.expired,
  });
  final int total;
  final int expiringSoon;
  final int expired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.sm),
      child: Row(
        children: [
          _StatTile(
              label: 'Tracked',
              value: total,
              color: AppColors.primary,
              icon: Icons.inventory_2_outlined),
          const SizedBox(width: AppSpacing.sm),
          _StatTile(
              label: 'Expiring',
              value: expiringSoon,
              color: AppColors.expiringSoon,
              icon: Icons.timelapse_outlined),
          const SizedBox(width: AppSpacing.sm),
          _StatTile(
              label: 'Expired',
              value: expired,
              color: AppColors.expired,
              icon: Icons.warning_amber_rounded),
        ],
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });
  final String label;
  final int value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(AppSpacing.radius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: AppSpacing.sm),
            Text('$value',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.w800, color: color)),
            Text(label,
                style: const TextStyle(
                    fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.onChanged});
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Search products or brands',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.selected, required this.onSelected});
  final InventoryFilter selected;
  final ValueChanged<InventoryFilter> onSelected;

  static const _labels = {
    InventoryFilter.all: 'All',
    InventoryFilter.fresh: 'Fresh',
    InventoryFilter.expiringSoon: 'Expiring soon',
    InventoryFilter.expired: 'Expired',
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        children: InventoryFilter.values.map((f) {
          final isSel = f == selected;
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: ChoiceChip(
              label: Text(_labels[f]!),
              selected: isSel,
              onSelected: (_) => onSelected(f),
              selectedColor: AppColors.primary.withValues(alpha: 0.15),
              labelStyle: TextStyle(
                color: isSel ? AppColors.primaryDark : AppColors.textPrimary,
                fontWeight: isSel ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _InventoryList extends StatelessWidget {
  const _InventoryList({required this.products});
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return EmptyState(
        icon: Icons.kitchen_outlined,
        title: 'Your kitchen is empty',
        message:
            'Scan your first product to start tracking expiry dates and get timely reminders.',
        action: FilledButton.icon(
          onPressed: () => context.push('/scan-barcode'),
          icon: const Icon(Icons.qr_code_scanner_rounded),
          label: const Text('Scan a product'),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.md, 0, AppSpacing.md, 96),
      itemCount: products.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
      itemBuilder: (_, i) {
        final p = products[i];
        return ProductCard(
          product: p,
          onTap: () => context.push('/product', extra: p),
        );
      },
    );
  }
}
