// GENERATED-STYLE PLACEHOLDER — DO NOT SHIP AS-IS.
//
// This file is normally produced by the FlutterFire CLI. After cloning the
// project, run:
//
//     dart pub global activate flutterfire_cli
//     flutterfire configure
//
// That command overwrites this file with the real configuration for your
// Firebase project (API keys, app IDs, sender IDs, etc.). The values below are
// intentionally non-functional so the project compiles before you connect your
// own Firebase project. The app will throw at startup until you replace them.
//
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not configured for this platform. '
          'Run `flutterfire configure` to generate the real file.',
        );
    }
  }

  // ---- Replace every REPLACE_ME value via `flutterfire configure`. ----

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXchqj-mPhAKNikNOktiLBolstVB4Nj5Q',
    appId: '1:1008474720622:android:4b6635a085689eb3d0197f',
    messagingSenderId: '1008474720622',
    projectId: 'expiry-ecosystem',
    storageBucket: 'expiry-ecosystem.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAdtiHWfXKWD2iYGxprfTbbP-6RtZ-txms',
    appId: '1:1008474720622:ios:4c05e6c0857bb0b4d0197f',
    messagingSenderId: '1008474720622',
    projectId: 'expiry-ecosystem',
    storageBucket: 'expiry-ecosystem.firebasestorage.app',
    iosClientId: '1008474720622-eg3c0a4ph3v73rgnb2hj15mjehu5dfjk.apps.googleusercontent.com',
    iosBundleId: 'app.expirymate.expiryMate',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'REPLACE_ME',
    appId: 'REPLACE_ME',
    messagingSenderId: 'REPLACE_ME',
    projectId: 'REPLACE_ME',
    authDomain: 'REPLACE_ME',
    storageBucket: 'REPLACE_ME',
  );
}
