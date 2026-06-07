// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'હંમેશા તાજું રાખો.';

  @override
  String get skip => 'છોડો';

  @override
  String get next => 'આગળ';

  @override
  String get getStarted => 'શરૂ કરો';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get save => 'સાચવો';

  @override
  String get delete => 'કાઢી નાખો';

  @override
  String get retry => 'ફરી પ્રયાસ કરો';

  @override
  String get edit => 'સંપાદિત કરો';

  @override
  String get add => 'ઉમેરો';

  @override
  String get onboardingTitle1 => 'સેકંડમાં સ્કેન કરો';

  @override
  String get onboardingBody1 =>
      'બારકોડ પર કેમેરા રાખો અને અમે ઉત્પાદનને તરત ઓળખી લઈશું.';

  @override
  String get onboardingTitle2 => 'એક્સપાયરી તારીખ વાંચો';

  @override
  String get onboardingBody2 =>
      'છાપેલી તારીખ સ્કેન કરો — અમારો ભારત-કેન્દ્રિત પાર્સર MFG + best-before પણ સંભાળે છે.';

  @override
  String get onboardingTitle3 => 'એક્સપાયરી ક્યારેય ચૂકશો નહીં';

  @override
  String get onboardingBody3 =>
      'એક્સપાયરી પહેલાં ૭ દિવસ, ૨ દિવસ અને તે દિવસે રિમાઇન્ડર મેળવો.';

  @override
  String get onboardingTitle4 => 'ખોરાક બગાડશો નહીં';

  @override
  String get onboardingBody4 =>
      'તમારી આખી રસોડું એક જ જગ્યાએ ટ્રેક કરો અને બગડે તે પહેલાં વાપરો.';

  @override
  String get continueWithGoogle => 'Google સાથે ચાલુ રાખો';

  @override
  String get continueWithApple => 'Apple સાથે ચાલુ રાખો';

  @override
  String get continueAsGuest => 'મહેમાન તરીકે ચાલુ રાખો';

  @override
  String get legalText =>
      'ચાલુ રાખીને તમે અમારી શરતો અને ગોપનીયતા નીતિ સ્વીકારો છો.';

  @override
  String homeGreeting(String name) {
    return 'નમસ્તે$name 👋';
  }

  @override
  String get scan => 'સ્કેન';

  @override
  String get searchHint => 'ઉત્પાદનો અથવા બ્રાન્ડ શોધો';

  @override
  String get tracked => 'ટ્રેક કરેલ';

  @override
  String get expiring => 'ટૂંક સમયમાં એક્સપાયર';

  @override
  String get expired => 'એક્સપાયર્ડ';

  @override
  String get filterAll => 'બધા';

  @override
  String get filterFresh => 'તાજા';

  @override
  String get filterExpiringSoon => 'ટૂંક સમયમાં એક્સપાયર';

  @override
  String get filterExpired => 'એક્સપાયર્ડ';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count આઇટમ એક્સપાયર થઈ રહી છે — રેસિપી સૂચનો મેળવો',
      one: '૧ આઇટમ એક્સપાયર થઈ રહી છે — રેસિપી સૂચનો મેળવો',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'તમારી રસોડું ખાલી છે';

  @override
  String get emptyKitchenMessage =>
      'એક્સપાયરી તારીખો ટ્રેક કરવા અને સમયસર રિમાઇન્ડર મેળવવા તમારું પ્રથમ ઉત્પાદન સ્કેન કરો.';

  @override
  String get scanAProduct => 'એક ઉત્પાદન સ્કેન કરો';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get guest => 'મહેમાન';

  @override
  String get account => 'ખાતું';

  @override
  String get appearance => 'દેખાવ';

  @override
  String get reminders => 'રિમાઇન્ડર';

  @override
  String get data => 'ડેટા';

  @override
  String get about => 'વિશે';

  @override
  String get accountActions => 'ખાતું ક્રિયાઓ';

  @override
  String get notificationPermission => 'સૂચના પરવાનગી';

  @override
  String get allowBloomAlerts => 'Bloom ને એક્સપાયરી ચેતવણી મોકલવા દો';

  @override
  String get exportMyData => 'મારો ડેટા એક્સપોર્ટ કરો';

  @override
  String get exportSubtitle => 'તમારી ઇન્વેન્ટરી JSON તરીકે કોપી કરો';

  @override
  String get privacyPolicy => 'ગોપનીયતા નીતિ';

  @override
  String get termsAndConditions => 'શરતો અને નિયમો';

  @override
  String get version => 'સંસ્કરણ';

  @override
  String get signOut => 'સાઇન આઉટ';

  @override
  String get deleteAccount => 'ખાતું કાઢી નાખો';

  @override
  String get permanentlyRemovesData => 'તમારો ડેટા કાયમ માટે દૂર કરે છે';

  @override
  String get signOutConfirmTitle => 'સાઇન આઉટ કરવું છે?';

  @override
  String get signOutConfirmMessage => 'તમે ગમે ત્યારે ફરી સાઇન ઇન કરી શકો છો.';

  @override
  String get deleteAccountConfirmTitle => 'ખાતું કાઢી નાખવું છે?';

  @override
  String get deleteAccountConfirmMessage =>
      'આ તમારું ખાતું અને બધા સાચવેલા ઉત્પાદનો કાયમ માટે કાઢી નાખશે. આ પૂર્વવત કરી શકાતું નથી.';

  @override
  String get freePlan => 'ફ્રી પ્લાન';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit માંથી $total આઇટમ વપરાયા';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining બાકી';
  }

  @override
  String get limitReached => 'મર્યાદા પહોંચી';

  @override
  String get notificationsEnabled => 'સૂચનાઓ સક્રિય';

  @override
  String get notificationsOff =>
      'સૂચનાઓ બંધ છે. તમારી ડિવાઇસ સેટિંગ્સમાં સક્રિય કરો.';

  @override
  String exportedItems(int count) {
    return '$count આઇટમ ક્લિપબોર્ડ પર એક્સપોર્ટ થયા';
  }

  @override
  String get couldNotOpenLink => 'લિંક ખોલી શકાઈ નહીં';

  @override
  String get accountDeleted => 'ખાતું કાઢી નાખ્યું';

  @override
  String get reSignInToDelete =>
      'કૃપા કરીને ફરી સાઇન ઇન કરો, પછી ખાતું કાઢી નાખવાનો પ્રયાસ કરો.';

  @override
  String get couldNotDeleteAccount => 'ખાતું કાઢી શકાયું નહીં';

  @override
  String get signedInWithGoogle => 'Google સાથે સાઇન ઇન';

  @override
  String get signedInWithApple => 'Apple સાથે સાઇન ઇન';

  @override
  String get guestAccount => 'મહેમાન ખાતું';

  @override
  String get signedIn => 'સાઇન ઇન';

  @override
  String get defaultReminders => 'ડિફોલ્ટ રિમાઇન્ડર';

  @override
  String get appliedToNewProducts => 'નવા ઉત્પાદનોમાં લાગુ';

  @override
  String get theme => 'થીમ';

  @override
  String get scanBarcode => 'બારકોડ સ્કેન કરો';

  @override
  String get enterManually => 'જાતે દાખલ કરો';

  @override
  String get cameraUnavailable =>
      'કેમેરા ઉપલબ્ધ નથી. પરવાનગીઓ ચકાસો અથવા જાતે દાખલ કરો.';

  @override
  String get lookingUpProduct => 'ઉત્પાદન શોધી રહ્યું છે…';

  @override
  String get pointAtBarcode => 'ઉત્પાદન બારકોડ પર કેમેરા રાખો';

  @override
  String get scanExpiryDate => 'એક્સપાયરી તારીખ સ્કેન કરો';

  @override
  String get searchProductByName => 'નામથી ઉત્પાદન શોધો';

  @override
  String get searchProduct => 'ઉત્પાદન શોધો';

  @override
  String get searchHintExample => 'દા.ત. મેગી કેચઅપ';

  @override
  String get typeProductNameHint => 'ઉત્પાદનનું નામ ટાઇપ કરીને શોધો.';

  @override
  String get scanExpiryInstruction =>
      'છાપેલી એક્સપાયરી, \"best before\", અથવા MFG તારીખ પર કેમેરા રાખો.';

  @override
  String get captureDateLabel => 'તારીખ લેબલ કેપ્ચર કરો';

  @override
  String get reScan => 'ફરી સ્કેન';

  @override
  String get pickDateManually => 'તારીખ જાતે પસંદ કરો';

  @override
  String get detectedDates => 'ઓળખાયેલી તારીખો';

  @override
  String get detectedDatesPlaceholder => 'ઓળખાયેલી તારીખો અહીં દેખાશે.';

  @override
  String get noDateDetected => 'તારીખ ઓળખાઈ નહીં. નીચે જાતે પસંદ કરો.';

  @override
  String get couldNotCaptureImage => 'છબી કેપ્ચર થઈ શકી નહીં.';

  @override
  String get scanNutritionLabel => 'પોષણ લેબલ સ્કેન કરો';

  @override
  String get nutritionInstruction =>
      'પેકેજ પરની પોષણ તથ્યો ટેબલ પર કેમેરા રાખો.';

  @override
  String get captureNutritionLabel => 'પોષણ લેબલ કેપ્ચર કરો';

  @override
  String get useTheseValues => 'આ મૂલ્યો વાપરો';

  @override
  String get detectedNutritionPlaceholder =>
      'ઓળખાયેલા પોષણ મૂલ્યો અહીં દેખાશે.';

  @override
  String get detectedValuesPer100g => 'ઓળખાયેલા મૂલ્યો (100g દીઠ)';

  @override
  String get calories => 'કેલરી';

  @override
  String get protein => 'પ્રોટીન';

  @override
  String get fat => 'ચરબી';

  @override
  String get carbs => 'કાર્બ્સ';

  @override
  String get fiber => 'ફાઇબર';

  @override
  String get sugar => 'ખાંડ';

  @override
  String get couldNotDetectNutrition =>
      'પોષણ માહિતી ઓળખાઈ નહીં. લેબલ પર સ્પષ્ટ ફોકસ સાથે ફરી પ્રયાસ કરો.';

  @override
  String get recipeIdeas => 'રેસિપી સૂચનો';

  @override
  String get thinkingOfRecipes => 'રેસિપી વિચારી રહ્યું છે...';

  @override
  String get couldNotGenerateRecipes =>
      'અત્યારે સૂચનો બનાવી શકાયા નહીં. પછી ફરી પ્રયાસ કરો.';

  @override
  String usingProducts(String products) {
    return 'વાપરી રહ્યું છે: $products';
  }

  @override
  String get ingredients => 'સામગ્રી';

  @override
  String get steps => 'પગલાં';

  @override
  String get confirmDetails => 'વિગતો ચકાસો';

  @override
  String get productName => 'ઉત્પાદનનું નામ';

  @override
  String get productNameHint => 'દા.ત. અમૂલ બટર';

  @override
  String get brandOptional => 'બ્રાન્ડ (વૈકલ્પિક)';

  @override
  String get brandHint => 'દા.ત. અમૂલ';

  @override
  String get category => 'શ્રેણી';

  @override
  String get storage => 'સંગ્રહ';

  @override
  String get quantity => 'જથ્થો';

  @override
  String nutritionPer(String per) {
    return 'પોષણ ($per દીઠ)';
  }

  @override
  String get expiryDate => 'એક્સપાયરી તારીખ';

  @override
  String get remindMe => 'મને યાદ કરાવો';

  @override
  String get saveProduct => 'ઉત્પાદન સાચવો';

  @override
  String get pleaseEnterProductName => 'કૃપા કરીને ઉત્પાદનનું નામ દાખલ કરો';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name જથ્થો $qty પર અપડેટ થયો.';
  }

  @override
  String productSaved(String name) {
    return '$name સાચવ્યું. રિમાઇન્ડર સેટ થયા.';
  }

  @override
  String get notSignedIn => 'તમે સાઇન ઇન નથી.';

  @override
  String get productDetails => 'ઉત્પાદન વિગતો';

  @override
  String get editProduct => 'ઉત્પાદન સંપાદિત કરો';

  @override
  String get saveChanges => 'ફેરફારો સાચવો';

  @override
  String get required => 'જરૂરી';

  @override
  String get deleteProductTitle => 'ઉત્પાદન કાઢી નાખવું છે?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" અને તેના રિમાઇન્ડર કાયમ માટે દૂર થશે.';
  }

  @override
  String get productUpdated => 'ઉત્પાદન અપડેટ થયું';

  @override
  String get couldNotUpdateProduct => 'ઉત્પાદન અપડેટ થઈ શક્યું નહીં';

  @override
  String get remindersUpdated => 'રિમાઇન્ડર અપડેટ થયા';

  @override
  String get couldNotUpdateReminders => 'રિમાઇન્ડર અપડેટ થઈ શક્યા નહીં';

  @override
  String get note => 'નોંધ';

  @override
  String get noteHint => 'દા.ત. ખોલ્યું, દરવાજાના શેલ્ફમાં રાખો…';

  @override
  String get noteSaved => 'નોંધ સાચવી';

  @override
  String get couldNotSaveNote => 'નોંધ સાચવી શકાઈ નહીં';

  @override
  String get noNoteYet => 'હજુ કોઈ નોંધ નથી.';

  @override
  String get markedAsConsumed => 'વપરાયેલ તરીકે ચિહ્નિત';

  @override
  String get movedBackToInventory => 'ઇન્વેન્ટરીમાં પાછું ખસેડ્યું';

  @override
  String get couldNotUpdateStatus => 'સ્થિતિ અપડેટ થઈ શકી નહીં';

  @override
  String get markAsConsumed => 'વપરાયેલ તરીકે ચિહ્નિત કરો';

  @override
  String get moveBackToInventory => 'ઇન્વેન્ટરીમાં પાછું ખસેડો';

  @override
  String get nutrition => 'પોષણ';

  @override
  String get scanLabel => 'લેબલ સ્કેન';

  @override
  String get update => 'અપડેટ';

  @override
  String get noNutritionDataYet => 'હજુ પોષણ ડેટા નથી.';

  @override
  String get nutritionInfoUpdated => 'પોષણ માહિતી અપડેટ થઈ';

  @override
  String get couldNotSaveNutritionData => 'પોષણ ડેટા સાચવી શકાયો નહીં';

  @override
  String get couldNotDetectNutritionShort =>
      'પોષણ માહિતી ઓળખાઈ નહીં. સ્પષ્ટ ફોકસ સાથે પ્રયાસ કરો.';

  @override
  String get productDeleted => 'ઉત્પાદન કાઢી નાખ્યું';

  @override
  String get couldNotDeleteProduct => 'ઉત્પાદન કાઢી શકાયું નહીં';

  @override
  String get getRecipeIdeas => 'રેસિપી સૂચનો મેળવો';

  @override
  String get dateSource => 'તારીખ સ્ત્રોત';

  @override
  String get sourceOcr => 'સ્કેન કરેલ (OCR)';

  @override
  String get sourceApi => 'ઉત્પાદન ડેટાબેસ';

  @override
  String get sourceManual => 'જાતે દાખલ કરેલ';

  @override
  String get manufactured => 'ઉત્પાદિત';

  @override
  String get barcode => 'બારકોડ';

  @override
  String get nutritionSourceApi => 'ઉત્પાદન ડેટાબેસ';

  @override
  String get nutritionSourceOcr => 'સ્કેન કરેલ';

  @override
  String get nutritionSourceManual => 'જાતે';

  @override
  String perSourceLabel(String per, String source) {
    return '$per દીઠ · સ્ત્રોત: $source';
  }

  @override
  String get cal => 'કેલ';

  @override
  String get statusFresh => 'તાજા';

  @override
  String get statusExpiringSoon => 'ટૂંક સમયમાં એક્સપાયર';

  @override
  String get statusExpired => 'એક્સપાયર્ડ';

  @override
  String get statusConsumed => 'વપરાયેલ';

  @override
  String get categoryDairy => 'ડેરી';

  @override
  String get categoryBakery => 'બેકરી';

  @override
  String get categoryProduce => 'શાકભાજી';

  @override
  String get categoryMeat => 'માંસ અને માછલી';

  @override
  String get categoryBeverages => 'પીણાં';

  @override
  String get categorySnacks => 'નાસ્તા';

  @override
  String get categoryFrozen => 'ફ્રોઝન';

  @override
  String get categoryPantry => 'પેન્ટ્રી';

  @override
  String get categoryMedicine => 'દવા';

  @override
  String get categoryCosmetics => 'સૌંદર્ય પ્રસાધનો';

  @override
  String get categoryBaby => 'બેબી';

  @override
  String get categoryPetFood => 'પેટ ફૂડ';

  @override
  String get categoryOther => 'અન્ય';

  @override
  String get storageFridge => 'ફ્રિજ';

  @override
  String get storageFreezer => 'ફ્રીઝર';

  @override
  String get storagePantry => 'પેન્ટ્રી';

  @override
  String get storageCabinet => 'કેબિનેટ';

  @override
  String get storageOther => 'અન્ય';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count દિવસ પહેલાં',
      one: '૧ દિવસ પહેલાં',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'આજે એક્સપાયર';

  @override
  String get expiresTomorrow => 'આવતીકાલે એક્સપાયર';

  @override
  String daysLeft(int count) {
    return '$count દિવસ બાકી';
  }

  @override
  String get onExpiryDay => 'એક્સપાયરીના દિવસે';

  @override
  String get oneDayBefore => '૧ દિવસ પહેલાં';

  @override
  String daysBefore(int count) {
    return '$count દિવસ પહેલાં';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name આજે એક્સપાયર થઈ રહ્યું છે';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name ટૂંક સમયમાં એક્સપાયર થશે';
  }

  @override
  String get notifBodyToday => 'કૃપા કરીને સુરક્ષિત રીતે વાપરો અથવા ફેંકી દો.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count દિવસમાં',
      one: '૧ દિવસમાં',
    );
    return '$name $_temp0 એક્સપાયર થશે. બગાડ ટાળવા જલ્દી વાપરો.';
  }

  @override
  String get expiryReminders => 'એક્સપાયરી રિમાઇન્ડર';

  @override
  String get expiryRemindersDesc =>
      'તમારી રસોડાની વસ્તુઓ એક્સપાયર થાય તે પહેલાં રિમાઇન્ડર.';

  @override
  String get language => 'ભાષા';
}
