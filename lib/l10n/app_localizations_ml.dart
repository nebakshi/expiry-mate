// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'എപ്പോഴും പുതുമയായി സൂക്ഷിക്കുക.';

  @override
  String get skip => 'ഒഴിവാക്കുക';

  @override
  String get next => 'അടുത്തത്';

  @override
  String get getStarted => 'ആരംഭിക്കുക';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get save => 'സേവ് ചെയ്യുക';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get edit => 'എഡിറ്റ് ചെയ്യുക';

  @override
  String get add => 'ചേർക്കുക';

  @override
  String get onboardingTitle1 => 'സെക്കൻഡുകളിൽ സ്കാൻ ചെയ്യുക';

  @override
  String get onboardingBody1 =>
      'ബാർകോഡിലേക്ക് ക്യാമറ ചൂണ്ടുക, ഉൽപ്പന്നം ഉടൻ തിരിച്ചറിയും.';

  @override
  String get onboardingTitle2 => 'കാലാവധി തീയതി വായിക്കുക';

  @override
  String get onboardingBody2 =>
      'അച്ചടിച്ച തീയതി സ്കാൻ ചെയ്യുക — ഞങ്ങളുടെ ഇന്ത്യ-ഫസ്റ്റ് പാഴ്സർ MFG + best-before കൂടി കൈകാര്യം ചെയ്യുന്നു.';

  @override
  String get onboardingTitle3 => 'കാലാവധി ഒരിക്കലും നഷ്ടപ്പെടുത്തരുത്';

  @override
  String get onboardingBody3 =>
      'കാലാവധിക്ക് 7 ദിവസം, 2 ദിവസം മുമ്പും അന്നേ ദിവസവും ഓർമ്മപ്പെടുത്തലുകൾ ലഭിക്കും.';

  @override
  String get onboardingTitle4 => 'ഭക്ഷണം പാഴാക്കരുത്';

  @override
  String get onboardingBody4 =>
      'നിങ്ങളുടെ മുഴുവൻ അടുക്കളയും ഒരിടത്ത് ട്രാക്ക് ചെയ്ത് കേടാകുന്നതിന് മുമ്പ് ഉപയോഗിക്കുക.';

  @override
  String get continueWithGoogle => 'Google ഉപയോഗിച്ച് തുടരുക';

  @override
  String get continueWithApple => 'Apple ഉപയോഗിച്ച് തുടരുക';

  @override
  String get continueAsGuest => 'അതിഥിയായി തുടരുക';

  @override
  String get legalText =>
      'തുടരുന്നതിലൂടെ നിങ്ങൾ ഞങ്ങളുടെ നിബന്ധനകളും സ്വകാര്യതാ നയവും അംഗീകരിക്കുന്നു.';

  @override
  String homeGreeting(String name) {
    return 'ഹായ്$name 👋';
  }

  @override
  String get scan => 'സ്കാൻ';

  @override
  String get searchHint => 'ഉൽപ്പന്നങ്ങൾ അല്ലെങ്കിൽ ബ്രാൻഡുകൾ തിരയുക';

  @override
  String get tracked => 'ട്രാക്ക്';

  @override
  String get expiring => 'ഉടൻ കാലാവധി';

  @override
  String get expired => 'കാലാവധി കഴിഞ്ഞു';

  @override
  String get filterAll => 'എല്ലാം';

  @override
  String get filterFresh => 'പുതിയത്';

  @override
  String get filterExpiringSoon => 'ഉടൻ കാലാവധി';

  @override
  String get filterExpired => 'കാലാവധി കഴിഞ്ഞു';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ഇനങ്ങളുടെ കാലാവധി തീരുന്നു — റെസിപ്പി ആശയങ്ങൾ നേടുക',
      one: '1 ഇനത്തിന്റെ കാലാവധി തീരുന്നു — റെസിപ്പി ആശയങ്ങൾ നേടുക',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'നിങ്ങളുടെ അടുക്കള ശൂന്യമാണ്';

  @override
  String get emptyKitchenMessage =>
      'കാലാവധി തീയതികൾ ട്രാക്ക് ചെയ്യാനും സമയബന്ധിത ഓർമ്മപ്പെടുത്തലുകൾ ലഭിക്കാനും നിങ്ങളുടെ ആദ്യ ഉൽപ്പന്നം സ്കാൻ ചെയ്യുക.';

  @override
  String get scanAProduct => 'ഒരു ഉൽപ്പന്നം സ്കാൻ ചെയ്യുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get guest => 'അതിഥി';

  @override
  String get account => 'അക്കൗണ്ട്';

  @override
  String get appearance => 'രൂപം';

  @override
  String get reminders => 'ഓർമ്മപ്പെടുത്തലുകൾ';

  @override
  String get data => 'ഡാറ്റ';

  @override
  String get about => 'കുറിച്ച്';

  @override
  String get accountActions => 'അക്കൗണ്ട് പ്രവർത്തനങ്ങൾ';

  @override
  String get notificationPermission => 'അറിയിപ്പ് അനുമതി';

  @override
  String get allowBloomAlerts =>
      'Bloom-ന് കാലാവധി മുന്നറിയിപ്പുകൾ അയയ്ക്കാൻ അനുവദിക്കുക';

  @override
  String get exportMyData => 'എന്റെ ഡാറ്റ എക്സ്പോർട്ട് ചെയ്യുക';

  @override
  String get exportSubtitle => 'നിങ്ങളുടെ ഇൻവെന്ററി JSON ആയി കോപ്പി ചെയ്യുക';

  @override
  String get privacyPolicy => 'സ്വകാര്യതാ നയം';

  @override
  String get termsAndConditions => 'നിബന്ധനകളും വ്യവസ്ഥകളും';

  @override
  String get version => 'പതിപ്പ്';

  @override
  String get signOut => 'സൈൻ ഔട്ട്';

  @override
  String get deleteAccount => 'അക്കൗണ്ട് ഇല്ലാതാക്കുക';

  @override
  String get permanentlyRemovesData =>
      'നിങ്ങളുടെ ഡാറ്റ ശാശ്വതമായി നീക്കം ചെയ്യുന്നു';

  @override
  String get signOutConfirmTitle => 'സൈൻ ഔട്ട് ചെയ്യണോ?';

  @override
  String get signOutConfirmMessage =>
      'നിങ്ങൾക്ക് എപ്പോൾ വേണമെങ്കിലും വീണ്ടും സൈൻ ഇൻ ചെയ്യാം.';

  @override
  String get deleteAccountConfirmTitle => 'അക്കൗണ്ട് ഇല്ലാതാക്കണോ?';

  @override
  String get deleteAccountConfirmMessage =>
      'ഇത് നിങ്ങളുടെ അക്കൗണ്ടും സേവ് ചെയ്ത എല്ലാ ഉൽപ്പന്നങ്ങളും ശാശ്വതമായി ഇല്ലാതാക്കും. ഇത് പഴയപടി ആക്കാൻ കഴിയില്ല.';

  @override
  String get freePlan => 'ഫ്രീ പ്ലാൻ';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit-ൽ $total ഇനങ്ങൾ ഉപയോഗിച്ചു';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remaining ബാക്കി';
  }

  @override
  String get limitReached => 'പരിധി എത്തി';

  @override
  String get notificationsEnabled => 'അറിയിപ്പുകൾ സജീവമാക്കി';

  @override
  String get notificationsOff =>
      'അറിയിപ്പുകൾ ഓഫ് ആണ്. ഉപകരണ ക്രമീകരണങ്ങളിൽ സജീവമാക്കുക.';

  @override
  String exportedItems(int count) {
    return '$count ഇനങ്ങൾ ക്ലിപ്ബോർഡിലേക്ക് എക്സ്പോർട്ട് ചെയ്തു';
  }

  @override
  String get couldNotOpenLink => 'ലിങ്ക് തുറക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get accountDeleted => 'അക്കൗണ്ട് ഇല്ലാതാക്കി';

  @override
  String get reSignInToDelete =>
      'ദയവായി വീണ്ടും സൈൻ ഇൻ ചെയ്യുക, അതിനുശേഷം അക്കൗണ്ട് ഇല്ലാതാക്കൽ ശ്രമിക്കുക.';

  @override
  String get couldNotDeleteAccount => 'അക്കൗണ്ട് ഇല്ലാതാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get signedInWithGoogle => 'Google ഉപയോഗിച്ച് സൈൻ ഇൻ';

  @override
  String get signedInWithApple => 'Apple ഉപയോഗിച്ച് സൈൻ ഇൻ';

  @override
  String get guestAccount => 'അതിഥി അക്കൗണ്ട്';

  @override
  String get signedIn => 'സൈൻ ഇൻ';

  @override
  String get defaultReminders => 'ഡിഫോൾട്ട് ഓർമ്മപ്പെടുത്തലുകൾ';

  @override
  String get appliedToNewProducts =>
      'നിങ്ങൾ ചേർക്കുന്ന പുതിയ ഉൽപ്പന്നങ്ങൾക്ക് ബാധകം';

  @override
  String get theme => 'തീം';

  @override
  String get scanBarcode => 'ബാർകോഡ് സ്കാൻ ചെയ്യുക';

  @override
  String get enterManually => 'സ്വമേധയാ നൽകുക';

  @override
  String get cameraUnavailable =>
      'ക്യാമറ ലഭ്യമല്ല. അനുമതികൾ പരിശോധിക്കുക അല്ലെങ്കിൽ സ്വമേധയാ നൽകുക.';

  @override
  String get lookingUpProduct => 'ഉൽപ്പന്നം തിരയുന്നു…';

  @override
  String get pointAtBarcode => 'ഉൽപ്പന്ന ബാർകോഡിലേക്ക് ക്യാമറ ചൂണ്ടുക';

  @override
  String get scanExpiryDate => 'കാലാവധി തീയതി സ്കാൻ ചെയ്യുക';

  @override
  String get searchProductByName => 'പേര് ഉപയോഗിച്ച് ഉൽപ്പന്നം തിരയുക';

  @override
  String get searchProduct => 'ഉൽപ്പന്നം തിരയുക';

  @override
  String get searchHintExample => 'ഉദാ. മാഗി കെച്ചപ്പ്';

  @override
  String get typeProductNameHint => 'ഉൽപ്പന്ന നാമം ടൈപ്പ് ചെയ്ത് തിരയുക.';

  @override
  String get scanExpiryInstruction =>
      'അച്ചടിച്ച കാലാവധി, \"best before\", അല്ലെങ്കിൽ MFG തീയതിയിലേക്ക് ക്യാമറ ചൂണ്ടുക.';

  @override
  String get captureDateLabel => 'തീയതി ലേബൽ ക്യാപ്ചർ ചെയ്യുക';

  @override
  String get reScan => 'വീണ്ടും സ്കാൻ';

  @override
  String get pickDateManually => 'തീയതി സ്വമേധയാ തിരഞ്ഞെടുക്കുക';

  @override
  String get detectedDates => 'കണ്ടെത്തിയ തീയതികൾ';

  @override
  String get detectedDatesPlaceholder => 'കണ്ടെത്തിയ തീയതികൾ ഇവിടെ കാണിക്കും.';

  @override
  String get noDateDetected =>
      'തീയതി കണ്ടെത്തിയില്ല. താഴെ സ്വമേധയാ തിരഞ്ഞെടുക്കുക.';

  @override
  String get couldNotCaptureImage => 'ചിത്രം ക്യാപ്ചർ ചെയ്യാൻ കഴിഞ്ഞില്ല.';

  @override
  String get scanNutritionLabel => 'പോഷക ലേബൽ സ്കാൻ ചെയ്യുക';

  @override
  String get nutritionInstruction =>
      'പാക്കേജിലെ പോഷക വസ്തുത പട്ടികയിലേക്ക് ക്യാമറ ചൂണ്ടുക.';

  @override
  String get captureNutritionLabel => 'പോഷക ലേബൽ ക്യാപ്ചർ ചെയ്യുക';

  @override
  String get useTheseValues => 'ഈ മൂല്യങ്ങൾ ഉപയോഗിക്കുക';

  @override
  String get detectedNutritionPlaceholder =>
      'കണ്ടെത്തിയ പോഷക മൂല്യങ്ങൾ ഇവിടെ കാണിക്കും.';

  @override
  String get detectedValuesPer100g => 'കണ്ടെത്തിയ മൂല്യങ്ങൾ (100g-ന്)';

  @override
  String get calories => 'കലോറി';

  @override
  String get protein => 'പ്രോട്ടീൻ';

  @override
  String get fat => 'കൊഴുപ്പ്';

  @override
  String get carbs => 'കാർബ്സ്';

  @override
  String get fiber => 'ഫൈബർ';

  @override
  String get sugar => 'പഞ്ചസാര';

  @override
  String get couldNotDetectNutrition =>
      'പോഷക വിവരങ്ങൾ കണ്ടെത്താൻ കഴിഞ്ഞില്ല. ലേബലിൽ വ്യക്തമായ ഫോക്കസോടെ വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get recipeIdeas => 'റെസിപ്പി ആശയങ്ങൾ';

  @override
  String get thinkingOfRecipes => 'റെസിപ്പികൾ ആലോചിക്കുന്നു...';

  @override
  String get couldNotGenerateRecipes =>
      'ഇപ്പോൾ നിർദ്ദേശങ്ങൾ സൃഷ്ടിക്കാൻ കഴിഞ്ഞില്ല. പിന്നീട് ശ്രമിക്കുക.';

  @override
  String usingProducts(String products) {
    return 'ഉപയോഗിക്കുന്നത്: $products';
  }

  @override
  String get ingredients => 'ചേരുവകൾ';

  @override
  String get steps => 'ഘട്ടങ്ങൾ';

  @override
  String get confirmDetails => 'വിശദാംശങ്ങൾ സ്ഥിരീകരിക്കുക';

  @override
  String get productName => 'ഉൽപ്പന്ന നാമം';

  @override
  String get productNameHint => 'ഉദാ. മിൽമ ബട്ടർ';

  @override
  String get brandOptional => 'ബ്രാൻഡ് (ഐച്ഛികം)';

  @override
  String get brandHint => 'ഉദാ. മിൽമ';

  @override
  String get category => 'വിഭാഗം';

  @override
  String get storage => 'സംഭരണം';

  @override
  String get quantity => 'അളവ്';

  @override
  String nutritionPer(String per) {
    return 'പോഷകം ($per-ന്)';
  }

  @override
  String get expiryDate => 'കാലാവധി തീയതി';

  @override
  String get remindMe => 'എന്നെ ഓർമ്മിപ്പിക്കുക';

  @override
  String get saveProduct => 'ഉൽപ്പന്നം സേവ് ചെയ്യുക';

  @override
  String get pleaseEnterProductName => 'ദയവായി ഉൽപ്പന്ന നാമം നൽകുക';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name അളവ് $qty ആയി അപ്ഡേറ്റ് ചെയ്തു.';
  }

  @override
  String productSaved(String name) {
    return '$name സേവ് ചെയ്തു. ഓർമ്മപ്പെടുത്തലുകൾ സജ്ജീകരിച്ചു.';
  }

  @override
  String get notSignedIn => 'നിങ്ങൾ സൈൻ ഇൻ ചെയ്തിട്ടില്ല.';

  @override
  String get productDetails => 'ഉൽപ്പന്ന വിശദാംശങ്ങൾ';

  @override
  String get editProduct => 'ഉൽപ്പന്നം എഡിറ്റ് ചെയ്യുക';

  @override
  String get saveChanges => 'മാറ്റങ്ങൾ സേവ് ചെയ്യുക';

  @override
  String get required => 'ആവശ്യമാണ്';

  @override
  String get deleteProductTitle => 'ഉൽപ്പന്നം ഇല്ലാതാക്കണോ?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\"-ഉം അതിന്റെ ഓർമ്മപ്പെടുത്തലുകളും ശാശ്വതമായി നീക്കം ചെയ്യപ്പെടും.';
  }

  @override
  String get productUpdated => 'ഉൽപ്പന്നം അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get couldNotUpdateProduct => 'ഉൽപ്പന്നം അപ്ഡേറ്റ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get remindersUpdated => 'ഓർമ്മപ്പെടുത്തലുകൾ അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get couldNotUpdateReminders =>
      'ഓർമ്മപ്പെടുത്തലുകൾ അപ്ഡേറ്റ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get note => 'കുറിപ്പ്';

  @override
  String get noteHint => 'ഉദാ. തുറന്നു, വാതിൽ ഷെൽഫിൽ വയ്ക്കുക…';

  @override
  String get noteSaved => 'കുറിപ്പ് സേവ് ചെയ്തു';

  @override
  String get couldNotSaveNote => 'കുറിപ്പ് സേവ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get noNoteYet => 'ഇതുവരെ കുറിപ്പ് ഇല്ല.';

  @override
  String get markedAsConsumed => 'ഉപയോഗിച്ചതായി അടയാളപ്പെടുത്തി';

  @override
  String get movedBackToInventory => 'ഇൻവെന്ററിയിലേക്ക് തിരികെ നീക്കി';

  @override
  String get couldNotUpdateStatus => 'സ്ഥിതി അപ്ഡേറ്റ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get markAsConsumed => 'ഉപയോഗിച്ചതായി അടയാളപ്പെടുത്തുക';

  @override
  String get moveBackToInventory => 'ഇൻവെന്ററിയിലേക്ക് തിരികെ നീക്കുക';

  @override
  String get nutrition => 'പോഷകം';

  @override
  String get scanLabel => 'ലേബൽ സ്കാൻ';

  @override
  String get update => 'അപ്ഡേറ്റ്';

  @override
  String get noNutritionDataYet => 'ഇതുവരെ പോഷക ഡാറ്റ ഇല്ല.';

  @override
  String get nutritionInfoUpdated => 'പോഷക വിവരങ്ങൾ അപ്ഡേറ്റ് ചെയ്തു';

  @override
  String get couldNotSaveNutritionData => 'പോഷക ഡാറ്റ സേവ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get couldNotDetectNutritionShort =>
      'പോഷക വിവരങ്ങൾ കണ്ടെത്താൻ കഴിഞ്ഞില്ല. വ്യക്തമായ ഫോക്കസോടെ ശ്രമിക്കുക.';

  @override
  String get productDeleted => 'ഉൽപ്പന്നം ഇല്ലാതാക്കി';

  @override
  String get couldNotDeleteProduct => 'ഉൽപ്പന്നം ഇല്ലാതാക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get getRecipeIdeas => 'റെസിപ്പി ആശയങ്ങൾ നേടുക';

  @override
  String get dateSource => 'തീയതി ഉറവിടം';

  @override
  String get sourceOcr => 'സ്കാൻ ചെയ്തത് (OCR)';

  @override
  String get sourceApi => 'ഉൽപ്പന്ന ഡാറ്റാബേസ്';

  @override
  String get sourceManual => 'സ്വമേധയാ നൽകിയത്';

  @override
  String get manufactured => 'നിർമ്മിച്ചത്';

  @override
  String get barcode => 'ബാർകോഡ്';

  @override
  String get nutritionSourceApi => 'ഉൽപ്പന്ന ഡാറ്റാബേസ്';

  @override
  String get nutritionSourceOcr => 'സ്കാൻ ചെയ്തത്';

  @override
  String get nutritionSourceManual => 'സ്വമേധയാ';

  @override
  String perSourceLabel(String per, String source) {
    return '$per-ന് · ഉറവിടം: $source';
  }

  @override
  String get cal => 'കലോ';

  @override
  String get statusFresh => 'പുതിയത്';

  @override
  String get statusExpiringSoon => 'ഉടൻ കാലാവധി';

  @override
  String get statusExpired => 'കാലാവധി കഴിഞ്ഞു';

  @override
  String get statusConsumed => 'ഉപയോഗിച്ചു';

  @override
  String get categoryDairy => 'പാലുൽപ്പന്നം';

  @override
  String get categoryBakery => 'ബേക്കറി';

  @override
  String get categoryProduce => 'പച്ചക്കറി';

  @override
  String get categoryMeat => 'മാംസം & മത്സ്യം';

  @override
  String get categoryBeverages => 'പാനീയങ്ങൾ';

  @override
  String get categorySnacks => 'ലഘുഭക്ഷണം';

  @override
  String get categoryFrozen => 'ഫ്രോസൺ';

  @override
  String get categoryPantry => 'പാന്ട്രി';

  @override
  String get categoryMedicine => 'മരുന്ന്';

  @override
  String get categoryCosmetics => 'സൗന്ദര്യവർധകം';

  @override
  String get categoryBaby => 'ശിശു';

  @override
  String get categoryPetFood => 'പെറ്റ് ഫുഡ്';

  @override
  String get categoryOther => 'മറ്റുള്ളവ';

  @override
  String get storageFridge => 'ഫ്രിഡ്ജ്';

  @override
  String get storageFreezer => 'ഫ്രീസർ';

  @override
  String get storagePantry => 'പാന്ട്രി';

  @override
  String get storageCabinet => 'കാബിനറ്റ്';

  @override
  String get storageOther => 'മറ്റുള്ളവ';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ദിവസം മുമ്പ്',
      one: '1 ദിവസം മുമ്പ്',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'ഇന്ന് കാലാവധി';

  @override
  String get expiresTomorrow => 'നാളെ കാലാവധി';

  @override
  String daysLeft(int count) {
    return '$count ദിവസം ബാക്കി';
  }

  @override
  String get onExpiryDay => 'കാലാവധി ദിവസം';

  @override
  String get oneDayBefore => '1 ദിവസം മുമ്പ്';

  @override
  String daysBefore(int count) {
    return '$count ദിവസം മുമ്പ്';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name ഇന്ന് കാലാവധി തീരുന്നു';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name ഉടൻ കാലാവധി തീരും';
  }

  @override
  String get notifBodyToday =>
      'ദയവായി സുരക്ഷിതമായി ഉപയോഗിക്കുക അല്ലെങ്കിൽ നിർമ്മാർജ്ജനം ചെയ്യുക.';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ദിവസങ്ങളിൽ',
      one: '1 ദിവസത്തിൽ',
    );
    return '$name $_temp0 കാലാവധി തീരും. പാഴാകുന്നത് ഒഴിവാക്കാൻ ഉടൻ ഉപയോഗിക്കുക.';
  }

  @override
  String get expiryReminders => 'കാലാവധി ഓർമ്മപ്പെടുത്തലുകൾ';

  @override
  String get expiryRemindersDesc =>
      'നിങ്ങളുടെ അടുക്കള സാധനങ്ങളുടെ കാലാവധി തീരുന്നതിന് മുമ്പുള്ള ഓർമ്മപ്പെടുത്തലുകൾ.';

  @override
  String get language => 'ഭാഷ';
}
