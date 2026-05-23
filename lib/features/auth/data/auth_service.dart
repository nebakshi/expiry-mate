import 'dart:io' show Platform;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/errors/failures.dart';
import '../domain/app_user.dart';

/// PLAN §15.1 — handles all authentication flows and writes the user profile
/// document to Firestore on first sign-in.
class AuthService {
  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    GoogleSignIn? googleSignIn,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _db = firestore ?? FirebaseFirestore.instance,
        _google = googleSignIn ?? GoogleSignIn();

  final FirebaseAuth _auth;
  final FirebaseFirestore _db;
  final GoogleSignIn _google;

  /// Emits the current [AppUser] or null when signed out.
  Stream<AppUser?> authStateChanges() =>
      _auth.authStateChanges().map(_mapFirebaseUser);

  AppUser? get currentUser => _mapFirebaseUser(_auth.currentUser);

  AppUser? _mapFirebaseUser(User? u) {
    if (u == null) return null;
    final provider = u.isAnonymous
        ? 'guest'
        : (u.providerData.isNotEmpty
            ? _providerLabel(u.providerData.first.providerId)
            : 'unknown');
    return AppUser(
      uid: u.uid,
      name: u.displayName,
      email: u.email,
      photoUrl: u.photoURL,
      authProvider: provider,
      isGuest: u.isAnonymous,
    );
  }

  String _providerLabel(String id) {
    if (id.contains('google')) return 'google';
    if (id.contains('apple')) return 'apple';
    return id;
  }

  Future<Result<AppUser>> signInWithGoogle() async {
    try {
      final account = await _google.signIn();
      if (account == null) {
        return const Err(AuthFailure('Sign-in cancelled.'));
      }
      final googleAuth = await account.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final cred = await _auth.signInWithCredential(credential);
      final user = _mapFirebaseUser(cred.user)!;
      await _ensureUserDoc(user);
      return Success(user);
    } on FirebaseAuthException catch (e) {
      return Err(AuthFailure(e.message ?? 'Google sign-in failed.'));
    } catch (_) {
      return const Err(UnknownFailure('Could not sign in with Google.'));
    }
  }

  Future<Result<AppUser>> signInWithApple() async {
    if (!Platform.isIOS && !Platform.isMacOS) {
      return const Err(AuthFailure('Apple Sign-In is only available on iOS.'));
    }
    try {
      final appleCred = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oauth = OAuthProvider('apple.com').credential(
        idToken: appleCred.identityToken,
        accessToken: appleCred.authorizationCode,
      );
      final cred = await _auth.signInWithCredential(oauth);
      final fullName = [appleCred.givenName, appleCred.familyName]
          .whereType<String>()
          .join(' ')
          .trim();
      var user = _mapFirebaseUser(cred.user)!;
      if (user.name == null && fullName.isNotEmpty) {
        await cred.user?.updateDisplayName(fullName);
        user = AppUser(
          uid: user.uid,
          name: fullName,
          email: user.email ?? appleCred.email,
          photoUrl: user.photoUrl,
          authProvider: 'apple',
        );
      }
      await _ensureUserDoc(user);
      return Success(user);
    } on SignInWithAppleAuthorizationException {
      return const Err(AuthFailure('Apple sign-in cancelled.'));
    } catch (_) {
      return const Err(UnknownFailure('Could not sign in with Apple.'));
    }
  }

  Future<Result<AppUser>> signInAsGuest() async {
    try {
      final cred = await _auth.signInAnonymously();
      final user = _mapFirebaseUser(cred.user)!;
      await _ensureUserDoc(user);
      return Success(user);
    } catch (_) {
      return const Err(UnknownFailure('Could not start guest session.'));
    }
  }

  Future<void> signOut() async {
    await _google.signOut();
    await _auth.signOut();
  }

  /// PLAN §15.1 / §12 — delete account: removes products subcollection,
  /// the user doc, then the auth record.
  Future<Result<void>> deleteAccount() async {
    final u = _auth.currentUser;
    if (u == null) return const Err(AuthFailure('Not signed in.'));
    try {
      final userRef = _db.collection(AppConstants.usersCollection).doc(u.uid);
      final products = await userRef
          .collection(AppConstants.productsCollection)
          .get();
      final batch = _db.batch();
      for (final doc in products.docs) {
        batch.delete(doc.reference);
      }
      batch.delete(userRef);
      await batch.commit();
      await u.delete();
      await _google.signOut();
      return const Success(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return const Err(
            AuthFailure('Please sign in again before deleting your account.'));
      }
      return Err(AuthFailure(e.message ?? 'Could not delete account.'));
    } catch (_) {
      return const Err(UnknownFailure('Could not delete account.'));
    }
  }

  Future<void> _ensureUserDoc(AppUser user) async {
    final now = DateTime.now();
    final ref = _db.collection(AppConstants.usersCollection).doc(user.uid);
    final snap = await ref.get();
    if (!snap.exists) {
      await ref.set({
        ...user.toFirestore(now),
        'createdAt': now.toIso8601String(),
      });
    } else {
      await ref.set(user.toFirestore(now), SetOptions(merge: true));
    }
  }
}
