# ExpiryMate

The fastest expiry-date reminder app for Indian kitchens. Scan a barcode, scan
the expiry date, confirm, and ExpiryMate reminds you before food, medicine, or
cosmetics expire — so nothing gets wasted.

Built with Flutter + Riverpod + Firebase, implementing the full product spec in
`PLAN.md` (all P0 MVP features plus the P1 essentials: categories, search and
filters, product detail, and settings).

---

## Core flow

`Scan barcode → detect product → scan expiry → confirm → save → remind`

- **Barcode scanning** via ML Kit (EAN-13/8, UPC-A/E, Code 128/39).
- **Product lookup** via the free [Open Food Facts](https://world.openfoodfacts.org)
  API (no key needed), cached in Firestore (`barcode_cache`) to cut repeat calls.
- **Expiry OCR** via ML Kit text recognition, parsed by a pure-Dart,
  India-first parser (`DD/MM/YYYY` preferred; handles `EXP`, `USE BY`,
  `BEST BEFORE`/`BB`, `MFG`/`PKD` + "best before N months" duration math,
  `MON YYYY`, and `MM/YYYY`).
- **Reminders** via `flutter_local_notifications`, scheduled at 9:00 AM local on
  each reminder day (default 7, 2, and 0 days before expiry).

---

## Architecture

Clean, feature-first structure under `lib/features/<feature>/` with three layers
each — `presentation/` (screens, widgets, Riverpod providers), `domain/`
(entities), and `data/` (services and repositories). Shared code lives in
`lib/core/` (constants, theme, errors, extensions, router) and `lib/shared/`.

```
lib/
  core/            constants, theme, errors, date extensions, go_router
  shared/          ProductDraft carrier, common widgets
  features/
    auth/          Google / Apple / guest sign-in
    onboarding/    4-page intro
    home/          inventory list, summary, search + filters
    scanner/       barcode + OCR + product lookup
    expiry_parser/ pure-Dart expiry-date parser (fully unit-tested)
    product/       Product entity, repository, confirm + detail screens
    notifications/ local notification scheduling
    settings/      reminders, permissions, account, export, delete
```

State management is **Riverpod**; navigation is **go_router** with auth-aware
redirects (splash → onboarding → login → home).

---

## Getting started

### 1. Prerequisites

Flutter SDK (3.x), Dart SDK, Android Studio and/or Xcode, the Firebase CLI, and
the FlutterFire CLI.

### 2. Install dependencies

```bash
flutter pub get
```

> Note: dependency versions in `pubspec.yaml` are pinned (caret-pinned) rather
> than left as `latest`, for reproducible builds.

### 3. Connect your Firebase project

`lib/firebase_options.dart` ships as a **non-functional placeholder** so the
project compiles before you wire up Firebase. Generate the real file:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

This overwrites `firebase_options.dart` and creates the native config files
(`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`).

In the Firebase console (per `PLAN.md` §24):

1. Create a Firebase project, add an Android app and an iOS app.
2. Enable **Authentication** → Google and Apple providers (and Anonymous for the
   "Continue as guest" flow).
3. Create a **Cloud Firestore** database.
4. Publish the security rules from `firestore.rules`:
   ```bash
   firebase deploy --only firestore:rules
   ```
5. Enable **Crashlytics** and **Analytics** (and App Check when going to prod).

### 4. Platform setup

- **Android**: required permissions are declared in
  `android/app/src/main/AndroidManifest.xml` (camera, notifications, exact-alarm,
  internet, boot receivers for rescheduling).
- **iOS**: usage strings are in `ios/Runner/Info.plist`. Enable the
  **Sign in with Apple** capability in Xcode and add the Google reversed-client-id
  URL scheme.

### 5. Run

```bash
flutter run
```

### 6. Test

```bash
flutter test
```

Includes the validated expiry-parser cases (`test/expiry_parser_test.dart`) and
product status / Firestore round-trip tests (`test/product_status_test.dart`).

---

## Data model (Firestore)

```
users/{uid}                                  AppUser profile
users/{uid}/products/{pid}                   Product documents
users/{uid}/notification_settings/{id}       per-user reminder prefs
barcode_cache/{barcode}                       shared, read-only lookup cache
app_config/{id}                               public read-only config
```

Product **status** (`fresh` / `expiringSoon` / `expired` / `consumed`) is always
*derived* from the expiry date at read time — never stored stale.

---

## Notes & limitations

- The free plan caps inventory at 30 active products (`PLAN.md` §21); upgrade
  gating is enforced in `ProductRepository.addProduct`.
- Privacy policy / terms links in Settings point at placeholder URLs
  (`https://expirymate.app/...`) — swap these for your real pages.
- "Export my data" copies the inventory as JSON to the clipboard; wire up a
  share/save sheet if you want file export.
