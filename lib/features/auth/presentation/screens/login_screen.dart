import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/theme/responsive.dart';
import '../../../../shared/widgets/common_widgets.dart';
import '../providers/auth_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);
    final loading = authState.isLoading;

    ref.listen(authControllerProvider, (_, next) {
      if (next case AsyncError(:final error)) {
        final msg = error is Failure ? error.message : 'Sign-in failed.';
        showError(context, msg);
      }
    });

    final iconSize = Responsive.isSmallDevice ? 48.0 : 64.0;
    final iconPad = Responsive.isSmallDevice ? 16.0 : 24.0;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height -
                  MediaQuery.paddingOf(context).vertical -
                  (Responsive.isSmallDevice ? AppSpacing.md * 2 : AppSpacing.lg * 2),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: Responsive.hp(8)),
                Container(
                  padding: EdgeInsets.all(iconPad),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.eco_rounded,
                      size: iconSize, color: AppColors.primary),
                ),
                SizedBox(height: Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.lg),
                Text(AppConstants.appName,
                    style: TextStyle(
                        fontSize: Responsive.fontSize(28),
                        fontWeight: FontWeight.w800)),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  AppConstants.tagline,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontSize: Responsive.fontSize(15)),
                ),
                SizedBox(height: Responsive.hp(10)),
                _AuthButton(
                  icon: Icons.g_mobiledata_rounded,
                  label: 'Continue with Google',
                  onPressed: loading ? null : controller.signInWithGoogle,
                ),
                if (Platform.isIOS || Platform.isMacOS) ...[
                  const SizedBox(height: AppSpacing.md),
                  _AuthButton(
                    icon: Icons.apple,
                    label: 'Continue with Apple',
                    onPressed: loading ? null : controller.signInWithApple,
                  ),
                ],
                const SizedBox(height: AppSpacing.md),
                OutlinedButton(
                  onPressed: loading ? null : controller.signInAsGuest,
                  child: const Text('Continue as Guest'),
                ),
                SizedBox(height: Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.lg),
                if (loading) const CircularProgressIndicator(),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'By continuing you agree to our Terms and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: Responsive.fontSize(12),
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  const _AuthButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label),
    );
  }
}
