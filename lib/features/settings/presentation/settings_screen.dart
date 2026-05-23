import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/extensions/date_extensions.dart';
import '../../../shared/widgets/common_widgets.dart';
import '../../auth/presentation/providers/auth_providers.dart';
import '../../product/presentation/providers/product_providers.dart';

/// Persisted default reminder schedule (days-before-expiry) applied to new
/// products. Falls back to [AppConstants.defaultReminderDaysBefore].
final defaultRemindersProvider =
    StateNotifierProvider<DefaultRemindersController, List<int>>((ref) {
  return DefaultRemindersController();
});

class DefaultRemindersController extends StateNotifier<List<int>> {
  DefaultRemindersController()
      : super(AppConstants.defaultReminderDaysBefore) {
    _load();
  }

  static const _key = 'default_reminder_days';

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key);
    if (raw != null && raw.isNotEmpty) {
      state = raw.map(int.parse).toList()..sort();
    }
  }

  Future<void> setDays(List<int> days) async {
    final next = days.isEmpty ? [0] : (days.toSet().toList()..sort());
    state = next;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, next.map((e) => '$e').toList());
  }
}

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  static const _privacyUrl = 'https://expirymate.app/privacy';
  static const _termsUrl = 'https://expirymate.app/terms';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final reminders = ref.watch(defaultRemindersProvider);
    final summary = ref.watch(inventorySummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _AccountTile(
            name: user?.name ?? (user?.isGuest ?? false ? 'Guest' : 'Account'),
            email: user?.email,
            provider: user?.authProvider ?? '',
            isPremium: user?.isPremium ?? false,
          ),
          _planBanner(context, user?.isPremium ?? false, summary.total),
          const _SectionHeader('Reminders'),
          _ReminderDaysTile(
            selected: reminders,
            onChanged: (days) =>
                ref.read(defaultRemindersProvider.notifier).setDays(days),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: const Text('Notification permission'),
            subtitle: const Text('Allow ExpiryMate to send expiry alerts'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _requestNotifications(context, ref),
          ),
          const _SectionHeader('Data'),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: const Text('Export my data'),
            subtitle: const Text('Copy your inventory as JSON'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _exportData(context, ref),
          ),
          const _SectionHeader('About'),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy policy'),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _openUrl(context, _privacyUrl),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: const Text('Terms & conditions'),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _openUrl(context, _termsUrl),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Version'),
            trailing: Text('1.0.0'),
          ),
          const _SectionHeader('Account actions'),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign out'),
            onTap: () => _signOut(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever_outlined,
                color: AppColors.expired),
            title: const Text('Delete account',
                style: TextStyle(color: AppColors.expired)),
            subtitle: const Text('Permanently removes your data'),
            onTap: () => _deleteAccount(context, ref),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _planBanner(BuildContext context, bool isPremium, int total) {
    if (isPremium) return const SizedBox.shrink();
    final remaining = AppConstants.freePlanProductLimit - total;
    return Container(
      margin: const EdgeInsets.all(AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_outline, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Free plan',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                Text(
                  '$total of ${AppConstants.freePlanProductLimit} items used'
                  '${remaining > 0 ? ' · $remaining left' : ' · limit reached'}',
                  style: const TextStyle(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _requestNotifications(
      BuildContext context, WidgetRef ref) async {
    final granted =
        await ref.read(notificationServiceProvider).requestPermission();
    if (!context.mounted) return;
    if (granted) {
      showSuccess(context, 'Notifications enabled');
    } else {
      showError(context,
          'Notifications are off. Enable them in your device settings.');
    }
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final products = ref.read(inventoryStreamProvider).valueOrNull ?? const [];
    final payload = {
      'app': AppConstants.appName,
      'exportedAt': DateTime.now().toIso8601String(),
      'count': products.length,
      'products': products.map((p) => p.toFirestore()).toList(),
    };
    final json = const JsonEncoder.withIndent('  ').convert(payload);
    await Clipboard.setData(ClipboardData(text: json));
    if (!context.mounted) return;
    showSuccess(context, 'Exported ${products.length} items to clipboard');
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      showError(context, 'Could not open link');
    }
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text('You can sign back in anytime.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Sign out')),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(authControllerProvider.notifier).signOut();
    // Router redirect handles navigation back to /login.
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete account?'),
        content: const Text(
          'This permanently deletes your account and all saved products. '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.expired),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await ref.read(authControllerProvider.notifier).deleteAccount();
    if (!context.mounted) return;
    if (ok) {
      showSuccess(context, 'Account deleted');
    } else {
      final state = ref.read(authControllerProvider);
      final msg = state is AsyncError
          ? 'Please sign in again, then retry deleting your account.'
          : 'Could not delete account';
      showError(context, msg);
    }
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({
    required this.name,
    required this.email,
    required this.provider,
    required this.isPremium,
  });

  final String name;
  final String? email;
  final String provider;
  final bool isPremium;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primary.withValues(alpha: 0.12),
            child: const Icon(Icons.person, color: AppColors.primary, size: 30),
          ),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700)),
                if (email != null && email!.isNotEmpty)
                  Text(email!,
                      style: const TextStyle(color: AppColors.textSecondary)),
                const SizedBox(height: 2),
                Text(
                  _providerLabel(provider),
                  style: const TextStyle(
                      color: AppColors.textSecondary, fontSize: 12),
                ),
              ],
            ),
          ),
          if (isPremium)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text('PRO',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: Color(0xFF8A6D00))),
            ),
        ],
      ),
    );
  }

  String _providerLabel(String p) => switch (p) {
        'google' => 'Signed in with Google',
        'apple' => 'Signed in with Apple',
        'guest' => 'Guest account',
        _ => 'Signed in',
      };
}

class _ReminderDaysTile extends StatelessWidget {
  const _ReminderDaysTile({required this.selected, required this.onChanged});

  final List<int> selected;
  final ValueChanged<List<int>> onChanged;

  static const _options = [0, 1, 2, 3, 7, 14, 30];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Default reminders',
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          const Text(
            'Applied to new products you add',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
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
                  onChanged(next);
                },
                selectedColor: AppColors.primary.withValues(alpha: 0.15),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.lg, AppSpacing.lg, AppSpacing.sm),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
