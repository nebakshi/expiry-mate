// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'ताज़ा रखें। हमेशा।';

  @override
  String get skip => 'छोड़ें';

  @override
  String get next => 'अगला';

  @override
  String get getStarted => 'शुरू करें';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get delete => 'हटाएं';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get edit => 'संपादित करें';

  @override
  String get add => 'जोड़ें';

  @override
  String get onboardingTitle1 => 'सेकंडों में स्कैन करें';

  @override
  String get onboardingBody1 =>
      'अपना कैमरा बारकोड पर ले जाएं और हम उत्पाद को तुरंत पहचान लेंगे।';

  @override
  String get onboardingTitle2 => 'एक्सपायरी तारीख पढ़ें';

  @override
  String get onboardingBody2 =>
      'प्रिंटेड तारीख स्कैन करें — हमारा भारत-केंद्रित पार्सर MFG + बेस्ट-बिफोर भी संभालता है।';

  @override
  String get onboardingTitle3 => 'कभी एक्सपायरी न चूकें';

  @override
  String get onboardingBody3 =>
      'एक्सपायरी से 7 दिन, 2 दिन और उसी दिन रिमाइंडर पाएं।';

  @override
  String get onboardingTitle4 => 'खाना बर्बाद न करें';

  @override
  String get onboardingBody4 =>
      'अपनी पूरी रसोई एक जगह ट्रैक करें और चीज़ें खराब होने से पहले इस्तेमाल करें।';

  @override
  String get continueWithGoogle => 'Google से जारी रखें';

  @override
  String get continueWithApple => 'Apple से जारी रखें';

  @override
  String get continueAsGuest => 'अतिथि के रूप में जारी रखें';

  @override
  String get legalText =>
      'जारी रखकर आप हमारी शर्तों और गोपनीयता नीति से सहमत होते हैं।';

  @override
  String homeGreeting(String name) {
    return 'नमस्ते$name 👋';
  }

  @override
  String get scan => 'स्कैन';

  @override
  String get searchHint => 'उत्पाद या ब्रांड खोजें';

  @override
  String get tracked => 'ट्रैक किए';

  @override
  String get expiring => 'जल्द एक्सपायर';

  @override
  String get expired => 'एक्सपायर्ड';

  @override
  String get filterAll => 'सभी';

  @override
  String get filterFresh => 'ताज़ा';

  @override
  String get filterExpiringSoon => 'जल्द एक्सपायर';

  @override
  String get filterExpired => 'एक्सपायर्ड';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम एक्सपायर हो रहे हैं — रेसिपी सुझाव पाएं',
      one: '1 आइटम एक्सपायर हो रहा है — रेसिपी सुझाव पाएं',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'आपकी रसोई खाली है';

  @override
  String get emptyKitchenMessage =>
      'एक्सपायरी तारीखें ट्रैक करने और समय पर रिमाइंडर पाने के लिए अपना पहला उत्पाद स्कैन करें।';

  @override
  String get scanAProduct => 'एक उत्पाद स्कैन करें';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get guest => 'अतिथि';

  @override
  String get account => 'खाता';

  @override
  String get appearance => 'दिखावट';

  @override
  String get reminders => 'रिमाइंडर';

  @override
  String get data => 'डेटा';

  @override
  String get about => 'जानकारी';

  @override
  String get accountActions => 'खाता क्रियाएं';

  @override
  String get notificationPermission => 'सूचना अनुमति';

  @override
  String get allowBloomAlerts => 'Bloom को एक्सपायरी अलर्ट भेजने दें';

  @override
  String get exportMyData => 'मेरा डेटा एक्सपोर्ट करें';

  @override
  String get exportSubtitle => 'अपनी इन्वेंटरी JSON के रूप में कॉपी करें';

  @override
  String get privacyPolicy => 'गोपनीयता नीति';

  @override
  String get termsAndConditions => 'नियम और शर्तें';

  @override
  String get version => 'संस्करण';

  @override
  String get signOut => 'साइन आउट';

  @override
  String get deleteAccount => 'खाता हटाएं';

  @override
  String get permanentlyRemovesData => 'आपका डेटा स्थायी रूप से हटा देता है';

  @override
  String get signOutConfirmTitle => 'साइन आउट करें?';

  @override
  String get signOutConfirmMessage => 'आप कभी भी वापस साइन इन कर सकते हैं।';

  @override
  String get deleteAccountConfirmTitle => 'खाता हटाएं?';

  @override
  String get deleteAccountConfirmMessage =>
      'यह आपका खाता और सभी सहेजे गए उत्पाद स्थायी रूप से हटा देगा। यह पूर्ववत नहीं किया जा सकता।';

  @override
  String get freePlan => 'मुफ्त प्लान';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit में से $total आइटम उपयोग किए';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining शेष';
  }

  @override
  String get limitReached => 'सीमा पूरी हुई';

  @override
  String get notificationsEnabled => 'सूचनाएं सक्षम';

  @override
  String get notificationsOff =>
      'सूचनाएं बंद हैं। उन्हें अपनी डिवाइस सेटिंग्स में सक्षम करें।';

  @override
  String exportedItems(int count) {
    return '$count आइटम क्लिपबोर्ड पर एक्सपोर्ट किए गए';
  }

  @override
  String get couldNotOpenLink => 'लिंक नहीं खोला जा सका';

  @override
  String get accountDeleted => 'खाता हटाया गया';

  @override
  String get reSignInToDelete =>
      'कृपया फिर से साइन इन करें, फिर खाता हटाने का प्रयास करें।';

  @override
  String get couldNotDeleteAccount => 'खाता नहीं हटाया जा सका';

  @override
  String get signedInWithGoogle => 'Google से साइन इन';

  @override
  String get signedInWithApple => 'Apple से साइन इन';

  @override
  String get guestAccount => 'अतिथि खाता';

  @override
  String get signedIn => 'साइन इन';

  @override
  String get defaultReminders => 'डिफ़ॉल्ट रिमाइंडर';

  @override
  String get appliedToNewProducts => 'नए उत्पादों पर लागू होता है';

  @override
  String get theme => 'थीम';

  @override
  String get scanBarcode => 'बारकोड स्कैन करें';

  @override
  String get enterManually => 'मैन्युअल दर्ज करें';

  @override
  String get cameraUnavailable =>
      'कैमरा उपलब्ध नहीं। अनुमतियां जांचें या मैन्युअल दर्ज करें।';

  @override
  String get lookingUpProduct => 'उत्पाद खोज रहे हैं…';

  @override
  String get pointAtBarcode => 'उत्पाद बारकोड पर कैमरा ले जाएं';

  @override
  String get scanExpiryDate => 'एक्सपायरी तारीख स्कैन करें';

  @override
  String get searchProductByName => 'नाम से उत्पाद खोजें';

  @override
  String get searchProduct => 'उत्पाद खोजें';

  @override
  String get searchHintExample => 'जैसे मैगी केचप';

  @override
  String get typeProductNameHint => 'उत्पाद का नाम टाइप करें और खोजें।';

  @override
  String get scanExpiryInstruction =>
      'प्रिंटेड एक्सपायरी, \"बेस्ट बिफोर\", या MFG तारीख पर कैमरा ले जाएं।';

  @override
  String get captureDateLabel => 'तारीख लेबल कैप्चर करें';

  @override
  String get reScan => 'फिर से स्कैन';

  @override
  String get pickDateManually => 'तारीख मैन्युअल चुनें';

  @override
  String get detectedDates => 'पहचानी गई तारीखें';

  @override
  String get detectedDatesPlaceholder => 'पहचानी गई तारीखें यहां दिखेंगी।';

  @override
  String get noDateDetected => 'कोई तारीख नहीं मिली। नीचे मैन्युअल चुनें।';

  @override
  String get couldNotCaptureImage => 'इमेज कैप्चर नहीं हो सकी।';

  @override
  String get scanNutritionLabel => 'पोषण लेबल स्कैन करें';

  @override
  String get nutritionInstruction =>
      'पैकेज पर पोषण तथ्य तालिका पर कैमरा ले जाएं।';

  @override
  String get captureNutritionLabel => 'पोषण लेबल कैप्चर करें';

  @override
  String get useTheseValues => 'ये मान उपयोग करें';

  @override
  String get detectedNutritionPlaceholder => 'पहचाने गए पोषण मान यहां दिखेंगे।';

  @override
  String get detectedValuesPer100g => 'पहचाने गए मान (प्रति 100g)';

  @override
  String get calories => 'कैलोरी';

  @override
  String get protein => 'प्रोटीन';

  @override
  String get fat => 'वसा';

  @override
  String get carbs => 'कार्ब्स';

  @override
  String get fiber => 'फाइबर';

  @override
  String get sugar => 'शक्कर';

  @override
  String get couldNotDetectNutrition =>
      'पोषण जानकारी नहीं मिली। लेबल पर स्पष्ट फोकस से पुनः प्रयास करें।';

  @override
  String get recipeIdeas => 'रेसिपी सुझाव';

  @override
  String get thinkingOfRecipes => 'रेसिपी सोच रहे हैं...';

  @override
  String get couldNotGenerateRecipes =>
      'अभी सुझाव नहीं बन सके। बाद में पुनः प्रयास करें।';

  @override
  String usingProducts(String products) {
    return 'उपयोग: $products';
  }

  @override
  String get ingredients => 'सामग्री';

  @override
  String get steps => 'चरण';

  @override
  String get confirmDetails => 'विवरण पुष्टि करें';

  @override
  String get productName => 'उत्पाद का नाम';

  @override
  String get productNameHint => 'जैसे अमूल मक्खन';

  @override
  String get brandOptional => 'ब्रांड (वैकल्पिक)';

  @override
  String get brandHint => 'जैसे अमूल';

  @override
  String get category => 'श्रेणी';

  @override
  String get storage => 'स्टोरेज';

  @override
  String get quantity => 'मात्रा';

  @override
  String nutritionPer(String per) {
    return 'पोषण (प्रति $per)';
  }

  @override
  String get expiryDate => 'एक्सपायरी तारीख';

  @override
  String get remindMe => 'मुझे याद दिलाएं';

  @override
  String get saveProduct => 'उत्पाद सहेजें';

  @override
  String get pleaseEnterProductName => 'कृपया उत्पाद का नाम दर्ज करें';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name की मात्रा $qty हो गई।';
  }

  @override
  String productSaved(String name) {
    return '$name सहेजा गया। रिमाइंडर सेट।';
  }

  @override
  String get notSignedIn => 'आप साइन इन नहीं हैं।';

  @override
  String get productDetails => 'उत्पाद विवरण';

  @override
  String get editProduct => 'उत्पाद संपादित करें';

  @override
  String get saveChanges => 'बदलाव सहेजें';

  @override
  String get required => 'आवश्यक';

  @override
  String get deleteProductTitle => 'उत्पाद हटाएं?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" और उसके रिमाइंडर स्थायी रूप से हटा दिए जाएंगे।';
  }

  @override
  String get productUpdated => 'उत्पाद अपडेट किया गया';

  @override
  String get couldNotUpdateProduct => 'उत्पाद अपडेट नहीं हो सका';

  @override
  String get remindersUpdated => 'रिमाइंडर अपडेट किए गए';

  @override
  String get couldNotUpdateReminders => 'रिमाइंडर अपडेट नहीं हो सके';

  @override
  String get note => 'नोट';

  @override
  String get noteHint => 'जैसे खोला गया, दरवाज़े की शेल्फ में रखें…';

  @override
  String get noteSaved => 'नोट सहेजा गया';

  @override
  String get couldNotSaveNote => 'नोट सहेजा नहीं जा सका';

  @override
  String get noNoteYet => 'अभी कोई नोट नहीं।';

  @override
  String get markedAsConsumed => 'उपयोग किया गया चिह्नित';

  @override
  String get movedBackToInventory => 'इन्वेंटरी में वापस ले जाया गया';

  @override
  String get couldNotUpdateStatus => 'स्थिति अपडेट नहीं हो सकी';

  @override
  String get markAsConsumed => 'उपयोग किया गया चिह्नित करें';

  @override
  String get moveBackToInventory => 'इन्वेंटरी में वापस लाएं';

  @override
  String get nutrition => 'पोषण';

  @override
  String get scanLabel => 'लेबल स्कैन';

  @override
  String get update => 'अपडेट';

  @override
  String get noNutritionDataYet => 'अभी कोई पोषण डेटा नहीं।';

  @override
  String get nutritionInfoUpdated => 'पोषण जानकारी अपडेट हुई';

  @override
  String get couldNotSaveNutritionData => 'पोषण डेटा सहेजा नहीं जा सका';

  @override
  String get couldNotDetectNutritionShort =>
      'पोषण जानकारी नहीं मिली। स्पष्ट फोकस से प्रयास करें।';

  @override
  String get productDeleted => 'उत्पाद हटाया गया';

  @override
  String get couldNotDeleteProduct => 'उत्पाद नहीं हटाया जा सका';

  @override
  String get getRecipeIdeas => 'रेसिपी सुझाव पाएं';

  @override
  String get dateSource => 'तारीख स्रोत';

  @override
  String get sourceOcr => 'स्कैन किया (OCR)';

  @override
  String get sourceApi => 'उत्पाद डेटाबेस';

  @override
  String get sourceManual => 'मैन्युअल दर्ज';

  @override
  String get manufactured => 'निर्मित';

  @override
  String get barcode => 'बारकोड';

  @override
  String get nutritionSourceApi => 'उत्पाद डेटाबेस';

  @override
  String get nutritionSourceOcr => 'स्कैन किया';

  @override
  String get nutritionSourceManual => 'मैन्युअल';

  @override
  String perSourceLabel(String per, String source) {
    return 'प्रति $per · स्रोत: $source';
  }

  @override
  String get cal => 'कैल';

  @override
  String get statusFresh => 'ताज़ा';

  @override
  String get statusExpiringSoon => 'जल्द एक्सपायर';

  @override
  String get statusExpired => 'एक्सपायर्ड';

  @override
  String get statusConsumed => 'उपयोग किया';

  @override
  String get categoryDairy => 'डेयरी';

  @override
  String get categoryBakery => 'बेकरी';

  @override
  String get categoryProduce => 'सब्ज़ियां';

  @override
  String get categoryMeat => 'मांस और मछली';

  @override
  String get categoryBeverages => 'पेय पदार्थ';

  @override
  String get categorySnacks => 'स्नैक्स';

  @override
  String get categoryFrozen => 'फ्रोज़न';

  @override
  String get categoryPantry => 'पेंट्री';

  @override
  String get categoryMedicine => 'दवाई';

  @override
  String get categoryCosmetics => 'सौंदर्य प्रसाधन';

  @override
  String get categoryBaby => 'बेबी';

  @override
  String get categoryPetFood => 'पेट फूड';

  @override
  String get categoryOther => 'अन्य';

  @override
  String get storageFridge => 'फ्रिज';

  @override
  String get storageFreezer => 'फ्रीज़र';

  @override
  String get storagePantry => 'पेंट्री';

  @override
  String get storageCabinet => 'कैबिनेट';

  @override
  String get storageOther => 'अन्य';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन पहले',
      one: '1 दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'आज एक्सपायर';

  @override
  String get expiresTomorrow => 'कल एक्सपायर';

  @override
  String daysLeft(int count) {
    return '$count दिन शेष';
  }

  @override
  String get onExpiryDay => 'एक्सपायरी के दिन';

  @override
  String get oneDayBefore => '1 दिन पहले';

  @override
  String daysBefore(int count) {
    return '$count दिन पहले';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name आज एक्सपायर हो रहा है';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name जल्द एक्सपायर होने वाला है';
  }

  @override
  String get notifBodyToday =>
      'कृपया इसे सुरक्षित रूप से उपयोग या निपटान करें।';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिनों',
      one: '1 दिन',
    );
    return '$name $_temp0 में एक्सपायर हो जाएगा। बर्बादी से बचने के लिए जल्दी उपयोग करें।';
  }

  @override
  String get expiryReminders => 'एक्सपायरी रिमाइंडर';

  @override
  String get expiryRemindersDesc =>
      'आपकी रसोई की चीज़ों की एक्सपायरी से पहले रिमाइंडर।';

  @override
  String get language => 'भाषा';
}
