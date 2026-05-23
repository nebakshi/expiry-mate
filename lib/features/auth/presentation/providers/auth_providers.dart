import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/auth_service.dart';
import '../../domain/app_user.dart';
import '../../../../core/errors/failures.dart';

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Streams the current signed-in user (null when signed out).
final authStateProvider = StreamProvider<AppUser?>((ref) {
  return ref.watch(authServiceProvider).authStateChanges();
});

/// Convenience: synchronous current user or null.
final currentUserProvider = Provider<AppUser?>((ref) {
  return ref.watch(authStateProvider).valueOrNull;
});

/// Drives sign-in/out actions and exposes a loading + error surface.
class AuthController extends StateNotifier<AsyncValue<void>> {
  AuthController(this._service) : super(const AsyncData(null));
  final AuthService _service;

  Future<void> signInWithGoogle() => _run(_service.signInWithGoogle);
  Future<void> signInWithApple() => _run(_service.signInWithApple);
  Future<void> signInAsGuest() => _run(_service.signInAsGuest);

  Future<void> signOut() async {
    state = const AsyncLoading();
    await _service.signOut();
    state = const AsyncData(null);
  }

  Future<bool> deleteAccount() async {
    state = const AsyncLoading();
    final res = await _service.deleteAccount();
    switch (res) {
      case Success():
        state = const AsyncData(null);
        return true;
      case Err(:final failure):
        state = AsyncError(failure, StackTrace.current);
        return false;
    }
  }

  Future<void> _run(Future<Result<AppUser>> Function() action) async {
    state = const AsyncLoading();
    final res = await action();
    switch (res) {
      case Success():
        state = const AsyncData(null);
      case Err(:final failure):
        state = AsyncError(failure, StackTrace.current);
    }
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<void>>((ref) {
  return AuthController(ref.watch(authServiceProvider));
});
