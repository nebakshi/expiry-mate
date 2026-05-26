import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/product/domain/entities/product.dart';
import '../../shared/models/product_draft.dart';
import '../../features/product/presentation/screens/confirm_product_screen.dart';
import '../../features/product/presentation/screens/product_detail_screen.dart';
import '../../features/scanner/presentation/screens/scan_barcode_screen.dart';
import '../../features/scanner/presentation/screens/scan_expiry_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

final onboardingSeenProvider = StateProvider<bool>((ref) => true);

/// Loads whether onboarding has been completed before.
final onboardingInitProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final seen = prefs.getBool('onboarding_seen') ?? false;
  ref.read(onboardingSeenProvider.notifier).state = seen;
  return seen;
});

Future<void> markOnboardingSeen() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_seen', true);
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: _AuthRefresh(ref),
    redirect: (context, state) {
      final authAsync = ref.read(authStateProvider);
      final seenOnboarding = ref.read(onboardingSeenProvider);
      final loc = state.matchedLocation;

      // While auth is resolving, stay on splash.
      if (authAsync.isLoading) return loc == '/' ? null : '/';

      final loggedIn = authAsync.valueOrNull != null;

      if (!seenOnboarding && loc != '/onboarding') return '/onboarding';

      if (!loggedIn) {
        return (loc == '/login' || loc == '/onboarding') ? null : '/login';
      }
      // Logged in but sitting on splash/login → go home.
      if (loc == '/' || loc == '/login') return '/home';
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, __) => const _SplashScreen()),
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
      GoRoute(
        path: '/scan-barcode',
        builder: (_, __) => const ScanBarcodeScreen(),
      ),
      GoRoute(
        path: '/scan-expiry',
        builder: (context, state) {
          final draft = state.extra as ProductDraft?;
          return ScanExpiryScreen(draft: draft ?? ProductDraft.empty());
        },
      ),
      GoRoute(
        path: '/confirm',
        builder: (context, state) {
          final draft = state.extra as ProductDraft?;
          return ConfirmProductScreen(draft: draft ?? ProductDraft.empty());
        },
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) =>
            ProductDetailScreen(product: state.extra as Product),
      ),
      GoRoute(path: '/settings', builder: (_, __) => const SettingsScreen()),
    ],
  );
});

/// Bridges Riverpod auth changes to GoRouter's Listenable refresh.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh(Ref ref) {
    ref.listen(authStateProvider, (_, __) => notifyListeners());
    ref.listen(onboardingSeenProvider, (_, __) => notifyListeners());
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/bloom_logo_1024.png', width: 96, height: 96),
            const SizedBox(height: 16),
            const Text('Bloom',
                style:
                    TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
