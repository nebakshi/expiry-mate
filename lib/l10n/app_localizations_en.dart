// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'Keep it fresh. Always.';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get started';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get delete => 'Delete';

  @override
  String get retry => 'Retry';

  @override
  String get edit => 'Edit';

  @override
  String get add => 'Add';

  @override
  String get onboardingTitle1 => 'Scan in seconds';

  @override
  String get onboardingBody1 =>
      'Point your camera at a barcode and we identify the product instantly.';

  @override
  String get onboardingTitle2 => 'Read the expiry date';

  @override
  String get onboardingBody2 =>
      'Scan the printed date — our India-first parser handles MFG + best-before too.';

  @override
  String get onboardingTitle3 => 'Never miss an expiry';

  @override
  String get onboardingBody3 =>
      'Get reminders 7 days, 2 days, and on the day an item expires.';

  @override
  String get onboardingTitle4 => 'Waste less food';

  @override
  String get onboardingBody4 =>
      'Track your whole kitchen in one place and use things before they spoil.';

  @override
  String get continueWithGoogle => 'Continue with Google';

  @override
  String get continueWithApple => 'Continue with Apple';

  @override
  String get continueAsGuest => 'Continue as Guest';

  @override
  String get legalText =>
      'By continuing you agree to our Terms and Privacy Policy.';

  @override
  String homeGreeting(String name) {
    return 'Hi$name 👋';
  }

  @override
  String get scan => 'Scan';

  @override
  String get searchHint => 'Search products or brands';

  @override
  String get tracked => 'Tracked';

  @override
  String get expiring => 'Expiring';

  @override
  String get expired => 'Expired';

  @override
  String get filterAll => 'All';

  @override
  String get filterFresh => 'Fresh';

  @override
  String get filterExpiringSoon => 'Expiring soon';

  @override
  String get filterExpired => 'Expired';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items expiring — get recipe ideas',
      one: '1 item expiring — get recipe ideas',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'Your kitchen is empty';

  @override
  String get emptyKitchenMessage =>
      'Scan your first product to start tracking expiry dates and get timely reminders.';

  @override
  String get scanAProduct => 'Scan a product';

  @override
  String get settings => 'Settings';

  @override
  String get guest => 'Guest';

  @override
  String get account => 'Account';

  @override
  String get appearance => 'Appearance';

  @override
  String get reminders => 'Reminders';

  @override
  String get data => 'Data';

  @override
  String get about => 'About';

  @override
  String get accountActions => 'Account actions';

  @override
  String get notificationPermission => 'Notification permission';

  @override
  String get allowBloomAlerts => 'Allow Bloom to send expiry alerts';

  @override
  String get exportMyData => 'Export my data';

  @override
  String get exportSubtitle => 'Copy your inventory as JSON';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsAndConditions => 'Terms & conditions';

  @override
  String get version => 'Version';

  @override
  String get signOut => 'Sign out';

  @override
  String get deleteAccount => 'Delete account';

  @override
  String get permanentlyRemovesData => 'Permanently removes your data';

  @override
  String get signOutConfirmTitle => 'Sign out?';

  @override
  String get signOutConfirmMessage => 'You can sign back in anytime.';

  @override
  String get deleteAccountConfirmTitle => 'Delete account?';

  @override
  String get deleteAccountConfirmMessage =>
      'This permanently deletes your account and all saved products. This cannot be undone.';

  @override
  String get freePlan => 'Free plan';

  @override
  String freePlanUsage(int total, int limit) {
    return '$total of $limit items used';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining left';
  }

  @override
  String get limitReached => 'limit reached';

  @override
  String get notificationsEnabled => 'Notifications enabled';

  @override
  String get notificationsOff =>
      'Notifications are off. Enable them in your device settings.';

  @override
  String exportedItems(int count) {
    return 'Exported $count items to clipboard';
  }

  @override
  String get couldNotOpenLink => 'Could not open link';

  @override
  String get accountDeleted => 'Account deleted';

  @override
  String get reSignInToDelete =>
      'Please sign in again, then retry deleting your account.';

  @override
  String get couldNotDeleteAccount => 'Could not delete account';

  @override
  String get signedInWithGoogle => 'Signed in with Google';

  @override
  String get signedInWithApple => 'Signed in with Apple';

  @override
  String get guestAccount => 'Guest account';

  @override
  String get signedIn => 'Signed in';

  @override
  String get defaultReminders => 'Default reminders';

  @override
  String get appliedToNewProducts => 'Applied to new products you add';

  @override
  String get theme => 'Theme';

  @override
  String get scanBarcode => 'Scan barcode';

  @override
  String get enterManually => 'Enter manually';

  @override
  String get cameraUnavailable =>
      'Camera unavailable. Check permissions or enter manually.';

  @override
  String get lookingUpProduct => 'Looking up product…';

  @override
  String get pointAtBarcode => 'Point at a product barcode';

  @override
  String get scanExpiryDate => 'Scan expiry date';

  @override
  String get searchProductByName => 'Search product by name';

  @override
  String get searchProduct => 'Search product';

  @override
  String get searchHintExample => 'e.g. Maggi ketchup';

  @override
  String get typeProductNameHint => 'Type a product name and search.';

  @override
  String get scanExpiryInstruction =>
      'Point your camera at the printed expiry, \"best before\", or MFG date.';

  @override
  String get captureDateLabel => 'Capture date label';

  @override
  String get reScan => 'Re-scan';

  @override
  String get pickDateManually => 'Pick date manually';

  @override
  String get detectedDates => 'Detected dates';

  @override
  String get detectedDatesPlaceholder => 'Detected dates will appear here.';

  @override
  String get noDateDetected =>
      'No date detected. Pick the date manually below.';

  @override
  String get couldNotCaptureImage => 'Could not capture image.';

  @override
  String get scanNutritionLabel => 'Scan nutrition label';

  @override
  String get nutritionInstruction =>
      'Point your camera at the nutrition facts table on the package.';

  @override
  String get captureNutritionLabel => 'Capture nutrition label';

  @override
  String get useTheseValues => 'Use these values';

  @override
  String get detectedNutritionPlaceholder =>
      'Detected nutrition values will appear here.';

  @override
  String get detectedValuesPer100g => 'Detected values (per 100g)';

  @override
  String get calories => 'Calories';

  @override
  String get protein => 'Protein';

  @override
  String get fat => 'Fat';

  @override
  String get carbs => 'Carbs';

  @override
  String get fiber => 'Fiber';

  @override
  String get sugar => 'Sugar';

  @override
  String get couldNotDetectNutrition =>
      'Could not detect nutrition info. Try again with clearer focus on the label.';

  @override
  String get recipeIdeas => 'Recipe ideas';

  @override
  String get thinkingOfRecipes => 'Thinking of recipes...';

  @override
  String get couldNotGenerateRecipes =>
      'Could not generate suggestions right now. Try again later.';

  @override
  String usingProducts(String products) {
    return 'Using: $products';
  }

  @override
  String get ingredients => 'Ingredients';

  @override
  String get steps => 'Steps';

  @override
  String get confirmDetails => 'Confirm details';

  @override
  String get productName => 'Product name';

  @override
  String get productNameHint => 'e.g. Amul Butter';

  @override
  String get brandOptional => 'Brand (optional)';

  @override
  String get brandHint => 'e.g. Amul';

  @override
  String get category => 'Category';

  @override
  String get storage => 'Storage';

  @override
  String get quantity => 'Quantity';

  @override
  String nutritionPer(String per) {
    return 'Nutrition (per $per)';
  }

  @override
  String get expiryDate => 'Expiry date';

  @override
  String get remindMe => 'Remind me';

  @override
  String get saveProduct => 'Save product';

  @override
  String get pleaseEnterProductName => 'Please enter a product name';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name quantity updated to $qty.';
  }

  @override
  String productSaved(String name) {
    return '$name saved. Reminders set.';
  }

  @override
  String get notSignedIn => 'You are not signed in.';

  @override
  String get productDetails => 'Product details';

  @override
  String get editProduct => 'Edit product';

  @override
  String get saveChanges => 'Save changes';

  @override
  String get required => 'Required';

  @override
  String get deleteProductTitle => 'Delete product?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" and its reminders will be removed permanently.';
  }

  @override
  String get productUpdated => 'Product updated';

  @override
  String get couldNotUpdateProduct => 'Could not update product';

  @override
  String get remindersUpdated => 'Reminders updated';

  @override
  String get couldNotUpdateReminders => 'Could not update reminders';

  @override
  String get note => 'Note';

  @override
  String get noteHint => 'e.g. opened, keep in door shelf…';

  @override
  String get noteSaved => 'Note saved';

  @override
  String get couldNotSaveNote => 'Could not save note';

  @override
  String get noNoteYet => 'No note yet.';

  @override
  String get markedAsConsumed => 'Marked as consumed';

  @override
  String get movedBackToInventory => 'Moved back to inventory';

  @override
  String get couldNotUpdateStatus => 'Could not update status';

  @override
  String get markAsConsumed => 'Mark as consumed';

  @override
  String get moveBackToInventory => 'Move back to inventory';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get scanLabel => 'Scan label';

  @override
  String get update => 'Update';

  @override
  String get noNutritionDataYet => 'No nutrition data yet.';

  @override
  String get nutritionInfoUpdated => 'Nutrition info updated';

  @override
  String get couldNotSaveNutritionData => 'Could not save nutrition data';

  @override
  String get couldNotDetectNutritionShort =>
      'Could not detect nutrition info. Try with clearer focus.';

  @override
  String get productDeleted => 'Product deleted';

  @override
  String get couldNotDeleteProduct => 'Could not delete product';

  @override
  String get getRecipeIdeas => 'Get recipe ideas';

  @override
  String get dateSource => 'Date source';

  @override
  String get sourceOcr => 'Scanned (OCR)';

  @override
  String get sourceApi => 'Product database';

  @override
  String get sourceManual => 'Entered manually';

  @override
  String get manufactured => 'Manufactured';

  @override
  String get barcode => 'Barcode';

  @override
  String get nutritionSourceApi => 'Product database';

  @override
  String get nutritionSourceOcr => 'Scanned';

  @override
  String get nutritionSourceManual => 'Manual';

  @override
  String perSourceLabel(String per, String source) {
    return 'Per $per · Source: $source';
  }

  @override
  String get cal => 'Cal';

  @override
  String get statusFresh => 'Fresh';

  @override
  String get statusExpiringSoon => 'Expiring soon';

  @override
  String get statusExpired => 'Expired';

  @override
  String get statusConsumed => 'Consumed';

  @override
  String get categoryDairy => 'Dairy';

  @override
  String get categoryBakery => 'Bakery';

  @override
  String get categoryProduce => 'Produce';

  @override
  String get categoryMeat => 'Meat & Fish';

  @override
  String get categoryBeverages => 'Beverages';

  @override
  String get categorySnacks => 'Snacks';

  @override
  String get categoryFrozen => 'Frozen';

  @override
  String get categoryPantry => 'Pantry';

  @override
  String get categoryMedicine => 'Medicine';

  @override
  String get categoryCosmetics => 'Cosmetics';

  @override
  String get categoryBaby => 'Baby';

  @override
  String get categoryPetFood => 'Pet Food';

  @override
  String get categoryOther => 'Other';

  @override
  String get storageFridge => 'Fridge';

  @override
  String get storageFreezer => 'Freezer';

  @override
  String get storagePantry => 'Pantry';

  @override
  String get storageCabinet => 'Cabinet';

  @override
  String get storageOther => 'Other';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'Expires today';

  @override
  String get expiresTomorrow => 'Expires tomorrow';

  @override
  String daysLeft(int count) {
    return '$count days left';
  }

  @override
  String get onExpiryDay => 'On expiry day';

  @override
  String get oneDayBefore => '1 day before';

  @override
  String daysBefore(int count) {
    return '$count days before';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name expires today';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name expires soon';
  }

  @override
  String get notifBodyToday => 'Please use or discard it safely.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days',
      one: '1 day',
    );
    return '$name expires in $_temp0. Use it soon to avoid waste.';
  }

  @override
  String get expiryReminders => 'Expiry Reminders';

  @override
  String get expiryRemindersDesc =>
      'Reminders before your kitchen items expire.';

  @override
  String get language => 'Language';
}
