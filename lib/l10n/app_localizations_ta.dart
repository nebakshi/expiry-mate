// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'எப்போதும் புத்தம் புதிதாக.';

  @override
  String get skip => 'தவிர்';

  @override
  String get next => 'அடுத்து';

  @override
  String get getStarted => 'தொடங்கு';

  @override
  String get cancel => 'ரத்து';

  @override
  String get save => 'சேமி';

  @override
  String get delete => 'நீக்கு';

  @override
  String get retry => 'மீண்டும் முயற்சி';

  @override
  String get edit => 'திருத்து';

  @override
  String get add => 'சேர்';

  @override
  String get onboardingTitle1 => 'நொடிகளில் ஸ்கேன்';

  @override
  String get onboardingBody1 =>
      'பார்கோடில் கேமராவை நோக்குங்கள், தயாரிப்பை உடனடியாகக் கண்டறிவோம்.';

  @override
  String get onboardingTitle2 => 'காலாவதி தேதியைப் படி';

  @override
  String get onboardingBody2 =>
      'அச்சிடப்பட்ட தேதியை ஸ்கேன் செய்யுங்கள் — எங்கள் இந்தியா-முதல் பார்சர் MFG + best-before ஐயும் கையாளும்.';

  @override
  String get onboardingTitle3 => 'காலாவதியை ஒருபோதும் தவறவிடாதீர்';

  @override
  String get onboardingBody3 =>
      'காலாவதியாவதற்கு 7 நாட்கள், 2 நாட்கள் மற்றும் அந்த நாளில் நினைவூட்டல்கள் பெறுங்கள்.';

  @override
  String get onboardingTitle4 => 'உணவை வீணாக்காதீர்';

  @override
  String get onboardingBody4 =>
      'உங்கள் முழு சமையலறையையும் ஒரே இடத்தில் கண்காணித்து, கெட்டுப்போவதற்கு முன் பயன்படுத்துங்கள்.';

  @override
  String get continueWithGoogle => 'Google மூலம் தொடரவும்';

  @override
  String get continueWithApple => 'Apple மூலம் தொடரவும்';

  @override
  String get continueAsGuest => 'விருந்தினராகத் தொடரவும்';

  @override
  String get legalText =>
      'தொடர்வதன் மூலம் எங்கள் விதிமுறைகள் மற்றும் தனியுரிமைக் கொள்கையை ஏற்கிறீர்கள்.';

  @override
  String homeGreeting(String name) {
    return 'வணக்கம்$name 👋';
  }

  @override
  String get scan => 'ஸ்கேன்';

  @override
  String get searchHint => 'தயாரிப்புகள் அல்லது பிராண்டுகளைத் தேடுங்கள்';

  @override
  String get tracked => 'கண்காணிப்பு';

  @override
  String get expiring => 'விரைவில் காலாவதி';

  @override
  String get expired => 'காலாவதி';

  @override
  String get filterAll => 'அனைத்தும்';

  @override
  String get filterFresh => 'புதியது';

  @override
  String get filterExpiringSoon => 'விரைவில் காலாவதி';

  @override
  String get filterExpired => 'காலாவதி';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count பொருட்கள் காலாவதியாகின்றன — சமையல் குறிப்புகள் பெறுங்கள்',
      one: '1 பொருள் காலாவதியாகிறது — சமையல் குறிப்புகள் பெறுங்கள்',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'உங்கள் சமையலறை காலியாக உள்ளது';

  @override
  String get emptyKitchenMessage =>
      'காலாவதி தேதிகளைக் கண்காணிக்கவும் சரியான நேரத்தில் நினைவூட்டல்கள் பெறவும் உங்கள் முதல் தயாரிப்பை ஸ்கேன் செய்யுங்கள்.';

  @override
  String get scanAProduct => 'ஒரு தயாரிப்பை ஸ்கேன் செய்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get guest => 'விருந்தினர்';

  @override
  String get account => 'கணக்கு';

  @override
  String get appearance => 'தோற்றம்';

  @override
  String get reminders => 'நினைவூட்டல்கள்';

  @override
  String get data => 'தரவு';

  @override
  String get about => 'பற்றி';

  @override
  String get accountActions => 'கணக்கு செயல்கள்';

  @override
  String get notificationPermission => 'அறிவிப்பு அனுமதி';

  @override
  String get allowBloomAlerts =>
      'Bloom காலாவதி எச்சரிக்கைகள் அனுப்ப அனுமதிக்கவும்';

  @override
  String get exportMyData => 'எனது தரவை ஏற்றுமதி செய்';

  @override
  String get exportSubtitle => 'உங்கள் சரக்குகளை JSON ஆக நகலெடுக்கவும்';

  @override
  String get privacyPolicy => 'தனியுரிமைக் கொள்கை';

  @override
  String get termsAndConditions => 'விதிமுறைகள் & நிபந்தனைகள்';

  @override
  String get version => 'பதிப்பு';

  @override
  String get signOut => 'வெளியேறு';

  @override
  String get deleteAccount => 'கணக்கை நீக்கு';

  @override
  String get permanentlyRemovesData => 'உங்கள் தரவை நிரந்தரமாக நீக்குகிறது';

  @override
  String get signOutConfirmTitle => 'வெளியேறவா?';

  @override
  String get signOutConfirmMessage =>
      'எப்போது வேண்டுமானாலும் மீண்டும் உள்நுழையலாம்.';

  @override
  String get deleteAccountConfirmTitle => 'கணக்கை நீக்கவா?';

  @override
  String get deleteAccountConfirmMessage =>
      'இது உங்கள் கணக்கையும் சேமிக்கப்பட்ட அனைத்து தயாரிப்புகளையும் நிரந்தரமாக நீக்கும். இதை செயல்தவிர்க்க முடியாது.';

  @override
  String get freePlan => 'இலவச திட்டம்';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit இல் $total பொருட்கள் பயன்படுத்தப்பட்டன';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining மீதம்';
  }

  @override
  String get limitReached => 'வரம்பை எட்டியது';

  @override
  String get notificationsEnabled => 'அறிவிப்புகள் இயக்கப்பட்டன';

  @override
  String get notificationsOff =>
      'அறிவிப்புகள் முடக்கப்பட்டுள்ளன. சாதன அமைப்புகளில் இயக்கவும்.';

  @override
  String exportedItems(int count) {
    return '$count பொருட்கள் கிளிப்போர்டுக்கு ஏற்றுமதி செய்யப்பட்டன';
  }

  @override
  String get couldNotOpenLink => 'இணைப்பைத் திறக்க முடியவில்லை';

  @override
  String get accountDeleted => 'கணக்கு நீக்கப்பட்டது';

  @override
  String get reSignInToDelete =>
      'தயவுசெய்து மீண்டும் உள்நுழைந்து, கணக்கு நீக்குதலை முயற்சிக்கவும்.';

  @override
  String get couldNotDeleteAccount => 'கணக்கை நீக்க முடியவில்லை';

  @override
  String get signedInWithGoogle => 'Google மூலம் உள்நுழைந்தது';

  @override
  String get signedInWithApple => 'Apple மூலம் உள்நுழைந்தது';

  @override
  String get guestAccount => 'விருந்தினர் கணக்கு';

  @override
  String get signedIn => 'உள்நுழைந்தது';

  @override
  String get defaultReminders => 'இயல்புநிலை நினைவூட்டல்கள்';

  @override
  String get appliedToNewProducts =>
      'நீங்கள் சேர்க்கும் புதிய தயாரிப்புகளுக்குப் பொருந்தும்';

  @override
  String get theme => 'தீம்';

  @override
  String get scanBarcode => 'பார்கோடை ஸ்கேன் செய்';

  @override
  String get enterManually => 'கைமுறையாக உள்ளிடு';

  @override
  String get cameraUnavailable =>
      'கேமரா கிடைக்கவில்லை. அனுமதிகளை சரிபார்க்கவும் அல்லது கைமுறையாக உள்ளிடவும்.';

  @override
  String get lookingUpProduct => 'தயாரிப்பைத் தேடுகிறது…';

  @override
  String get pointAtBarcode => 'தயாரிப்பு பார்கோடில் நோக்குங்கள்';

  @override
  String get scanExpiryDate => 'காலாவதி தேதியை ஸ்கேன் செய்';

  @override
  String get searchProductByName => 'பெயரால் தயாரிப்பைத் தேடு';

  @override
  String get searchProduct => 'தயாரிப்பைத் தேடு';

  @override
  String get searchHintExample => 'எ.கா. மேகி கெட்ச்அப்';

  @override
  String get typeProductNameHint => 'தயாரிப்பு பெயரை தட்டச்சு செய்து தேடவும்.';

  @override
  String get scanExpiryInstruction =>
      'அச்சிடப்பட்ட காலாவதி, \"best before\", அல்லது MFG தேதியில் கேமராவை நோக்குங்கள்.';

  @override
  String get captureDateLabel => 'தேதி லேபிளை கேப்சர் செய்';

  @override
  String get reScan => 'மீண்டும் ஸ்கேன்';

  @override
  String get pickDateManually => 'தேதியை கைமுறையாக தேர்வு செய்';

  @override
  String get detectedDates => 'கண்டறியப்பட்ட தேதிகள்';

  @override
  String get detectedDatesPlaceholder =>
      'கண்டறியப்பட்ட தேதிகள் இங்கே தோன்றும்.';

  @override
  String get noDateDetected =>
      'தேதி கண்டறியப்படவில்லை. கீழே கைமுறையாக தேர்வு செய்யவும்.';

  @override
  String get couldNotCaptureImage => 'படத்தை எடுக்க முடியவில்லை.';

  @override
  String get scanNutritionLabel => 'ஊட்டச்சத்து லேபிளை ஸ்கேன் செய்';

  @override
  String get nutritionInstruction =>
      'பேக்கேஜில் உள்ள ஊட்டச்சத்து அட்டவணையில் கேமராவை நோக்குங்கள்.';

  @override
  String get captureNutritionLabel => 'ஊட்டச்சத்து லேபிளை கேப்சர் செய்';

  @override
  String get useTheseValues => 'இந்த மதிப்புகளைப் பயன்படுத்து';

  @override
  String get detectedNutritionPlaceholder =>
      'கண்டறியப்பட்ட ஊட்டச்சத்து மதிப்புகள் இங்கே தோன்றும்.';

  @override
  String get detectedValuesPer100g => 'கண்டறியப்பட்ட மதிப்புகள் (100g க்கு)';

  @override
  String get calories => 'கலோரிகள்';

  @override
  String get protein => 'புரதம்';

  @override
  String get fat => 'கொழுப்பு';

  @override
  String get carbs => 'கார்ப்ஸ்';

  @override
  String get fiber => 'நார்ச்சத்து';

  @override
  String get sugar => 'சர்க்கரை';

  @override
  String get couldNotDetectNutrition =>
      'ஊட்டச்சத்து தகவல் கண்டறிய முடியவில்லை. லேபிளில் தெளிவான கவனத்துடன் மீண்டும் முயற்சிக்கவும்.';

  @override
  String get recipeIdeas => 'சமையல் குறிப்புகள்';

  @override
  String get thinkingOfRecipes => 'சமையல் குறிப்புகள் யோசிக்கிறது...';

  @override
  String get couldNotGenerateRecipes =>
      'இப்போது பரிந்துரைகளை உருவாக்க முடியவில்லை. பின்னர் முயற்சிக்கவும்.';

  @override
  String usingProducts(String products) {
    return 'பயன்படுத்துவது: $products';
  }

  @override
  String get ingredients => 'பொருட்கள்';

  @override
  String get steps => 'படிகள்';

  @override
  String get confirmDetails => 'விவரங்களை உறுதிப்படுத்து';

  @override
  String get productName => 'தயாரிப்பு பெயர்';

  @override
  String get productNameHint => 'எ.கா. ஆவின் வெண்ணெய்';

  @override
  String get brandOptional => 'பிராண்ட் (விருப்பம்)';

  @override
  String get brandHint => 'எ.கா. ஆவின்';

  @override
  String get category => 'வகை';

  @override
  String get storage => 'சேமிப்பு';

  @override
  String get quantity => 'எண்ணிக்கை';

  @override
  String nutritionPer(String per) {
    return 'ஊட்டச்சத்து ($per க்கு)';
  }

  @override
  String get expiryDate => 'காலாவதி தேதி';

  @override
  String get remindMe => 'நினைவூட்டு';

  @override
  String get saveProduct => 'தயாரிப்பைச் சேமி';

  @override
  String get pleaseEnterProductName => 'தயாரிப்பு பெயரை உள்ளிடவும்';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name எண்ணிக்கை $qty ஆக புதுப்பிக்கப்பட்டது.';
  }

  @override
  String productSaved(String name) {
    return '$name சேமிக்கப்பட்டது. நினைவூட்டல்கள் அமைக்கப்பட்டன.';
  }

  @override
  String get notSignedIn => 'நீங்கள் உள்நுழையவில்லை.';

  @override
  String get productDetails => 'தயாரிப்பு விவரங்கள்';

  @override
  String get editProduct => 'தயாரிப்பைத் திருத்து';

  @override
  String get saveChanges => 'மாற்றங்களைச் சேமி';

  @override
  String get required => 'தேவை';

  @override
  String get deleteProductTitle => 'தயாரிப்பை நீக்கவா?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" மற்றும் அதன் நினைவூட்டல்கள் நிரந்தரமாக நீக்கப்படும்.';
  }

  @override
  String get productUpdated => 'தயாரிப்பு புதுப்பிக்கப்பட்டது';

  @override
  String get couldNotUpdateProduct => 'தயாரிப்பை புதுப்பிக்க முடியவில்லை';

  @override
  String get remindersUpdated => 'நினைவூட்டல்கள் புதுப்பிக்கப்பட்டன';

  @override
  String get couldNotUpdateReminders =>
      'நினைவூட்டல்களை புதுப்பிக்க முடியவில்லை';

  @override
  String get note => 'குறிப்பு';

  @override
  String get noteHint => 'எ.கா. திறக்கப்பட்டது, கதவு அலமாரியில் வை…';

  @override
  String get noteSaved => 'குறிப்பு சேமிக்கப்பட்டது';

  @override
  String get couldNotSaveNote => 'குறிப்பை சேமிக்க முடியவில்லை';

  @override
  String get noNoteYet => 'இன்னும் குறிப்பு இல்லை.';

  @override
  String get markedAsConsumed => 'பயன்படுத்தியது எனக் குறிக்கப்பட்டது';

  @override
  String get movedBackToInventory => 'சரக்குகளுக்கு மீண்டும் நகர்த்தப்பட்டது';

  @override
  String get couldNotUpdateStatus => 'நிலையை புதுப்பிக்க முடியவில்லை';

  @override
  String get markAsConsumed => 'பயன்படுத்தியது எனக் குறி';

  @override
  String get moveBackToInventory => 'சரக்குகளுக்கு மீண்டும் நகர்த்து';

  @override
  String get nutrition => 'ஊட்டச்சத்து';

  @override
  String get scanLabel => 'லேபிளை ஸ்கேன் செய்';

  @override
  String get update => 'புதுப்பி';

  @override
  String get noNutritionDataYet => 'இன்னும் ஊட்டச்சத்து தரவு இல்லை.';

  @override
  String get nutritionInfoUpdated => 'ஊட்டச்சத்து தகவல் புதுப்பிக்கப்பட்டது';

  @override
  String get couldNotSaveNutritionData =>
      'ஊட்டச்சத்து தரவை சேமிக்க முடியவில்லை';

  @override
  String get couldNotDetectNutritionShort =>
      'ஊட்டச்சத்து தகவல் கண்டறிய முடியவில்லை. தெளிவாக முயற்சிக்கவும்.';

  @override
  String get productDeleted => 'தயாரிப்பு நீக்கப்பட்டது';

  @override
  String get couldNotDeleteProduct => 'தயாரிப்பை நீக்க முடியவில்லை';

  @override
  String get getRecipeIdeas => 'சமையல் குறிப்புகள் பெறு';

  @override
  String get dateSource => 'தேதி மூலம்';

  @override
  String get sourceOcr => 'ஸ்கேன் செய்யப்பட்டது (OCR)';

  @override
  String get sourceApi => 'தயாரிப்பு தரவுத்தளம்';

  @override
  String get sourceManual => 'கைமுறையாக உள்ளிடப்பட்டது';

  @override
  String get manufactured => 'தயாரிக்கப்பட்டது';

  @override
  String get barcode => 'பார்கோடு';

  @override
  String get nutritionSourceApi => 'தயாரிப்பு தரவுத்தளம்';

  @override
  String get nutritionSourceOcr => 'ஸ்கேன் செய்யப்பட்டது';

  @override
  String get nutritionSourceManual => 'கைமுறை';

  @override
  String perSourceLabel(String per, String source) {
    return '$per க்கு · மூலம்: $source';
  }

  @override
  String get cal => 'கலோ';

  @override
  String get statusFresh => 'புதியது';

  @override
  String get statusExpiringSoon => 'விரைவில் காலாவதி';

  @override
  String get statusExpired => 'காலாவதி';

  @override
  String get statusConsumed => 'பயன்படுத்தப்பட்டது';

  @override
  String get categoryDairy => 'பால் பொருட்கள்';

  @override
  String get categoryBakery => 'பேக்கரி';

  @override
  String get categoryProduce => 'காய்கறி';

  @override
  String get categoryMeat => 'இறைச்சி & மீன்';

  @override
  String get categoryBeverages => 'பானங்கள்';

  @override
  String get categorySnacks => 'தின்பண்டங்கள்';

  @override
  String get categoryFrozen => 'உறைநிலை';

  @override
  String get categoryPantry => 'பேண்ட்ரி';

  @override
  String get categoryMedicine => 'மருந்து';

  @override
  String get categoryCosmetics => 'அழகுசாதனம்';

  @override
  String get categoryBaby => 'குழந்தை';

  @override
  String get categoryPetFood => 'செல்லப்பிராணி உணவு';

  @override
  String get categoryOther => 'பிற';

  @override
  String get storageFridge => 'குளிர்சாதனப்பெட்டி';

  @override
  String get storageFreezer => 'உறைவிப்பான்';

  @override
  String get storagePantry => 'பேண்ட்ரி';

  @override
  String get storageCabinet => 'அலமாரி';

  @override
  String get storageOther => 'பிற';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count நாட்கள் முன்',
      one: '1 நாள் முன்',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'இன்று காலாவதி';

  @override
  String get expiresTomorrow => 'நாளை காலாவதி';

  @override
  String daysLeft(int count) {
    return '$count நாட்கள் மீதம்';
  }

  @override
  String get onExpiryDay => 'காலாவதி நாளில்';

  @override
  String get oneDayBefore => '1 நாள் முன்';

  @override
  String daysBefore(int count) {
    return '$count நாட்கள் முன்';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name இன்று காலாவதியாகிறது';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name விரைவில் காலாவதியாகும்';
  }

  @override
  String get notifBodyToday =>
      'தயவுசெய்து பாதுகாப்பாகப் பயன்படுத்தவும் அல்லது அப்புறப்படுத்தவும்.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count நாட்களில்',
      one: '1 நாளில்',
    );
    return '$name $_temp0 காலாவதியாகும். வீணாவதைத் தவிர்க்க விரைவில் பயன்படுத்தவும்.';
  }

  @override
  String get expiryReminders => 'காலாவதி நினைவூட்டல்கள்';

  @override
  String get expiryRemindersDesc =>
      'உங்கள் சமையலறைப் பொருட்கள் காலாவதியாவதற்கு முன் நினைவூட்டல்கள்.';

  @override
  String get language => 'மொழி';
}
