// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'ಯಾವಾಗಲೂ ತಾಜಾ ಇರಿಸಿ.';

  @override
  String get skip => 'ಬಿಡಿ';

  @override
  String get next => 'ಮುಂದೆ';

  @override
  String get getStarted => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get save => 'ಉಳಿಸಿ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get retry => 'ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ';

  @override
  String get edit => 'ತಿದ್ದಿ';

  @override
  String get add => 'ಸೇರಿಸಿ';

  @override
  String get onboardingTitle1 => 'ಸೆಕೆಂಡುಗಳಲ್ಲಿ ಸ್ಕ್ಯಾನ್';

  @override
  String get onboardingBody1 =>
      'ಬಾರ್‌ಕೋಡ್‌ನಲ್ಲಿ ಕ್ಯಾಮೆರಾ ಹಿಡಿಯಿರಿ, ಉತ್ಪನ್ನವನ್ನು ತಕ್ಷಣ ಗುರುತಿಸುತ್ತೇವೆ.';

  @override
  String get onboardingTitle2 => 'ಮುಕ್ತಾಯ ದಿನಾಂಕ ಓದಿ';

  @override
  String get onboardingBody2 =>
      'ಮುದ್ರಿತ ದಿನಾಂಕ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ — ನಮ್ಮ ಭಾರತ-ಮೊದಲ ಪಾರ್ಸರ್ MFG + best-before ಅನ್ನೂ ನಿರ್ವಹಿಸುತ್ತದೆ.';

  @override
  String get onboardingTitle3 => 'ಮುಕ್ತಾಯ ಎಂದಿಗೂ ತಪ್ಪಿಸಬೇಡಿ';

  @override
  String get onboardingBody3 =>
      'ಮುಕ್ತಾಯಕ್ಕೆ ೭ ದಿನ, ೨ ದಿನ ಮೊದಲು ಮತ್ತು ಅದೇ ದಿನ ಜ್ಞಾಪನೆ ಪಡೆಯಿರಿ.';

  @override
  String get onboardingTitle4 => 'ಆಹಾರ ವ್ಯರ್ಥ ಮಾಡಬೇಡಿ';

  @override
  String get onboardingBody4 =>
      'ನಿಮ್ಮ ಇಡೀ ಅಡುಗೆಮನೆಯನ್ನು ಒಂದೇ ಕಡೆ ಟ್ರ್ಯಾಕ್ ಮಾಡಿ, ಕೆಡುವ ಮೊದಲು ಬಳಸಿ.';

  @override
  String get continueWithGoogle => 'Google ನೊಂದಿಗೆ ಮುಂದುವರಿಸಿ';

  @override
  String get continueWithApple => 'Apple ನೊಂದಿಗೆ ಮುಂದುವರಿಸಿ';

  @override
  String get continueAsGuest => 'ಅತಿಥಿಯಾಗಿ ಮುಂದುವರಿಸಿ';

  @override
  String get legalText =>
      'ಮುಂದುವರಿಸುವ ಮೂಲಕ ನಮ್ಮ ನಿಯಮಗಳು ಮತ್ತು ಗೌಪ್ಯತಾ ನೀತಿಗೆ ಒಪ್ಪುತ್ತೀರಿ.';

  @override
  String homeGreeting(String name) {
    return 'ನಮಸ್ಕಾರ$name 👋';
  }

  @override
  String get scan => 'ಸ್ಕ್ಯಾನ್';

  @override
  String get searchHint => 'ಉತ್ಪನ್ನಗಳು ಅಥವಾ ಬ್ರಾಂಡ್ ಹುಡುಕಿ';

  @override
  String get tracked => 'ಟ್ರ್ಯಾಕ್';

  @override
  String get expiring => 'ಶೀಘ್ರ ಮುಕ್ತಾಯ';

  @override
  String get expired => 'ಮುಕ್ತಾಯವಾಗಿದೆ';

  @override
  String get filterAll => 'ಎಲ್ಲಾ';

  @override
  String get filterFresh => 'ತಾಜಾ';

  @override
  String get filterExpiringSoon => 'ಶೀಘ್ರ ಮುಕ್ತಾಯ';

  @override
  String get filterExpired => 'ಮುಕ್ತಾಯವಾಗಿದೆ';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಐಟಂಗಳು ಮುಕ್ತಾಯವಾಗುತ್ತಿವೆ — ರೆಸಿಪಿ ಸಲಹೆ ಪಡೆಯಿರಿ',
      one: '೧ ಐಟಂ ಮುಕ್ತಾಯವಾಗುತ್ತಿದೆ — ರೆಸಿಪಿ ಸಲಹೆ ಪಡೆಯಿರಿ',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'ನಿಮ್ಮ ಅಡುಗೆಮನೆ ಖಾಲಿ';

  @override
  String get emptyKitchenMessage =>
      'ಮುಕ್ತಾಯ ದಿನಾಂಕ ಟ್ರ್ಯಾಕ್ ಮಾಡಲು ಮತ್ತು ಸಮಯಕ್ಕೆ ಜ್ಞಾಪನೆ ಪಡೆಯಲು ನಿಮ್ಮ ಮೊದಲ ಉತ್ಪನ್ನ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ.';

  @override
  String get scanAProduct => 'ಒಂದು ಉತ್ಪನ್ನ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get guest => 'ಅತಿಥಿ';

  @override
  String get account => 'ಖಾತೆ';

  @override
  String get appearance => 'ಕಾಣಿಕೆ';

  @override
  String get reminders => 'ಜ್ಞಾಪನೆಗಳು';

  @override
  String get data => 'ಡೇಟಾ';

  @override
  String get about => 'ಕುರಿತು';

  @override
  String get accountActions => 'ಖಾತೆ ಕ್ರಿಯೆಗಳು';

  @override
  String get notificationPermission => 'ಅಧಿಸೂಚನೆ ಅನುಮತಿ';

  @override
  String get allowBloomAlerts => 'Bloom ಗೆ ಮುಕ್ತಾಯ ಎಚ್ಚರಿಕೆ ಕಳುಹಿಸಲು ಅನುಮತಿಸಿ';

  @override
  String get exportMyData => 'ನನ್ನ ಡೇಟಾ ರಫ್ತು ಮಾಡಿ';

  @override
  String get exportSubtitle => 'ನಿಮ್ಮ ಇನ್ವೆಂಟರಿ JSON ಆಗಿ ನಕಲಿಸಿ';

  @override
  String get privacyPolicy => 'ಗೌಪ್ಯತಾ ನೀತಿ';

  @override
  String get termsAndConditions => 'ನಿಯಮಗಳು ಮತ್ತು ಷರತ್ತುಗಳು';

  @override
  String get version => 'ಆವೃತ್ತಿ';

  @override
  String get signOut => 'ಸೈನ್ ಔಟ್';

  @override
  String get deleteAccount => 'ಖಾತೆ ಅಳಿಸಿ';

  @override
  String get permanentlyRemovesData =>
      'ನಿಮ್ಮ ಡೇಟಾವನ್ನು ಶಾಶ್ವತವಾಗಿ ತೆಗೆದುಹಾಕುತ್ತದೆ';

  @override
  String get signOutConfirmTitle => 'ಸೈನ್ ಔಟ್ ಮಾಡಬೇಕೇ?';

  @override
  String get signOutConfirmMessage =>
      'ನೀವು ಯಾವಾಗ ಬೇಕಾದರೂ ಮರಳಿ ಸೈನ್ ಇನ್ ಮಾಡಬಹುದು.';

  @override
  String get deleteAccountConfirmTitle => 'ಖಾತೆ ಅಳಿಸಬೇಕೇ?';

  @override
  String get deleteAccountConfirmMessage =>
      'ಇದು ನಿಮ್ಮ ಖಾತೆ ಮತ್ತು ಎಲ್ಲಾ ಉಳಿಸಿದ ಉತ್ಪನ್ನಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ಅಳಿಸುತ್ತದೆ. ಇದನ್ನು ರದ್ದು ಮಾಡಲಾಗುವುದಿಲ್ಲ.';

  @override
  String get freePlan => 'ಉಚಿತ ಯೋಜನೆ';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit ರಲ್ಲಿ $total ಐಟಂಗಳು ಬಳಸಲಾಗಿದೆ';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining ಉಳಿದಿದೆ';
  }

  @override
  String get limitReached => 'ಮಿತಿ ತಲುಪಿದೆ';

  @override
  String get notificationsEnabled => 'ಅಧಿಸೂಚನೆಗಳು ಸಕ್ರಿಯ';

  @override
  String get notificationsOff =>
      'ಅಧಿಸೂಚನೆಗಳು ಆಫ್ ಆಗಿವೆ. ನಿಮ್ಮ ಸಾಧನ ಸೆಟ್ಟಿಂಗ್‌ಗಳಲ್ಲಿ ಸಕ್ರಿಯಗೊಳಿಸಿ.';

  @override
  String exportedItems(int count) {
    return '$count ಐಟಂಗಳು ಕ್ಲಿಪ್‌ಬೋರ್ಡ್‌ಗೆ ರಫ್ತಾಗಿವೆ';
  }

  @override
  String get couldNotOpenLink => 'ಲಿಂಕ್ ತೆರೆಯಲಾಗಲಿಲ್ಲ';

  @override
  String get accountDeleted => 'ಖಾತೆ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get reSignInToDelete =>
      'ದಯವಿಟ್ಟು ಮತ್ತೆ ಸೈನ್ ಇನ್ ಮಾಡಿ, ನಂತರ ಖಾತೆ ಅಳಿಸಲು ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get couldNotDeleteAccount => 'ಖಾತೆ ಅಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get signedInWithGoogle => 'Google ನೊಂದಿಗೆ ಸೈನ್ ಇನ್';

  @override
  String get signedInWithApple => 'Apple ನೊಂದಿಗೆ ಸೈನ್ ಇನ್';

  @override
  String get guestAccount => 'ಅತಿಥಿ ಖಾತೆ';

  @override
  String get signedIn => 'ಸೈನ್ ಇನ್';

  @override
  String get defaultReminders => 'ಡೀಫಾಲ್ಟ್ ಜ್ಞಾಪನೆಗಳು';

  @override
  String get appliedToNewProducts => 'ನೀವು ಸೇರಿಸುವ ಹೊಸ ಉತ್ಪನ್ನಗಳಿಗೆ ಅನ್ವಯ';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get scanBarcode => 'ಬಾರ್‌ಕೋಡ್ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get enterManually => 'ಕೈಯಿಂದ ನಮೂದಿಸಿ';

  @override
  String get cameraUnavailable =>
      'ಕ್ಯಾಮೆರಾ ಲಭ್ಯವಿಲ್ಲ. ಅನುಮತಿಗಳನ್ನು ಪರಿಶೀಲಿಸಿ ಅಥವಾ ಕೈಯಿಂದ ನಮೂದಿಸಿ.';

  @override
  String get lookingUpProduct => 'ಉತ್ಪನ್ನ ಹುಡುಕುತ್ತಿದೆ…';

  @override
  String get pointAtBarcode => 'ಉತ್ಪನ್ನ ಬಾರ್‌ಕೋಡ್‌ಗೆ ಕ್ಯಾಮೆರಾ ಹಿಡಿಯಿರಿ';

  @override
  String get scanExpiryDate => 'ಮುಕ್ತಾಯ ದಿನಾಂಕ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get searchProductByName => 'ಹೆಸರಿನಿಂದ ಉತ್ಪನ್ನ ಹುಡುಕಿ';

  @override
  String get searchProduct => 'ಉತ್ಪನ್ನ ಹುಡುಕಿ';

  @override
  String get searchHintExample => 'ಉದಾ. ಮ್ಯಾಗಿ ಕೆಚಪ್';

  @override
  String get typeProductNameHint => 'ಉತ್ಪನ್ನ ಹೆಸರು ಟೈಪ್ ಮಾಡಿ ಹುಡುಕಿ.';

  @override
  String get scanExpiryInstruction =>
      'ಮುದ್ರಿತ ಮುಕ್ತಾಯ, \"best before\", ಅಥವಾ MFG ದಿನಾಂಕಕ್ಕೆ ಕ್ಯಾಮೆರಾ ಹಿಡಿಯಿರಿ.';

  @override
  String get captureDateLabel => 'ದಿನಾಂಕ ಲೇಬಲ್ ಕ್ಯಾಪ್ಚರ್ ಮಾಡಿ';

  @override
  String get reScan => 'ಮತ್ತೆ ಸ್ಕ್ಯಾನ್';

  @override
  String get pickDateManually => 'ದಿನಾಂಕ ಕೈಯಿಂದ ಆಯ್ಕೆ ಮಾಡಿ';

  @override
  String get detectedDates => 'ಗುರುತಿಸಿದ ದಿನಾಂಕಗಳು';

  @override
  String get detectedDatesPlaceholder =>
      'ಗುರುತಿಸಿದ ದಿನಾಂಕಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String get noDateDetected =>
      'ದಿನಾಂಕ ಗುರುತಿಸಲಾಗಲಿಲ್ಲ. ಕೆಳಗೆ ಕೈಯಿಂದ ಆಯ್ಕೆ ಮಾಡಿ.';

  @override
  String get couldNotCaptureImage => 'ಚಿತ್ರ ಕ್ಯಾಪ್ಚರ್ ಆಗಲಿಲ್ಲ.';

  @override
  String get scanNutritionLabel => 'ಪೌಷ್ಟಿಕಾಂಶ ಲೇಬಲ್ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get nutritionInstruction =>
      'ಪ್ಯಾಕೇಜ್‌ನ ಪೌಷ್ಟಿಕಾಂಶ ಕೋಷ್ಟಕಕ್ಕೆ ಕ್ಯಾಮೆರಾ ಹಿಡಿಯಿರಿ.';

  @override
  String get captureNutritionLabel => 'ಪೌಷ್ಟಿಕಾಂಶ ಲೇಬಲ್ ಕ್ಯಾಪ್ಚರ್ ಮಾಡಿ';

  @override
  String get useTheseValues => 'ಈ ಮೌಲ್ಯಗಳನ್ನು ಬಳಸಿ';

  @override
  String get detectedNutritionPlaceholder =>
      'ಗುರುತಿಸಿದ ಪೌಷ್ಟಿಕಾಂಶ ಮೌಲ್ಯಗಳು ಇಲ್ಲಿ ಕಾಣಿಸುತ್ತವೆ.';

  @override
  String get detectedValuesPer100g => 'ಗುರುತಿಸಿದ ಮೌಲ್ಯಗಳು (100g ಗೆ)';

  @override
  String get calories => 'ಕ್ಯಾಲೊರಿ';

  @override
  String get protein => 'ಪ್ರೋಟೀನ್';

  @override
  String get fat => 'ಕೊಬ್ಬು';

  @override
  String get carbs => 'ಕಾರ್ಬ್ಸ್';

  @override
  String get fiber => 'ಫೈಬರ್';

  @override
  String get sugar => 'ಸಕ್ಕರೆ';

  @override
  String get couldNotDetectNutrition =>
      'ಪೌಷ್ಟಿಕಾಂಶ ಮಾಹಿತಿ ಗುರುತಿಸಲಾಗಲಿಲ್ಲ. ಲೇಬಲ್‌ಗೆ ಸ್ಪಷ್ಟ ಫೋಕಸ್‌ನೊಂದಿಗೆ ಮತ್ತೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get recipeIdeas => 'ರೆಸಿಪಿ ಸಲಹೆಗಳು';

  @override
  String get thinkingOfRecipes => 'ರೆಸಿಪಿ ಯೋಚಿಸುತ್ತಿದೆ...';

  @override
  String get couldNotGenerateRecipes =>
      'ಈಗ ಸಲಹೆಗಳನ್ನು ರಚಿಸಲಾಗಲಿಲ್ಲ. ನಂತರ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String usingProducts(String products) {
    return 'ಬಳಸುತ್ತಿದೆ: $products';
  }

  @override
  String get ingredients => 'ಪದಾರ್ಥಗಳು';

  @override
  String get steps => 'ಹಂತಗಳು';

  @override
  String get confirmDetails => 'ವಿವರಗಳನ್ನು ದೃಢೀಕರಿಸಿ';

  @override
  String get productName => 'ಉತ್ಪನ್ನ ಹೆಸರು';

  @override
  String get productNameHint => 'ಉದಾ. ನಂದಿನಿ ಬೆಣ್ಣೆ';

  @override
  String get brandOptional => 'ಬ್ರಾಂಡ್ (ಐಚ್ಛಿಕ)';

  @override
  String get brandHint => 'ಉದಾ. ನಂದಿನಿ';

  @override
  String get category => 'ವರ್ಗ';

  @override
  String get storage => 'ಸಂಗ್ರಹ';

  @override
  String get quantity => 'ಪ್ರಮಾಣ';

  @override
  String nutritionPer(String per) {
    return 'ಪೌಷ್ಟಿಕಾಂಶ ($per ಗೆ)';
  }

  @override
  String get expiryDate => 'ಮುಕ್ತಾಯ ದಿನಾಂಕ';

  @override
  String get remindMe => 'ನನಗೆ ನೆನಪಿಸಿ';

  @override
  String get saveProduct => 'ಉತ್ಪನ್ನ ಉಳಿಸಿ';

  @override
  String get pleaseEnterProductName => 'ದಯವಿಟ್ಟು ಉತ್ಪನ್ನ ಹೆಸರು ನಮೂದಿಸಿ';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name ಪ್ರಮಾಣ $qty ಕ್ಕೆ ನವೀಕರಿಸಲಾಗಿದೆ.';
  }

  @override
  String productSaved(String name) {
    return '$name ಉಳಿಸಲಾಗಿದೆ. ಜ್ಞಾಪನೆಗಳು ಹೊಂದಿಸಲಾಗಿದೆ.';
  }

  @override
  String get notSignedIn => 'ನೀವು ಸೈನ್ ಇನ್ ಆಗಿಲ್ಲ.';

  @override
  String get productDetails => 'ಉತ್ಪನ್ನ ವಿವರ';

  @override
  String get editProduct => 'ಉತ್ಪನ್ನ ತಿದ್ದಿ';

  @override
  String get saveChanges => 'ಬದಲಾವಣೆಗಳನ್ನು ಉಳಿಸಿ';

  @override
  String get required => 'ಅಗತ್ಯ';

  @override
  String get deleteProductTitle => 'ಉತ್ಪನ್ನ ಅಳಿಸಬೇಕೇ?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" ಮತ್ತು ಅದರ ಜ್ಞಾಪನೆಗಳನ್ನು ಶಾಶ್ವತವಾಗಿ ತೆಗೆದುಹಾಕಲಾಗುತ್ತದೆ.';
  }

  @override
  String get productUpdated => 'ಉತ್ಪನ್ನ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get couldNotUpdateProduct => 'ಉತ್ಪನ್ನ ನವೀಕರಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get remindersUpdated => 'ಜ್ಞಾಪನೆಗಳು ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get couldNotUpdateReminders => 'ಜ್ಞಾಪನೆಗಳನ್ನು ನವೀಕರಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get note => 'ಟಿಪ್ಪಣಿ';

  @override
  String get noteHint => 'ಉದಾ. ತೆರೆದಿದೆ, ಬಾಗಿಲ ಶೆಲ್ಫ್‌ನಲ್ಲಿ ಇಡಿ…';

  @override
  String get noteSaved => 'ಟಿಪ್ಪಣಿ ಉಳಿಸಲಾಗಿದೆ';

  @override
  String get couldNotSaveNote => 'ಟಿಪ್ಪಣಿ ಉಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get noNoteYet => 'ಇನ್ನೂ ಟಿಪ್ಪಣಿ ಇಲ್ಲ.';

  @override
  String get markedAsConsumed => 'ಬಳಸಿದ ಎಂದು ಗುರುತಿಸಲಾಗಿದೆ';

  @override
  String get movedBackToInventory => 'ಇನ್ವೆಂಟರಿಗೆ ಮರಳಿ ಸರಿಸಲಾಗಿದೆ';

  @override
  String get couldNotUpdateStatus => 'ಸ್ಥಿತಿ ನವೀಕರಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get markAsConsumed => 'ಬಳಸಿದ ಎಂದು ಗುರುತಿಸಿ';

  @override
  String get moveBackToInventory => 'ಇನ್ವೆಂಟರಿಗೆ ಮರಳಿ ಸರಿಸಿ';

  @override
  String get nutrition => 'ಪೌಷ್ಟಿಕಾಂಶ';

  @override
  String get scanLabel => 'ಲೇಬಲ್ ಸ್ಕ್ಯಾನ್';

  @override
  String get update => 'ನವೀಕರಿಸಿ';

  @override
  String get noNutritionDataYet => 'ಇನ್ನೂ ಪೌಷ್ಟಿಕಾಂಶ ಡೇಟಾ ಇಲ್ಲ.';

  @override
  String get nutritionInfoUpdated => 'ಪೌಷ್ಟಿಕಾಂಶ ಮಾಹಿತಿ ನವೀಕರಿಸಲಾಗಿದೆ';

  @override
  String get couldNotSaveNutritionData => 'ಪೌಷ್ಟಿಕಾಂಶ ಡೇಟಾ ಉಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get couldNotDetectNutritionShort =>
      'ಪೌಷ್ಟಿಕಾಂಶ ಮಾಹಿತಿ ಗುರುತಿಸಲಾಗಲಿಲ್ಲ. ಸ್ಪಷ್ಟ ಫೋಕಸ್‌ನೊಂದಿಗೆ ಪ್ರಯತ್ನಿಸಿ.';

  @override
  String get productDeleted => 'ಉತ್ಪನ್ನ ಅಳಿಸಲಾಗಿದೆ';

  @override
  String get couldNotDeleteProduct => 'ಉತ್ಪನ್ನ ಅಳಿಸಲಾಗಲಿಲ್ಲ';

  @override
  String get getRecipeIdeas => 'ರೆಸಿಪಿ ಸಲಹೆ ಪಡೆಯಿರಿ';

  @override
  String get dateSource => 'ದಿನಾಂಕ ಮೂಲ';

  @override
  String get sourceOcr => 'ಸ್ಕ್ಯಾನ್ ಮಾಡಲಾಗಿದೆ (OCR)';

  @override
  String get sourceApi => 'ಉತ್ಪನ್ನ ಡೇಟಾಬೇಸ್';

  @override
  String get sourceManual => 'ಕೈಯಿಂದ ನಮೂದಿಸಲಾಗಿದೆ';

  @override
  String get manufactured => 'ತಯಾರಿಸಲಾಗಿದೆ';

  @override
  String get barcode => 'ಬಾರ್‌ಕೋಡ್';

  @override
  String get nutritionSourceApi => 'ಉತ್ಪನ್ನ ಡೇಟಾಬೇಸ್';

  @override
  String get nutritionSourceOcr => 'ಸ್ಕ್ಯಾನ್ ಮಾಡಲಾಗಿದೆ';

  @override
  String get nutritionSourceManual => 'ಕೈಯಿಂದ';

  @override
  String perSourceLabel(String per, String source) {
    return '$per ಗೆ · ಮೂಲ: $source';
  }

  @override
  String get cal => 'ಕ್ಯಾಲ್';

  @override
  String get statusFresh => 'ತಾಜಾ';

  @override
  String get statusExpiringSoon => 'ಶೀಘ್ರ ಮುಕ್ತಾಯ';

  @override
  String get statusExpired => 'ಮುಕ್ತಾಯವಾಗಿದೆ';

  @override
  String get statusConsumed => 'ಬಳಸಲಾಗಿದೆ';

  @override
  String get categoryDairy => 'ಹಾಲು ಉತ್ಪನ್ನ';

  @override
  String get categoryBakery => 'ಬೇಕರಿ';

  @override
  String get categoryProduce => 'ತರಕಾರಿ';

  @override
  String get categoryMeat => 'ಮಾಂಸ ಮತ್ತು ಮೀನು';

  @override
  String get categoryBeverages => 'ಪಾನೀಯ';

  @override
  String get categorySnacks => 'ಸ್ನ್ಯಾಕ್ಸ್';

  @override
  String get categoryFrozen => 'ಹೆಪ್ಪುಗಟ್ಟಿದ';

  @override
  String get categoryPantry => 'ಪ್ಯಾಂಟ್ರಿ';

  @override
  String get categoryMedicine => 'ಔಷಧ';

  @override
  String get categoryCosmetics => 'ಸೌಂದರ್ಯವರ್ಧಕ';

  @override
  String get categoryBaby => 'ಶಿಶು';

  @override
  String get categoryPetFood => 'ಪೆಟ್ ಫುಡ್';

  @override
  String get categoryOther => 'ಇತರ';

  @override
  String get storageFridge => 'ಫ್ರಿಜ್';

  @override
  String get storageFreezer => 'ಫ್ರೀಜರ್';

  @override
  String get storagePantry => 'ಪ್ಯಾಂಟ್ರಿ';

  @override
  String get storageCabinet => 'ಕ್ಯಾಬಿನೆಟ್';

  @override
  String get storageOther => 'ಇತರ';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ದಿನಗಳ ಹಿಂದೆ',
      one: '೧ ದಿನ ಹಿಂದೆ',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'ಇಂದು ಮುಕ್ತಾಯ';

  @override
  String get expiresTomorrow => 'ನಾಳೆ ಮುಕ್ತಾಯ';

  @override
  String daysLeft(int count) {
    return '$count ದಿನ ಉಳಿದಿದೆ';
  }

  @override
  String get onExpiryDay => 'ಮುಕ್ತಾಯ ದಿನದಂದು';

  @override
  String get oneDayBefore => '೧ ದಿನ ಮೊದಲು';

  @override
  String daysBefore(int count) {
    return '$count ದಿನ ಮೊದಲು';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name ಇಂದು ಮುಕ್ತಾಯವಾಗುತ್ತಿದೆ';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name ಶೀಘ್ರ ಮುಕ್ತಾಯವಾಗುತ್ತದೆ';
  }

  @override
  String get notifBodyToday => 'ದಯವಿಟ್ಟು ಸುರಕ್ಷಿತವಾಗಿ ಬಳಸಿ ಅಥವಾ ವಿಲೇವಾರಿ ಮಾಡಿ.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ದಿನಗಳಲ್ಲಿ',
      one: '೧ ದಿನದಲ್ಲಿ',
    );
    return '$name $_temp0 ಮುಕ್ತಾಯವಾಗುತ್ತದೆ. ವ್ಯರ್ಥ ತಪ್ಪಿಸಲು ಶೀಘ್ರ ಬಳಸಿ.';
  }

  @override
  String get expiryReminders => 'ಮುಕ್ತಾಯ ಜ್ಞಾಪನೆಗಳು';

  @override
  String get expiryRemindersDesc =>
      'ನಿಮ್ಮ ಅಡುಗೆಮನೆ ವಸ್ತುಗಳು ಮುಕ್ತಾಯವಾಗುವ ಮೊದಲು ಜ್ಞಾಪನೆಗಳು.';

  @override
  String get language => 'ಭಾಷೆ';
}
