import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class ExpiryMateApp extends ConsumerWidget {
  const ExpiryMateApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Kick off onboarding-flag load (router reads the resulting state).
    ref.watch(onboardingInitProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}
