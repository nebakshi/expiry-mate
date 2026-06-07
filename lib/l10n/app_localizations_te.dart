// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'ఎప్పుడూ తాజాగా ఉంచండి.';

  @override
  String get skip => 'దాటవేయి';

  @override
  String get next => 'తదుపరి';

  @override
  String get getStarted => 'ప్రారంభించండి';

  @override
  String get cancel => 'రద్దు';

  @override
  String get save => 'సేవ్';

  @override
  String get delete => 'తొలగించు';

  @override
  String get retry => 'మళ్ళీ ప్రయత్నించు';

  @override
  String get edit => 'సవరించు';

  @override
  String get add => 'జోడించు';

  @override
  String get onboardingTitle1 => 'సెకన్లలో స్కాన్';

  @override
  String get onboardingBody1 =>
      'బార్‌కోడ్ వైపు మీ కెమెరాను చూపించండి, ఉత్పత్తిని వెంటనే గుర్తిస్తాం.';

  @override
  String get onboardingTitle2 => 'ఎక్స్‌పైరీ తేదీని చదవండి';

  @override
  String get onboardingBody2 =>
      'ముద్రించిన తేదీని స్కాన్ చేయండి — మా ఇండియా-ఫస్ట్ పార్సర్ MFG + best-before కూడా నిర్వహిస్తుంది.';

  @override
  String get onboardingTitle3 => 'ఎక్స్‌పైరీ ఎప్పటికీ మిస్ అవ్వకండి';

  @override
  String get onboardingBody3 =>
      'ఎక్స్‌పైరీకి 7 రోజులు, 2 రోజులు మరియు ఆ రోజున రిమైండర్లు పొందండి.';

  @override
  String get onboardingTitle4 => 'ఆహారం వృథా చేయకండి';

  @override
  String get onboardingBody4 =>
      'మీ మొత్తం వంటగదిని ఒకే చోట ట్రాక్ చేసి, చెడిపోకముందే వాడండి.';

  @override
  String get continueWithGoogle => 'Google తో కొనసాగించండి';

  @override
  String get continueWithApple => 'Apple తో కొనసాగించండి';

  @override
  String get continueAsGuest => 'అతిథిగా కొనసాగించండి';

  @override
  String get legalText =>
      'కొనసాగించడం ద్వారా మీరు మా నిబంధనలు మరియు గోప్యతా విధానానికి అంగీకరిస్తారు.';

  @override
  String homeGreeting(String name) {
    return 'హాయ్$name 👋';
  }

  @override
  String get scan => 'స్కాన్';

  @override
  String get searchHint => 'ఉత్పత్తులు లేదా బ్రాండ్‌లను వెతకండి';

  @override
  String get tracked => 'ట్రాక్';

  @override
  String get expiring => 'ఎక్స్‌పైరీ అవుతోంది';

  @override
  String get expired => 'ఎక్స్‌పైర్డ్';

  @override
  String get filterAll => 'అన్నీ';

  @override
  String get filterFresh => 'తాజా';

  @override
  String get filterExpiringSoon => 'త్వరలో ఎక్స్‌పైరీ';

  @override
  String get filterExpired => 'ఎక్స్‌పైర్డ్';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ఐటెంలు ఎక్స్‌పైరీ అవుతున్నాయి — రెసిపీ ఆలోచనలు పొందండి',
      one: '1 ఐటెం ఎక్స్‌పైరీ అవుతోంది — రెసిపీ ఆలోచనలు పొందండి',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'మీ వంటగది ఖాళీగా ఉంది';

  @override
  String get emptyKitchenMessage =>
      'ఎక్స్‌పైరీ తేదీలను ట్రాక్ చేయడానికి మరియు సమయానికి రిమైండర్లు పొందడానికి మీ మొదటి ఉత్పత్తిని స్కాన్ చేయండి.';

  @override
  String get scanAProduct => 'ఒక ఉత్పత్తిని స్కాన్ చేయండి';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get guest => 'అతిథి';

  @override
  String get account => 'ఖాతా';

  @override
  String get appearance => 'రూపం';

  @override
  String get reminders => 'రిమైండర్లు';

  @override
  String get data => 'డేటా';

  @override
  String get about => 'గురించి';

  @override
  String get accountActions => 'ఖాతా చర్యలు';

  @override
  String get notificationPermission => 'నోటిఫికేషన్ అనుమతి';

  @override
  String get allowBloomAlerts =>
      'Bloom ఎక్స్‌పైరీ అలర్ట్‌లు పంపడానికి అనుమతించండి';

  @override
  String get exportMyData => 'నా డేటాను ఎగుమతి చేయి';

  @override
  String get exportSubtitle => 'మీ ఇన్వెంటరీని JSON గా కాపీ చేయండి';

  @override
  String get privacyPolicy => 'గోప్యతా విధానం';

  @override
  String get termsAndConditions => 'నిబంధనలు & షరతులు';

  @override
  String get version => 'వెర్షన్';

  @override
  String get signOut => 'సైన్ అవుట్';

  @override
  String get deleteAccount => 'ఖాతాను తొలగించు';

  @override
  String get permanentlyRemovesData => 'మీ డేటాను శాశ్వతంగా తొలగిస్తుంది';

  @override
  String get signOutConfirmTitle => 'సైన్ అవుట్ చేయాలా?';

  @override
  String get signOutConfirmMessage => 'మీరు ఎప్పుడైనా మళ్ళీ సైన్ ఇన్ చేయవచ్చు.';

  @override
  String get deleteAccountConfirmTitle => 'ఖాతాను తొలగించాలా?';

  @override
  String get deleteAccountConfirmMessage =>
      'ఇది మీ ఖాతాను మరియు సేవ్ చేసిన అన్ని ఉత్పత్తులను శాశ్వతంగా తొలగిస్తుంది. దీన్ని రద్దు చేయలేరు.';

  @override
  String get freePlan => 'ఉచిత ప్లాన్';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit లో $total ఐటెంలు వాడారు';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining మిగిలి ఉంది';
  }

  @override
  String get limitReached => 'పరిమితి చేరుకుంది';

  @override
  String get notificationsEnabled => 'నోటిఫికేషన్లు ప్రారంభించబడ్డాయి';

  @override
  String get notificationsOff =>
      'నోటిఫికేషన్లు ఆఫ్ చేయబడ్డాయి. మీ పరికర సెట్టింగ్‌లలో ప్రారంభించండి.';

  @override
  String exportedItems(int count) {
    return '$count ఐటెంలు క్లిప్‌బోర్డ్‌కు ఎగుమతి చేయబడ్డాయి';
  }

  @override
  String get couldNotOpenLink => 'లింక్ తెరవలేకపోయింది';

  @override
  String get accountDeleted => 'ఖాతా తొలగించబడింది';

  @override
  String get reSignInToDelete =>
      'దయచేసి మళ్ళీ సైన్ ఇన్ చేసి, ఖాతా తొలగింపును ప్రయత్నించండి.';

  @override
  String get couldNotDeleteAccount => 'ఖాతాను తొలగించలేకపోయింది';

  @override
  String get signedInWithGoogle => 'Google తో సైన్ ఇన్';

  @override
  String get signedInWithApple => 'Apple తో సైన్ ఇన్';

  @override
  String get guestAccount => 'అతిథి ఖాతా';

  @override
  String get signedIn => 'సైన్ ఇన్';

  @override
  String get defaultReminders => 'డిఫాల్ట్ రిమైండర్లు';

  @override
  String get appliedToNewProducts =>
      'మీరు జోడించే కొత్త ఉత్పత్తులకు వర్తిస్తుంది';

  @override
  String get theme => 'థీమ్';

  @override
  String get scanBarcode => 'బార్‌కోడ్ స్కాన్ చేయండి';

  @override
  String get enterManually => 'మాన్యువల్‌గా నమోదు';

  @override
  String get cameraUnavailable =>
      'కెమెరా అందుబాటులో లేదు. అనుమతులు తనిఖీ చేయండి లేదా మాన్యువల్‌గా నమోదు చేయండి.';

  @override
  String get lookingUpProduct => 'ఉత్పత్తిని వెతుకుతోంది…';

  @override
  String get pointAtBarcode => 'ఉత్పత్తి బార్‌కోడ్ వైపు చూపించండి';

  @override
  String get scanExpiryDate => 'ఎక్స్‌పైరీ తేదీని స్కాన్ చేయండి';

  @override
  String get searchProductByName => 'పేరుతో ఉత్పత్తిని వెతకండి';

  @override
  String get searchProduct => 'ఉత్పత్తిని వెతకండి';

  @override
  String get searchHintExample => 'ఉదా. మేగీ కెచప్';

  @override
  String get typeProductNameHint => 'ఉత్పత్తి పేరు టైప్ చేసి వెతకండి.';

  @override
  String get scanExpiryInstruction =>
      'ముద్రించిన ఎక్స్‌పైరీ, \"best before\", లేదా MFG తేదీ వైపు కెమెరాను చూపించండి.';

  @override
  String get captureDateLabel => 'తేదీ లేబుల్ కాప్చర్ చేయండి';

  @override
  String get reScan => 'మళ్ళీ స్కాన్';

  @override
  String get pickDateManually => 'తేదీని మాన్యువల్‌గా ఎంచుకోండి';

  @override
  String get detectedDates => 'కనుగొనబడిన తేదీలు';

  @override
  String get detectedDatesPlaceholder => 'కనుగొనబడిన తేదీలు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get noDateDetected =>
      'తేదీ కనుగొనబడలేదు. క్రింద మాన్యువల్‌గా ఎంచుకోండి.';

  @override
  String get couldNotCaptureImage => 'చిత్రాన్ని కాప్చర్ చేయలేకపోయింది.';

  @override
  String get scanNutritionLabel => 'పోషణ లేబుల్ స్కాన్ చేయండి';

  @override
  String get nutritionInstruction =>
      'ప్యాకేజీపై పోషణ వాస్తవాల పట్టిక వైపు కెమెరాను చూపించండి.';

  @override
  String get captureNutritionLabel => 'పోషణ లేబుల్ కాప్చర్ చేయండి';

  @override
  String get useTheseValues => 'ఈ విలువలను ఉపయోగించు';

  @override
  String get detectedNutritionPlaceholder =>
      'కనుగొనబడిన పోషణ విలువలు ఇక్కడ కనిపిస్తాయి.';

  @override
  String get detectedValuesPer100g => 'కనుగొనబడిన విలువలు (100g కి)';

  @override
  String get calories => 'కేలరీలు';

  @override
  String get protein => 'ప్రొటీన్';

  @override
  String get fat => 'కొవ్వు';

  @override
  String get carbs => 'కార్బ్స్';

  @override
  String get fiber => 'ఫైబర్';

  @override
  String get sugar => 'చక్కెర';

  @override
  String get couldNotDetectNutrition =>
      'పోషణ సమాచారం కనుగొనలేకపోయింది. లేబుల్‌పై స్పష్టమైన ఫోకస్‌తో మళ్ళీ ప్రయత్నించండి.';

  @override
  String get recipeIdeas => 'రెసిపీ ఆలోచనలు';

  @override
  String get thinkingOfRecipes => 'రెసిపీలను ఆలోచిస్తోంది...';

  @override
  String get couldNotGenerateRecipes =>
      'ఇప్పుడు సూచనలు రూపొందించలేకపోయింది. తర్వాత మళ్ళీ ప్రయత్నించండి.';

  @override
  String usingProducts(String products) {
    return 'ఉపయోగిస్తోంది: $products';
  }

  @override
  String get ingredients => 'పదార్థాలు';

  @override
  String get steps => 'దశలు';

  @override
  String get confirmDetails => 'వివరాలు నిర్ధారించండి';

  @override
  String get productName => 'ఉత్పత్తి పేరు';

  @override
  String get productNameHint => 'ఉదా. అమూల్ బటర్';

  @override
  String get brandOptional => 'బ్రాండ్ (ఐచ్ఛికం)';

  @override
  String get brandHint => 'ఉదా. అమూల్';

  @override
  String get category => 'వర్గం';

  @override
  String get storage => 'నిల్వ';

  @override
  String get quantity => 'పరిమాణం';

  @override
  String nutritionPer(String per) {
    return 'పోషణ ($per కి)';
  }

  @override
  String get expiryDate => 'ఎక్స్‌పైరీ తేదీ';

  @override
  String get remindMe => 'నాకు గుర్తు చేయి';

  @override
  String get saveProduct => 'ఉత్పత్తిని సేవ్ చేయి';

  @override
  String get pleaseEnterProductName => 'దయచేసి ఉత్పత్తి పేరు నమోదు చేయండి';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name పరిమాణం $qty కి నవీకరించబడింది.';
  }

  @override
  String productSaved(String name) {
    return '$name సేవ్ చేయబడింది. రిమైండర్లు సెట్ చేయబడ్డాయి.';
  }

  @override
  String get notSignedIn => 'మీరు సైన్ ఇన్ కాలేదు.';

  @override
  String get productDetails => 'ఉత్పత్తి వివరాలు';

  @override
  String get editProduct => 'ఉత్పత్తిని సవరించు';

  @override
  String get saveChanges => 'మార్పులను సేవ్ చేయి';

  @override
  String get required => 'అవసరం';

  @override
  String get deleteProductTitle => 'ఉత్పత్తిని తొలగించాలా?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" మరియు దాని రిమైండర్లు శాశ్వతంగా తొలగించబడతాయి.';
  }

  @override
  String get productUpdated => 'ఉత్పత్తి నవీకరించబడింది';

  @override
  String get couldNotUpdateProduct => 'ఉత్పత్తిని నవీకరించలేకపోయింది';

  @override
  String get remindersUpdated => 'రిమైండర్లు నవీకరించబడ్డాయి';

  @override
  String get couldNotUpdateReminders => 'రిమైండర్లను నవీకరించలేకపోయింది';

  @override
  String get note => 'గమనిక';

  @override
  String get noteHint => 'ఉదా. తెరిచారు, తలుపు షెల్ఫ్‌లో ఉంచండి…';

  @override
  String get noteSaved => 'గమనిక సేవ్ చేయబడింది';

  @override
  String get couldNotSaveNote => 'గమనికను సేవ్ చేయలేకపోయింది';

  @override
  String get noNoteYet => 'ఇంకా గమనిక లేదు.';

  @override
  String get markedAsConsumed => 'వాడినట్లు గుర్తించబడింది';

  @override
  String get movedBackToInventory => 'ఇన్వెంటరీకి తిరిగి తరలించబడింది';

  @override
  String get couldNotUpdateStatus => 'స్థితిని నవీకరించలేకపోయింది';

  @override
  String get markAsConsumed => 'వాడినట్లు గుర్తించు';

  @override
  String get moveBackToInventory => 'ఇన్వెంటరీకి తిరిగి తరలించు';

  @override
  String get nutrition => 'పోషణ';

  @override
  String get scanLabel => 'లేబుల్ స్కాన్';

  @override
  String get update => 'నవీకరించు';

  @override
  String get noNutritionDataYet => 'ఇంకా పోషణ డేటా లేదు.';

  @override
  String get nutritionInfoUpdated => 'పోషణ సమాచారం నవీకరించబడింది';

  @override
  String get couldNotSaveNutritionData => 'పోషణ డేటాను సేవ్ చేయలేకపోయింది';

  @override
  String get couldNotDetectNutritionShort =>
      'పోషణ సమాచారం కనుగొనలేకపోయింది. స్పష్టంగా ప్రయత్నించండి.';

  @override
  String get productDeleted => 'ఉత్పత్తి తొలగించబడింది';

  @override
  String get couldNotDeleteProduct => 'ఉత్పత్తిని తొలగించలేకపోయింది';

  @override
  String get getRecipeIdeas => 'రెసిపీ ఆలోచనలు పొందండి';

  @override
  String get dateSource => 'తేదీ మూలం';

  @override
  String get sourceOcr => 'స్కాన్ చేయబడింది (OCR)';

  @override
  String get sourceApi => 'ఉత్పత్తి డేటాబేస్';

  @override
  String get sourceManual => 'మాన్యువల్‌గా నమోదు';

  @override
  String get manufactured => 'తయారు చేయబడింది';

  @override
  String get barcode => 'బార్‌కోడ్';

  @override
  String get nutritionSourceApi => 'ఉత్పత్తి డేటాబేస్';

  @override
  String get nutritionSourceOcr => 'స్కాన్ చేయబడింది';

  @override
  String get nutritionSourceManual => 'మాన్యువల్';

  @override
  String perSourceLabel(String per, String source) {
    return '$per కి · మూలం: $source';
  }

  @override
  String get cal => 'కేలో';

  @override
  String get statusFresh => 'తాజా';

  @override
  String get statusExpiringSoon => 'త్వరలో ఎక్స్‌పైరీ';

  @override
  String get statusExpired => 'ఎక్స్‌పైర్డ్';

  @override
  String get statusConsumed => 'వాడారు';

  @override
  String get categoryDairy => 'పాల ఉత్పత్తులు';

  @override
  String get categoryBakery => 'బేకరీ';

  @override
  String get categoryProduce => 'కూరగాయలు';

  @override
  String get categoryMeat => 'మాంసం & చేపలు';

  @override
  String get categoryBeverages => 'పానీయాలు';

  @override
  String get categorySnacks => 'స్నాక్స్';

  @override
  String get categoryFrozen => 'ఫ్రోజెన్';

  @override
  String get categoryPantry => 'ప్యాంట్రీ';

  @override
  String get categoryMedicine => 'మందులు';

  @override
  String get categoryCosmetics => 'సౌందర్య ఉత్పత్తులు';

  @override
  String get categoryBaby => 'బేబీ';

  @override
  String get categoryPetFood => 'పెట్ ఫుడ్';

  @override
  String get categoryOther => 'ఇతరం';

  @override
  String get storageFridge => 'ఫ్రిజ్';

  @override
  String get storageFreezer => 'ఫ్రీజర్';

  @override
  String get storagePantry => 'ప్యాంట్రీ';

  @override
  String get storageCabinet => 'కేబినెట్';

  @override
  String get storageOther => 'ఇతరం';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count రోజుల క్రితం',
      one: '1 రోజు క్రితం',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'ఈరోజు ఎక్స్‌పైరీ';

  @override
  String get expiresTomorrow => 'రేపు ఎక్స్‌పైరీ';

  @override
  String daysLeft(int count) {
    return '$count రోజులు మిగిలి ఉన్నాయి';
  }

  @override
  String get onExpiryDay => 'ఎక్స్‌పైరీ రోజున';

  @override
  String get oneDayBefore => '1 రోజు ముందు';

  @override
  String daysBefore(int count) {
    return '$count రోజుల ముందు';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name ఈరోజు ఎక్స్‌పైరీ అవుతోంది';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name త్వరలో ఎక్స్‌పైరీ అవుతోంది';
  }

  @override
  String get notifBodyToday => 'దయచేసి సురక్షితంగా ఉపయోగించండి లేదా పారేయండి.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count రోజుల్లో',
      one: '1 రోజులో',
    );
    return '$name $_temp0 ఎక్స్‌పైరీ అవుతోంది. వృథా తగ్గించడానికి త్వరగా వాడండి.';
  }

  @override
  String get expiryReminders => 'ఎక్స్‌పైరీ రిమైండర్లు';

  @override
  String get expiryRemindersDesc =>
      'మీ వంటగది వస్తువులు ఎక్స్‌పైరీ అవ్వడానికి ముందు రిమైండర్లు.';

  @override
  String get language => 'భాష';
}
