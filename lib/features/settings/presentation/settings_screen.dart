import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/extensions/date_extensions.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/l10n/locale_provider.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../l10n/app_localizations.dart';
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

  static const _privacyUrl = 'https://bloomapp.io/privacy';
  static const _termsUrl = 'https://bloomapp.io/terms';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final reminders = ref.watch(defaultRemindersProvider);
    final summary = ref.watch(inventorySummaryProvider);

    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        children: [
          _AccountTile(
            name: user?.name ?? (user?.isGuest ?? false ? l10n.guest : l10n.account),
            email: user?.email,
            provider: user?.authProvider ?? '',
            isPremium: user?.isPremium ?? false,
          ),
          _planBanner(context, user?.isPremium ?? false, summary.total),
          _SectionHeader(l10n.appearance),
          _ThemeSelector(ref: ref),
          _LanguageSelector(ref: ref),
          _SectionHeader(l10n.reminders),
          _ReminderDaysTile(
            selected: reminders,
            onChanged: (days) =>
                ref.read(defaultRemindersProvider.notifier).setDays(days),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: Text(l10n.notificationPermission),
            subtitle: Text(l10n.allowBloomAlerts),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _requestNotifications(context, ref),
          ),
          _SectionHeader(l10n.data),
          ListTile(
            leading: const Icon(Icons.download_outlined),
            title: Text(l10n.exportMyData),
            subtitle: Text(l10n.exportSubtitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _exportData(context, ref),
          ),
          _SectionHeader(l10n.about),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.privacyPolicy),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _openUrl(context, _privacyUrl),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined),
            title: Text(l10n.termsAndConditions),
            trailing: const Icon(Icons.open_in_new, size: 18),
            onTap: () => _openUrl(context, _termsUrl),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.version),
            trailing: const Text('1.0.0'),
          ),
          _SectionHeader(l10n.accountActions),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(l10n.signOut),
            onTap: () => _signOut(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.delete_forever_outlined,
                color: AppColors.expired),
            title: Text(l10n.deleteAccount,
                style: const TextStyle(color: AppColors.expired)),
            subtitle: Text(l10n.permanentlyRemovesData),
            onTap: () => _deleteAccount(context, ref),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _planBanner(BuildContext context, bool isPremium, int total) {
    if (isPremium) return const SizedBox.shrink();
    final l10n = context.l10n;
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
                Text(l10n.freePlan,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                Text(
                  '${l10n.freePlanUsage(total, AppConstants.freePlanProductLimit)}'
                  '${remaining > 0 ? ' · ${l10n.itemsLeft(remaining)}' : ' · ${l10n.limitReached}'}',
                  style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
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
    final l10n = context.l10n;
    if (granted) {
      showSuccess(context, l10n.notificationsEnabled);
    } else {
      showError(context, l10n.notificationsOff);
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
    showSuccess(context, context.l10n.exportedItems(products.length));
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      showError(context, context.l10n.couldNotOpenLink);
    }
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.signOutConfirmTitle),
        content: Text(l10n.signOutConfirmMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.signOut)),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(authControllerProvider.notifier).signOut();
    // Router redirect handles navigation back to /login.
  }

  Future<void> _deleteAccount(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.deleteAccountConfirmTitle),
        content: Text(l10n.deleteAccountConfirmMessage),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.expired),
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final ok = await ref.read(authControllerProvider.notifier).deleteAccount();
    if (!context.mounted) return;
    if (ok) {
      showSuccess(context, l10n.accountDeleted);
    } else {
      final state = ref.read(authControllerProvider);
      final msg = state is AsyncError
          ? l10n.reSignInToDelete
          : l10n.couldNotDeleteAccount;
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
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
                const SizedBox(height: 2),
                Text(
                  _providerLabel(context, provider),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 12),
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

  String _providerLabel(BuildContext context, String p) {
    final l10n = context.l10n;
    return switch (p) {
      'google' => l10n.signedInWithGoogle,
      'apple' => l10n.signedInWithApple,
      'guest' => l10n.guestAccount,
      _ => l10n.signedIn,
    };
  }
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
          Text(context.l10n.defaultReminders,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 2),
          Text(
            context.l10n.appliedToNewProducts,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 13),
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

class _ThemeSelector extends StatelessWidget {
  const _ThemeSelector({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final pref = ref.watch(themePreferenceProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.sm),
      child: Row(
        children: [
          const Icon(Icons.palette_outlined),
          const SizedBox(width: AppSpacing.md),
          const Expanded(
            child: Text('Theme', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
          SegmentedButton<ThemePreference>(
            segments: const [
              ButtonSegment(
                value: ThemePreference.system,
                icon: Icon(Icons.settings_brightness, size: 18),
              ),
              ButtonSegment(
                value: ThemePreference.light,
                icon: Icon(Icons.light_mode, size: 18),
              ),
              ButtonSegment(
                value: ThemePreference.dark,
                icon: Icon(Icons.dark_mode, size: 18),
              ),
            ],
            selected: {pref},
            onSelectionChanged: (selection) {
              ref
                  .read(themePreferenceProvider.notifier)
                  .setPreference(selection.first);
            },
            showSelectedIcon: false,
            style: const ButtonStyle(
              visualDensity: VisualDensity.compact,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final current = ref.watch(localeProvider);
    final label = current != null
        ? localeLabels[current.languageCode] ?? current.languageCode
        : 'System';

    return ListTile(
      leading: const Icon(Icons.language),
      title: Text(AppLocalizations.of(context).language),
      trailing: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 120),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
      onTap: () => _showPicker(context),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      builder: (_) => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('System default'),
                onTap: () {
                  ref.read(localeProvider.notifier).clearLocale();
                  Navigator.pop(context);
                },
              ),
              ...supportedLocales.map((locale) => ListTile(
                    title: Text(localeLabels[locale.languageCode] ?? locale.languageCode),
                    onTap: () {
                      ref.read(localeProvider.notifier).setLocale(locale);
                      Navigator.pop(context);
                    },
                  )),
            ],
          ),
        ),
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
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
