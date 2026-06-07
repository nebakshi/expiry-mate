// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'नेहमी ताजे ठेवा.';

  @override
  String get skip => 'वगळा';

  @override
  String get next => 'पुढे';

  @override
  String get getStarted => 'सुरू करा';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get save => 'जतन करा';

  @override
  String get delete => 'हटवा';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get edit => 'संपादित करा';

  @override
  String get add => 'जोडा';

  @override
  String get onboardingTitle1 => 'सेकंदात स्कॅन करा';

  @override
  String get onboardingBody1 =>
      'बारकोडवर कॅमेरा धरा आणि आम्ही उत्पादन लगेच ओळखतो.';

  @override
  String get onboardingTitle2 => 'एक्सपायरी तारीख वाचा';

  @override
  String get onboardingBody2 =>
      'छापील तारीख स्कॅन करा — आमचा भारत-केंद्रित पार्सर MFG + best-before देखील हाताळतो.';

  @override
  String get onboardingTitle3 => 'एक्सपायरी कधीच चुकवू नका';

  @override
  String get onboardingBody3 =>
      'एक्सपायरी आधी ७ दिवस, २ दिवस आणि त्या दिवशी रिमाइंडर मिळवा.';

  @override
  String get onboardingTitle4 => 'अन्न वाया घालवू नका';

  @override
  String get onboardingBody4 =>
      'तुमची संपूर्ण स्वयंपाकघर एकाच ठिकाणी ट्रॅक करा आणि खराब होण्यापूर्वी वापरा.';

  @override
  String get continueWithGoogle => 'Google ने सुरू ठेवा';

  @override
  String get continueWithApple => 'Apple ने सुरू ठेवा';

  @override
  String get continueAsGuest => 'पाहुणे म्हणून सुरू ठेवा';

  @override
  String get legalText =>
      'सुरू ठेवून तुम्ही आमच्या अटी आणि गोपनीयता धोरणाशी सहमत आहात.';

  @override
  String homeGreeting(String name) {
    return 'नमस्कार$name 👋';
  }

  @override
  String get scan => 'स्कॅन';

  @override
  String get searchHint => 'उत्पादने किंवा ब्रँड शोधा';

  @override
  String get tracked => 'ट्रॅक';

  @override
  String get expiring => 'लवकरच एक्सपायर';

  @override
  String get expired => 'एक्सपायर्ड';

  @override
  String get filterAll => 'सर्व';

  @override
  String get filterFresh => 'ताजे';

  @override
  String get filterExpiringSoon => 'लवकरच एक्सपायर';

  @override
  String get filterExpired => 'एक्सपायर्ड';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आयटम एक्सपायर होत आहेत — रेसिपी सूचना मिळवा',
      one: '१ आयटम एक्सपायर होत आहे — रेसिपी सूचना मिळवा',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'तुमचे स्वयंपाकघर रिकामे आहे';

  @override
  String get emptyKitchenMessage =>
      'एक्सपायरी तारखा ट्रॅक करण्यासाठी आणि वेळेवर रिमाइंडर मिळवण्यासाठी तुमचे पहिले उत्पादन स्कॅन करा.';

  @override
  String get scanAProduct => 'एक उत्पादन स्कॅन करा';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get guest => 'पाहुणे';

  @override
  String get account => 'खाते';

  @override
  String get appearance => 'दिसावट';

  @override
  String get reminders => 'रिमाइंडर';

  @override
  String get data => 'डेटा';

  @override
  String get about => 'माहिती';

  @override
  String get accountActions => 'खाते क्रिया';

  @override
  String get notificationPermission => 'सूचना परवानगी';

  @override
  String get allowBloomAlerts => 'Bloom ला एक्सपायरी सूचना पाठवू द्या';

  @override
  String get exportMyData => 'माझा डेटा निर्यात करा';

  @override
  String get exportSubtitle => 'तुमची इन्व्हेंटरी JSON म्हणून कॉपी करा';

  @override
  String get privacyPolicy => 'गोपनीयता धोरण';

  @override
  String get termsAndConditions => 'अटी आणि शर्ती';

  @override
  String get version => 'आवृत्ती';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get deleteAccount => 'खाते हटवा';

  @override
  String get permanentlyRemovesData => 'तुमचा डेटा कायमचा हटवतो';

  @override
  String get signOutConfirmTitle => 'साइन आउट करायचे?';

  @override
  String get signOutConfirmMessage => 'तुम्ही कधीही परत साइन इन करू शकता.';

  @override
  String get deleteAccountConfirmTitle => 'खाते हटवायचे?';

  @override
  String get deleteAccountConfirmMessage =>
      'हे तुमचे खाते आणि सर्व जतन केलेली उत्पादने कायमची हटवेल. हे पूर्ववत करता येणार नाही.';

  @override
  String get freePlan => 'मोफत प्लॅन';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit पैकी $total आयटम वापरले';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining शिल्लक';
  }

  @override
  String get limitReached => 'मर्यादा गाठली';

  @override
  String get notificationsEnabled => 'सूचना सक्षम';

  @override
  String get notificationsOff =>
      'सूचना बंद आहेत. तुमच्या डिव्हाइस सेटिंग्जमध्ये सक्षम करा.';

  @override
  String exportedItems(int count) {
    return '$count आयटम क्लिपबोर्डवर निर्यात केले';
  }

  @override
  String get couldNotOpenLink => 'लिंक उघडता आली नाही';

  @override
  String get accountDeleted => 'खाते हटवले';

  @override
  String get reSignInToDelete =>
      'कृपया पुन्हा साइन इन करा, मग खाते हटवण्याचा प्रयत्न करा.';

  @override
  String get couldNotDeleteAccount => 'खाते हटवता आले नाही';

  @override
  String get signedInWithGoogle => 'Google ने साइन इन';

  @override
  String get signedInWithApple => 'Apple ने साइन इन';

  @override
  String get guestAccount => 'पाहुणे खाते';

  @override
  String get signedIn => 'साइन इन';

  @override
  String get defaultReminders => 'डीफॉल्ट रिमाइंडर';

  @override
  String get appliedToNewProducts => 'नवीन उत्पादनांना लागू होते';

  @override
  String get theme => 'थीम';

  @override
  String get scanBarcode => 'बारकोड स्कॅन करा';

  @override
  String get enterManually => 'स्वहस्ते प्रविष्ट करा';

  @override
  String get cameraUnavailable =>
      'कॅमेरा उपलब्ध नाही. परवानग्या तपासा किंवा स्वहस्ते प्रविष्ट करा.';

  @override
  String get lookingUpProduct => 'उत्पादन शोधत आहे…';

  @override
  String get pointAtBarcode => 'उत्पादनाच्या बारकोडवर कॅमेरा धरा';

  @override
  String get scanExpiryDate => 'एक्सपायरी तारीख स्कॅन करा';

  @override
  String get searchProductByName => 'नावाने उत्पादन शोधा';

  @override
  String get searchProduct => 'उत्पादन शोधा';

  @override
  String get searchHintExample => 'उदा. मॅगी केचप';

  @override
  String get typeProductNameHint => 'उत्पादनाचे नाव टाइप करून शोधा.';

  @override
  String get scanExpiryInstruction =>
      'छापील एक्सपायरी, \"best before\", किंवा MFG तारखेवर कॅमेरा धरा.';

  @override
  String get captureDateLabel => 'तारीख लेबल कॅप्चर करा';

  @override
  String get reScan => 'पुन्हा स्कॅन';

  @override
  String get pickDateManually => 'तारीख स्वहस्ते निवडा';

  @override
  String get detectedDates => 'ओळखलेल्या तारखा';

  @override
  String get detectedDatesPlaceholder => 'ओळखलेल्या तारखा येथे दिसतील.';

  @override
  String get noDateDetected => 'तारीख ओळखली नाही. खाली स्वहस्ते निवडा.';

  @override
  String get couldNotCaptureImage => 'प्रतिमा कॅप्चर करता आली नाही.';

  @override
  String get scanNutritionLabel => 'पोषण लेबल स्कॅन करा';

  @override
  String get nutritionInstruction =>
      'पॅकेजवरील पोषण तथ्ये तक्त्यावर कॅमेरा धरा.';

  @override
  String get captureNutritionLabel => 'पोषण लेबल कॅप्चर करा';

  @override
  String get useTheseValues => 'ही मूल्ये वापरा';

  @override
  String get detectedNutritionPlaceholder => 'ओळखलेली पोषण मूल्ये येथे दिसतील.';

  @override
  String get detectedValuesPer100g => 'ओळखलेली मूल्ये (प्रति 100g)';

  @override
  String get calories => 'कॅलरी';

  @override
  String get protein => 'प्रथिने';

  @override
  String get fat => 'चरबी';

  @override
  String get carbs => 'कार्ब्स';

  @override
  String get fiber => 'फायबर';

  @override
  String get sugar => 'साखर';

  @override
  String get couldNotDetectNutrition =>
      'पोषण माहिती ओळखता आली नाही. लेबलवर स्पष्ट फोकसने पुन्हा प्रयत्न करा.';

  @override
  String get recipeIdeas => 'रेसिपी सूचना';

  @override
  String get thinkingOfRecipes => 'रेसिपी विचार करत आहे...';

  @override
  String get couldNotGenerateRecipes =>
      'सध्या सूचना तयार करता आल्या नाहीत. नंतर पुन्हा प्रयत्न करा.';

  @override
  String usingProducts(String products) {
    return 'वापरत आहे: $products';
  }

  @override
  String get ingredients => 'साहित्य';

  @override
  String get steps => 'पायऱ्या';

  @override
  String get confirmDetails => 'तपशील पुष्टी करा';

  @override
  String get productName => 'उत्पादनाचे नाव';

  @override
  String get productNameHint => 'उदा. अमूल बटर';

  @override
  String get brandOptional => 'ब्रँड (पर्यायी)';

  @override
  String get brandHint => 'उदा. अमूल';

  @override
  String get category => 'वर्ग';

  @override
  String get storage => 'स्टोरेज';

  @override
  String get quantity => 'प्रमाण';

  @override
  String nutritionPer(String per) {
    return 'पोषण (प्रति $per)';
  }

  @override
  String get expiryDate => 'एक्सपायरी तारीख';

  @override
  String get remindMe => 'मला आठवण करून द्या';

  @override
  String get saveProduct => 'उत्पादन जतन करा';

  @override
  String get pleaseEnterProductName => 'कृपया उत्पादनाचे नाव प्रविष्ट करा';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name प्रमाण $qty वर अद्ययावत केले.';
  }

  @override
  String productSaved(String name) {
    return '$name जतन केले. रिमाइंडर सेट केले.';
  }

  @override
  String get notSignedIn => 'तुम्ही साइन इन नाही आहात.';

  @override
  String get productDetails => 'उत्पादन तपशील';

  @override
  String get editProduct => 'उत्पादन संपादित करा';

  @override
  String get saveChanges => 'बदल जतन करा';

  @override
  String get required => 'आवश्यक';

  @override
  String get deleteProductTitle => 'उत्पादन हटवायचे?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" आणि त्याचे रिमाइंडर कायमचे हटवले जातील.';
  }

  @override
  String get productUpdated => 'उत्पादन अद्ययावत केले';

  @override
  String get couldNotUpdateProduct => 'उत्पादन अद्ययावत करता आले नाही';

  @override
  String get remindersUpdated => 'रिमाइंडर अद्ययावत केले';

  @override
  String get couldNotUpdateReminders => 'रिमाइंडर अद्ययावत करता आले नाहीत';

  @override
  String get note => 'टीप';

  @override
  String get noteHint => 'उदा. उघडले, दरवाजाच्या शेल्फमध्ये ठेवा…';

  @override
  String get noteSaved => 'टीप जतन केली';

  @override
  String get couldNotSaveNote => 'टीप जतन करता आली नाही';

  @override
  String get noNoteYet => 'अजून टीप नाही.';

  @override
  String get markedAsConsumed => 'वापरले म्हणून चिन्हांकित';

  @override
  String get movedBackToInventory => 'इन्व्हेंटरीमध्ये परत हलवले';

  @override
  String get couldNotUpdateStatus => 'स्थिती अद्ययावत करता आली नाही';

  @override
  String get markAsConsumed => 'वापरले म्हणून चिन्हांकित करा';

  @override
  String get moveBackToInventory => 'इन्व्हेंटरीमध्ये परत हलवा';

  @override
  String get nutrition => 'पोषण';

  @override
  String get scanLabel => 'लेबल स्कॅन';

  @override
  String get update => 'अद्ययावत करा';

  @override
  String get noNutritionDataYet => 'अजून पोषण डेटा नाही.';

  @override
  String get nutritionInfoUpdated => 'पोषण माहिती अद्ययावत केली';

  @override
  String get couldNotSaveNutritionData => 'पोषण डेटा जतन करता आला नाही';

  @override
  String get couldNotDetectNutritionShort =>
      'पोषण माहिती ओळखता आली नाही. स्पष्ट फोकसने प्रयत्न करा.';

  @override
  String get productDeleted => 'उत्पादन हटवले';

  @override
  String get couldNotDeleteProduct => 'उत्पादन हटवता आले नाही';

  @override
  String get getRecipeIdeas => 'रेसिपी सूचना मिळवा';

  @override
  String get dateSource => 'तारीख स्रोत';

  @override
  String get sourceOcr => 'स्कॅन केले (OCR)';

  @override
  String get sourceApi => 'उत्पादन डेटाबेस';

  @override
  String get sourceManual => 'स्वहस्ते प्रविष्ट';

  @override
  String get manufactured => 'उत्पादित';

  @override
  String get barcode => 'बारकोड';

  @override
  String get nutritionSourceApi => 'उत्पादन डेटाबेस';

  @override
  String get nutritionSourceOcr => 'स्कॅन केले';

  @override
  String get nutritionSourceManual => 'स्वहस्ते';

  @override
  String perSourceLabel(String per, String source) {
    return 'प्रति $per · स्रोत: $source';
  }

  @override
  String get cal => 'कॅल';

  @override
  String get statusFresh => 'ताजे';

  @override
  String get statusExpiringSoon => 'लवकरच एक्सपायर';

  @override
  String get statusExpired => 'एक्सपायर्ड';

  @override
  String get statusConsumed => 'वापरले';

  @override
  String get categoryDairy => 'दुग्धजन्य';

  @override
  String get categoryBakery => 'बेकरी';

  @override
  String get categoryProduce => 'भाजीपाला';

  @override
  String get categoryMeat => 'मांस आणि मासे';

  @override
  String get categoryBeverages => 'पेये';

  @override
  String get categorySnacks => 'स्नॅक्स';

  @override
  String get categoryFrozen => 'फ्रोझन';

  @override
  String get categoryPantry => 'पॅन्ट्री';

  @override
  String get categoryMedicine => 'औषध';

  @override
  String get categoryCosmetics => 'सौंदर्यप्रसाधने';

  @override
  String get categoryBaby => 'बाळ';

  @override
  String get categoryPetFood => 'पेट फूड';

  @override
  String get categoryOther => 'इतर';

  @override
  String get storageFridge => 'फ्रिज';

  @override
  String get storageFreezer => 'फ्रीझर';

  @override
  String get storagePantry => 'पॅन्ट्री';

  @override
  String get storageCabinet => 'कपाट';

  @override
  String get storageOther => 'इतर';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिवसांपूर्वी',
      one: '१ दिवसापूर्वी',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'आज एक्सपायर';

  @override
  String get expiresTomorrow => 'उद्या एक्सपायर';

  @override
  String daysLeft(int count) {
    return '$count दिवस शिल्लक';
  }

  @override
  String get onExpiryDay => 'एक्सपायरीच्या दिवशी';

  @override
  String get oneDayBefore => '१ दिवस आधी';

  @override
  String daysBefore(int count) {
    return '$count दिवस आधी';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name आज एक्सपायर होत आहे';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name लवकरच एक्सपायर होणार आहे';
  }

  @override
  String get notifBodyToday => 'कृपया सुरक्षितपणे वापरा किंवा टाकून द्या.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिवसांत',
      one: '१ दिवसात',
    );
    return '$name $_temp0 एक्सपायर होईल. अन्न वाया जाऊ नये म्हणून लवकर वापरा.';
  }

  @override
  String get expiryReminders => 'एक्सपायरी रिमाइंडर';

  @override
  String get expiryRemindersDesc =>
      'तुमच्या स्वयंपाकघरातील वस्तूंच्या एक्सपायरीपूर्वी रिमाइंडर.';

  @override
  String get language => 'भाषा';
}
