import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/errors/failures.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.10),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.eco_rounded,
                    size: 64, color: AppColors.primary),
              ),
              const SizedBox(height: AppSpacing.lg),
              const Text(AppConstants.appName,
                  style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                AppConstants.tagline,
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, fontSize: 15),
              ),
              const Spacer(),
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
              const SizedBox(height: AppSpacing.lg),
              if (loading) const CircularProgressIndicator(),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'By continuing you agree to our Terms and Privacy Policy.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
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
