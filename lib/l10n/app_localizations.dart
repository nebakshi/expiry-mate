import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('gu'),
    Locale('hi'),
    Locale('kn'),
    Locale('ml'),
    Locale('mr'),
    Locale('ta'),
    Locale('te')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Bloom'**
  String get appName;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Keep it fresh. Always.'**
  String get tagline;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Scan in seconds'**
  String get onboardingTitle1;

  /// No description provided for @onboardingBody1.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at a barcode and we identify the product instantly.'**
  String get onboardingBody1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Read the expiry date'**
  String get onboardingTitle2;

  /// No description provided for @onboardingBody2.
  ///
  /// In en, this message translates to:
  /// **'Scan the printed date — our India-first parser handles MFG + best-before too.'**
  String get onboardingBody2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Never miss an expiry'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'Get reminders 7 days, 2 days, and on the day an item expires.'**
  String get onboardingBody3;

  /// No description provided for @onboardingTitle4.
  ///
  /// In en, this message translates to:
  /// **'Waste less food'**
  String get onboardingTitle4;

  /// No description provided for @onboardingBody4.
  ///
  /// In en, this message translates to:
  /// **'Track your whole kitchen in one place and use things before they spoil.'**
  String get onboardingBody4;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithApple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continueWithApple;

  /// No description provided for @continueAsGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueAsGuest;

  /// No description provided for @legalText.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to our Terms and Privacy Policy.'**
  String get legalText;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi{name} 👋'**
  String homeGreeting(String name);

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get scan;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search products or brands'**
  String get searchHint;

  /// No description provided for @tracked.
  ///
  /// In en, this message translates to:
  /// **'Tracked'**
  String get tracked;

  /// No description provided for @expiring.
  ///
  /// In en, this message translates to:
  /// **'Expiring'**
  String get expiring;

  /// No description provided for @expired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get expired;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterFresh.
  ///
  /// In en, this message translates to:
  /// **'Fresh'**
  String get filterFresh;

  /// No description provided for @filterExpiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Expiring soon'**
  String get filterExpiringSoon;

  /// No description provided for @filterExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get filterExpired;

  /// No description provided for @recipeBanner.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 item expiring — get recipe ideas} other{{count} items expiring — get recipe ideas}}'**
  String recipeBanner(int count);

  /// No description provided for @emptyKitchenTitle.
  ///
  /// In en, this message translates to:
  /// **'Your kitchen is empty'**
  String get emptyKitchenTitle;

  /// No description provided for @emptyKitchenMessage.
  ///
  /// In en, this message translates to:
  /// **'Scan your first product to start tracking expiry dates and get timely reminders.'**
  String get emptyKitchenMessage;

  /// No description provided for @scanAProduct.
  ///
  /// In en, this message translates to:
  /// **'Scan a product'**
  String get scanAProduct;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @guest.
  ///
  /// In en, this message translates to:
  /// **'Guest'**
  String get guest;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @reminders.
  ///
  /// In en, this message translates to:
  /// **'Reminders'**
  String get reminders;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @accountActions.
  ///
  /// In en, this message translates to:
  /// **'Account actions'**
  String get accountActions;

  /// No description provided for @notificationPermission.
  ///
  /// In en, this message translates to:
  /// **'Notification permission'**
  String get notificationPermission;

  /// No description provided for @allowBloomAlerts.
  ///
  /// In en, this message translates to:
  /// **'Allow Bloom to send expiry alerts'**
  String get allowBloomAlerts;

  /// No description provided for @exportMyData.
  ///
  /// In en, this message translates to:
  /// **'Export my data'**
  String get exportMyData;

  /// No description provided for @exportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Copy your inventory as JSON'**
  String get exportSubtitle;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyPolicy;

  /// No description provided for @termsAndConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & conditions'**
  String get termsAndConditions;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @permanentlyRemovesData.
  ///
  /// In en, this message translates to:
  /// **'Permanently removes your data'**
  String get permanentlyRemovesData;

  /// No description provided for @signOutConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign out?'**
  String get signOutConfirmTitle;

  /// No description provided for @signOutConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'You can sign back in anytime.'**
  String get signOutConfirmMessage;

  /// No description provided for @deleteAccountConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete account?'**
  String get deleteAccountConfirmTitle;

  /// No description provided for @deleteAccountConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your account and all saved products. This cannot be undone.'**
  String get deleteAccountConfirmMessage;

  /// No description provided for @freePlan.
  ///
  /// In en, this message translates to:
  /// **'Free plan'**
  String get freePlan;

  /// No description provided for @freePlanUsage.
  ///
  /// In en, this message translates to:
  /// **'{total} of {limit} items used'**
  String freePlanUsage(int total, int limit);

  /// No description provided for @itemsLeft.
  ///
  /// In en, this message translates to:
  /// **'{remaining} left'**
  String itemsLeft(int remaining);

  /// No description provided for @limitReached.
  ///
  /// In en, this message translates to:
  /// **'limit reached'**
  String get limitReached;

  /// No description provided for @notificationsEnabled.
  ///
  /// In en, this message translates to:
  /// **'Notifications enabled'**
  String get notificationsEnabled;

  /// No description provided for @notificationsOff.
  ///
  /// In en, this message translates to:
  /// **'Notifications are off. Enable them in your device settings.'**
  String get notificationsOff;

  /// No description provided for @exportedItems.
  ///
  /// In en, this message translates to:
  /// **'Exported {count} items to clipboard'**
  String exportedItems(int count);

  /// No description provided for @couldNotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Could not open link'**
  String get couldNotOpenLink;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Account deleted'**
  String get accountDeleted;

  /// No description provided for @reSignInToDelete.
  ///
  /// In en, this message translates to:
  /// **'Please sign in again, then retry deleting your account.'**
  String get reSignInToDelete;

  /// No description provided for @couldNotDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Could not delete account'**
  String get couldNotDeleteAccount;

  /// No description provided for @signedInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Google'**
  String get signedInWithGoogle;

  /// No description provided for @signedInWithApple.
  ///
  /// In en, this message translates to:
  /// **'Signed in with Apple'**
  String get signedInWithApple;

  /// No description provided for @guestAccount.
  ///
  /// In en, this message translates to:
  /// **'Guest account'**
  String get guestAccount;

  /// No description provided for @signedIn.
  ///
  /// In en, this message translates to:
  /// **'Signed in'**
  String get signedIn;

  /// No description provided for @defaultReminders.
  ///
  /// In en, this message translates to:
  /// **'Default reminders'**
  String get defaultReminders;

  /// No description provided for @appliedToNewProducts.
  ///
  /// In en, this message translates to:
  /// **'Applied to new products you add'**
  String get appliedToNewProducts;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @scanBarcode.
  ///
  /// In en, this message translates to:
  /// **'Scan barcode'**
  String get scanBarcode;

  /// No description provided for @enterManually.
  ///
  /// In en, this message translates to:
  /// **'Enter manually'**
  String get enterManually;

  /// No description provided for @cameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Camera unavailable. Check permissions or enter manually.'**
  String get cameraUnavailable;

  /// No description provided for @lookingUpProduct.
  ///
  /// In en, this message translates to:
  /// **'Looking up product…'**
  String get lookingUpProduct;

  /// No description provided for @pointAtBarcode.
  ///
  /// In en, this message translates to:
  /// **'Point at a product barcode'**
  String get pointAtBarcode;

  /// No description provided for @scanExpiryDate.
  ///
  /// In en, this message translates to:
  /// **'Scan expiry date'**
  String get scanExpiryDate;

  /// No description provided for @searchProductByName.
  ///
  /// In en, this message translates to:
  /// **'Search product by name'**
  String get searchProductByName;

  /// No description provided for @searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search product'**
  String get searchProduct;

  /// No description provided for @searchHintExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. Maggi ketchup'**
  String get searchHintExample;

  /// No description provided for @typeProductNameHint.
  ///
  /// In en, this message translates to:
  /// **'Type a product name and search.'**
  String get typeProductNameHint;

  /// No description provided for @scanExpiryInstruction.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the printed expiry, \"best before\", or MFG date.'**
  String get scanExpiryInstruction;

  /// No description provided for @captureDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Capture date label'**
  String get captureDateLabel;

  /// No description provided for @reScan.
  ///
  /// In en, this message translates to:
  /// **'Re-scan'**
  String get reScan;

  /// No description provided for @pickDateManually.
  ///
  /// In en, this message translates to:
  /// **'Pick date manually'**
  String get pickDateManually;

  /// No description provided for @detectedDates.
  ///
  /// In en, this message translates to:
  /// **'Detected dates'**
  String get detectedDates;

  /// No description provided for @detectedDatesPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Detected dates will appear here.'**
  String get detectedDatesPlaceholder;

  /// No description provided for @noDateDetected.
  ///
  /// In en, this message translates to:
  /// **'No date detected. Pick the date manually below.'**
  String get noDateDetected;

  /// No description provided for @couldNotCaptureImage.
  ///
  /// In en, this message translates to:
  /// **'Could not capture image.'**
  String get couldNotCaptureImage;

  /// No description provided for @scanNutritionLabel.
  ///
  /// In en, this message translates to:
  /// **'Scan nutrition label'**
  String get scanNutritionLabel;

  /// No description provided for @nutritionInstruction.
  ///
  /// In en, this message translates to:
  /// **'Point your camera at the nutrition facts table on the package.'**
  String get nutritionInstruction;

  /// No description provided for @captureNutritionLabel.
  ///
  /// In en, this message translates to:
  /// **'Capture nutrition label'**
  String get captureNutritionLabel;

  /// No description provided for @useTheseValues.
  ///
  /// In en, this message translates to:
  /// **'Use these values'**
  String get useTheseValues;

  /// No description provided for @detectedNutritionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Detected nutrition values will appear here.'**
  String get detectedNutritionPlaceholder;

  /// No description provided for @detectedValuesPer100g.
  ///
  /// In en, this message translates to:
  /// **'Detected values (per 100g)'**
  String get detectedValuesPer100g;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @fat.
  ///
  /// In en, this message translates to:
  /// **'Fat'**
  String get fat;

  /// No description provided for @carbs.
  ///
  /// In en, this message translates to:
  /// **'Carbs'**
  String get carbs;

  /// No description provided for @fiber.
  ///
  /// In en, this message translates to:
  /// **'Fiber'**
  String get fiber;

  /// No description provided for @sugar.
  ///
  /// In en, this message translates to:
  /// **'Sugar'**
  String get sugar;

  /// No description provided for @couldNotDetectNutrition.
  ///
  /// In en, this message translates to:
  /// **'Could not detect nutrition info. Try again with clearer focus on the label.'**
  String get couldNotDetectNutrition;

  /// No description provided for @recipeIdeas.
  ///
  /// In en, this message translates to:
  /// **'Recipe ideas'**
  String get recipeIdeas;

  /// No description provided for @thinkingOfRecipes.
  ///
  /// In en, this message translates to:
  /// **'Thinking of recipes...'**
  String get thinkingOfRecipes;

  /// No description provided for @couldNotGenerateRecipes.
  ///
  /// In en, this message translates to:
  /// **'Could not generate suggestions right now. Try again later.'**
  String get couldNotGenerateRecipes;

  /// No description provided for @usingProducts.
  ///
  /// In en, this message translates to:
  /// **'Using: {products}'**
  String usingProducts(String products);

  /// No description provided for @ingredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get ingredients;

  /// No description provided for @steps.
  ///
  /// In en, this message translates to:
  /// **'Steps'**
  String get steps;

  /// No description provided for @confirmDetails.
  ///
  /// In en, this message translates to:
  /// **'Confirm details'**
  String get confirmDetails;

  /// No description provided for @productName.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get productName;

  /// No description provided for @productNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Amul Butter'**
  String get productNameHint;

  /// No description provided for @brandOptional.
  ///
  /// In en, this message translates to:
  /// **'Brand (optional)'**
  String get brandOptional;

  /// No description provided for @brandHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Amul'**
  String get brandHint;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @storage.
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @nutritionPer.
  ///
  /// In en, this message translates to:
  /// **'Nutrition (per {per})'**
  String nutritionPer(String per);

  /// No description provided for @expiryDate.
  ///
  /// In en, this message translates to:
  /// **'Expiry date'**
  String get expiryDate;

  /// No description provided for @remindMe.
  ///
  /// In en, this message translates to:
  /// **'Remind me'**
  String get remindMe;

  /// No description provided for @saveProduct.
  ///
  /// In en, this message translates to:
  /// **'Save product'**
  String get saveProduct;

  /// No description provided for @pleaseEnterProductName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a product name'**
  String get pleaseEnterProductName;

  /// No description provided for @productQuantityUpdated.
  ///
  /// In en, this message translates to:
  /// **'{name} quantity updated to {qty}.'**
  String productQuantityUpdated(String name, int qty);

  /// No description provided for @productSaved.
  ///
  /// In en, this message translates to:
  /// **'{name} saved. Reminders set.'**
  String productSaved(String name);

  /// No description provided for @notSignedIn.
  ///
  /// In en, this message translates to:
  /// **'You are not signed in.'**
  String get notSignedIn;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product details'**
  String get productDetails;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get editProduct;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get saveChanges;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @deleteProductTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete product?'**
  String get deleteProductTitle;

  /// No description provided for @deleteProductMessage.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" and its reminders will be removed permanently.'**
  String deleteProductMessage(String name);

  /// No description provided for @productUpdated.
  ///
  /// In en, this message translates to:
  /// **'Product updated'**
  String get productUpdated;

  /// No description provided for @couldNotUpdateProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not update product'**
  String get couldNotUpdateProduct;

  /// No description provided for @remindersUpdated.
  ///
  /// In en, this message translates to:
  /// **'Reminders updated'**
  String get remindersUpdated;

  /// No description provided for @couldNotUpdateReminders.
  ///
  /// In en, this message translates to:
  /// **'Could not update reminders'**
  String get couldNotUpdateReminders;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @noteHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. opened, keep in door shelf…'**
  String get noteHint;

  /// No description provided for @noteSaved.
  ///
  /// In en, this message translates to:
  /// **'Note saved'**
  String get noteSaved;

  /// No description provided for @couldNotSaveNote.
  ///
  /// In en, this message translates to:
  /// **'Could not save note'**
  String get couldNotSaveNote;

  /// No description provided for @noNoteYet.
  ///
  /// In en, this message translates to:
  /// **'No note yet.'**
  String get noNoteYet;

  /// No description provided for @markedAsConsumed.
  ///
  /// In en, this message translates to:
  /// **'Marked as consumed'**
  String get markedAsConsumed;

  /// No description provided for @movedBackToInventory.
  ///
  /// In en, this message translates to:
  /// **'Moved back to inventory'**
  String get movedBackToInventory;

  /// No description provided for @couldNotUpdateStatus.
  ///
  /// In en, this message translates to:
  /// **'Could not update status'**
  String get couldNotUpdateStatus;

  /// No description provided for @markAsConsumed.
  ///
  /// In en, this message translates to:
  /// **'Mark as consumed'**
  String get markAsConsumed;

  /// No description provided for @moveBackToInventory.
  ///
  /// In en, this message translates to:
  /// **'Move back to inventory'**
  String get moveBackToInventory;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @scanLabel.
  ///
  /// In en, this message translates to:
  /// **'Scan label'**
  String get scanLabel;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @noNutritionDataYet.
  ///
  /// In en, this message translates to:
  /// **'No nutrition data yet.'**
  String get noNutritionDataYet;

  /// No description provided for @nutritionInfoUpdated.
  ///
  /// In en, this message translates to:
  /// **'Nutrition info updated'**
  String get nutritionInfoUpdated;

  /// No description provided for @couldNotSaveNutritionData.
  ///
  /// In en, this message translates to:
  /// **'Could not save nutrition data'**
  String get couldNotSaveNutritionData;

  /// No description provided for @couldNotDetectNutritionShort.
  ///
  /// In en, this message translates to:
  /// **'Could not detect nutrition info. Try with clearer focus.'**
  String get couldNotDetectNutritionShort;

  /// No description provided for @productDeleted.
  ///
  /// In en, this message translates to:
  /// **'Product deleted'**
  String get productDeleted;

  /// No description provided for @couldNotDeleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Could not delete product'**
  String get couldNotDeleteProduct;

  /// No description provided for @getRecipeIdeas.
  ///
  /// In en, this message translates to:
  /// **'Get recipe ideas'**
  String get getRecipeIdeas;

  /// No description provided for @dateSource.
  ///
  /// In en, this message translates to:
  /// **'Date source'**
  String get dateSource;

  /// No description provided for @sourceOcr.
  ///
  /// In en, this message translates to:
  /// **'Scanned (OCR)'**
  String get sourceOcr;

  /// No description provided for @sourceApi.
  ///
  /// In en, this message translates to:
  /// **'Product database'**
  String get sourceApi;

  /// No description provided for @sourceManual.
  ///
  /// In en, this message translates to:
  /// **'Entered manually'**
  String get sourceManual;

  /// No description provided for @manufactured.
  ///
  /// In en, this message translates to:
  /// **'Manufactured'**
  String get manufactured;

  /// No description provided for @barcode.
  ///
  /// In en, this message translates to:
  /// **'Barcode'**
  String get barcode;

  /// No description provided for @nutritionSourceApi.
  ///
  /// In en, this message translates to:
  /// **'Product database'**
  String get nutritionSourceApi;

  /// No description provided for @nutritionSourceOcr.
  ///
  /// In en, this message translates to:
  /// **'Scanned'**
  String get nutritionSourceOcr;

  /// No description provided for @nutritionSourceManual.
  ///
  /// In en, this message translates to:
  /// **'Manual'**
  String get nutritionSourceManual;

  /// No description provided for @perSourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Per {per} · Source: {source}'**
  String perSourceLabel(String per, String source);

  /// No description provided for @cal.
  ///
  /// In en, this message translates to:
  /// **'Cal'**
  String get cal;

  /// No description provided for @statusFresh.
  ///
  /// In en, this message translates to:
  /// **'Fresh'**
  String get statusFresh;

  /// No description provided for @statusExpiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Expiring soon'**
  String get statusExpiringSoon;

  /// No description provided for @statusExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get statusExpired;

  /// No description provided for @statusConsumed.
  ///
  /// In en, this message translates to:
  /// **'Consumed'**
  String get statusConsumed;

  /// No description provided for @categoryDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get categoryDairy;

  /// No description provided for @categoryBakery.
  ///
  /// In en, this message translates to:
  /// **'Bakery'**
  String get categoryBakery;

  /// No description provided for @categoryProduce.
  ///
  /// In en, this message translates to:
  /// **'Produce'**
  String get categoryProduce;

  /// No description provided for @categoryMeat.
  ///
  /// In en, this message translates to:
  /// **'Meat & Fish'**
  String get categoryMeat;

  /// No description provided for @categoryBeverages.
  ///
  /// In en, this message translates to:
  /// **'Beverages'**
  String get categoryBeverages;

  /// No description provided for @categorySnacks.
  ///
  /// In en, this message translates to:
  /// **'Snacks'**
  String get categorySnacks;

  /// No description provided for @categoryFrozen.
  ///
  /// In en, this message translates to:
  /// **'Frozen'**
  String get categoryFrozen;

  /// No description provided for @categoryPantry.
  ///
  /// In en, this message translates to:
  /// **'Pantry'**
  String get categoryPantry;

  /// No description provided for @categoryMedicine.
  ///
  /// In en, this message translates to:
  /// **'Medicine'**
  String get categoryMedicine;

  /// No description provided for @categoryCosmetics.
  ///
  /// In en, this message translates to:
  /// **'Cosmetics'**
  String get categoryCosmetics;

  /// No description provided for @categoryBaby.
  ///
  /// In en, this message translates to:
  /// **'Baby'**
  String get categoryBaby;

  /// No description provided for @categoryPetFood.
  ///
  /// In en, this message translates to:
  /// **'Pet Food'**
  String get categoryPetFood;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @storageFridge.
  ///
  /// In en, this message translates to:
  /// **'Fridge'**
  String get storageFridge;

  /// No description provided for @storageFreezer.
  ///
  /// In en, this message translates to:
  /// **'Freezer'**
  String get storageFreezer;

  /// No description provided for @storagePantry.
  ///
  /// In en, this message translates to:
  /// **'Pantry'**
  String get storagePantry;

  /// No description provided for @storageCabinet.
  ///
  /// In en, this message translates to:
  /// **'Cabinet'**
  String get storageCabinet;

  /// No description provided for @storageOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get storageOther;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 day ago} other{{count} days ago}}'**
  String daysAgo(int count);

  /// No description provided for @expiresToday.
  ///
  /// In en, this message translates to:
  /// **'Expires today'**
  String get expiresToday;

  /// No description provided for @expiresTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Expires tomorrow'**
  String get expiresTomorrow;

  /// No description provided for @daysLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} days left'**
  String daysLeft(int count);

  /// No description provided for @onExpiryDay.
  ///
  /// In en, this message translates to:
  /// **'On expiry day'**
  String get onExpiryDay;

  /// No description provided for @oneDayBefore.
  ///
  /// In en, this message translates to:
  /// **'1 day before'**
  String get oneDayBefore;

  /// No description provided for @daysBefore.
  ///
  /// In en, this message translates to:
  /// **'{count} days before'**
  String daysBefore(int count);

  /// No description provided for @notifExpiresToday.
  ///
  /// In en, this message translates to:
  /// **'{name} expires today'**
  String notifExpiresToday(String name);

  /// No description provided for @notifExpiresSoon.
  ///
  /// In en, this message translates to:
  /// **'{name} expires soon'**
  String notifExpiresSoon(String name);

  /// No description provided for @notifBodyToday.
  ///
  /// In en, this message translates to:
  /// **'Please use or discard it safely.'**
  String get notifBodyToday;

  /// No description provided for @notifBodySoon.
  ///
  /// In en, this message translates to:
  /// **'{name} expires in {count, plural, =1{1 day} other{{count} days}}. Use it soon to avoid waste.'**
  String notifBodySoon(String name, int count);

  /// No description provided for @expiryReminders.
  ///
  /// In en, this message translates to:
  /// **'Expiry Reminders'**
  String get expiryReminders;

  /// No description provided for @expiryRemindersDesc.
  ///
  /// In en, this message translates to:
  /// **'Reminders before your kitchen items expire.'**
  String get expiryRemindersDesc;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'bn',
        'en',
        'gu',
        'hi',
        'kn',
        'ml',
        'mr',
        'ta',
        'te'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'gu':
      return AppLocalizationsGu();
    case 'hi':
      return AppLocalizationsHi();
    case 'kn':
      return AppLocalizationsKn();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
