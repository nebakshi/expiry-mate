// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appName => 'Bloom';

  @override
  String get tagline => 'সবসময় তাজা রাখুন।';

  @override
  String get skip => 'এড়িয়ে যান';

  @override
  String get next => 'পরবর্তী';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get cancel => 'বাতিল';

  @override
  String get save => 'সংরক্ষণ';

  @override
  String get delete => 'মুছুন';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get add => 'যোগ করুন';

  @override
  String get onboardingTitle1 => 'সেকেন্ডে স্ক্যান করুন';

  @override
  String get onboardingBody1 =>
      'বারকোডের দিকে ক্যামেরা ধরুন এবং আমরা তাৎক্ষণিকভাবে পণ্য শনাক্ত করব।';

  @override
  String get onboardingTitle2 => 'মেয়াদ শেষের তারিখ পড়ুন';

  @override
  String get onboardingBody2 =>
      'প্রিন্ট করা তারিখ স্ক্যান করুন — আমাদের ভারত-কেন্দ্রিক পার্সার MFG + best-before ও পরিচালনা করে।';

  @override
  String get onboardingTitle3 => 'মেয়াদ শেষ কখনো মিস করবেন না';

  @override
  String get onboardingBody3 =>
      'মেয়াদ শেষের ৭ দিন, ২ দিন আগে এবং সেই দিনে রিমাইন্ডার পান।';

  @override
  String get onboardingTitle4 => 'খাবার নষ্ট করবেন না';

  @override
  String get onboardingBody4 =>
      'আপনার পুরো রান্নাঘর এক জায়গায় ট্র্যাক করুন এবং নষ্ট হওয়ার আগে ব্যবহার করুন।';

  @override
  String get continueWithGoogle => 'Google দিয়ে চালিয়ে যান';

  @override
  String get continueWithApple => 'Apple দিয়ে চালিয়ে যান';

  @override
  String get continueAsGuest => 'অতিথি হিসেবে চালিয়ে যান';

  @override
  String get legalText =>
      'চালিয়ে যাওয়ার মাধ্যমে আপনি আমাদের শর্তাবলী ও গোপনীয়তা নীতিতে সম্মত হচ্ছেন।';

  @override
  String homeGreeting(String name) {
    return 'হ্যালো$name 👋';
  }

  @override
  String get scan => 'স্ক্যান';

  @override
  String get searchHint => 'পণ্য বা ব্র্যান্ড খুঁজুন';

  @override
  String get tracked => 'ট্র্যাক করা';

  @override
  String get expiring => 'শীঘ্রই শেষ';

  @override
  String get expired => 'মেয়াদ শেষ';

  @override
  String get filterAll => 'সব';

  @override
  String get filterFresh => 'তাজা';

  @override
  String get filterExpiringSoon => 'শীঘ্রই মেয়াদ শেষ';

  @override
  String get filterExpired => 'মেয়াদ শেষ';

  @override
  String recipeBanner(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি আইটেমের মেয়াদ শেষ হচ্ছে — রেসিপি আইডিয়া পান',
      one: '১টি আইটেমের মেয়াদ শেষ হচ্ছে — রেসিপি আইডিয়া পান',
    );
    return '$_temp0';
  }

  @override
  String get emptyKitchenTitle => 'আপনার রান্নাঘর খালি';

  @override
  String get emptyKitchenMessage =>
      'মেয়াদ শেষের তারিখ ট্র্যাক করতে এবং সময়মতো রিমাইন্ডার পেতে আপনার প্রথম পণ্য স্ক্যান করুন।';

  @override
  String get scanAProduct => 'একটি পণ্য স্ক্যান করুন';

  @override
  String get settings => 'সেটিংস';

  @override
  String get guest => 'অতিথি';

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get appearance => 'চেহারা';

  @override
  String get reminders => 'রিমাইন্ডার';

  @override
  String get data => 'ডেটা';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get accountActions => 'অ্যাকাউন্ট কার্যক্রম';

  @override
  String get notificationPermission => 'বিজ্ঞপ্তি অনুমতি';

  @override
  String get allowBloomAlerts => 'Bloom কে মেয়াদ শেষের সতর্কতা পাঠাতে দিন';

  @override
  String get exportMyData => 'আমার ডেটা এক্সপোর্ট করুন';

  @override
  String get exportSubtitle => 'আপনার ইনভেন্টরি JSON হিসেবে কপি করুন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String get termsAndConditions => 'শর্তাবলী';

  @override
  String get version => 'সংস্করণ';

  @override
  String get signOut => 'সাইন আউট';

  @override
  String get deleteAccount => 'অ্যাকাউন্ট মুছুন';

  @override
  String get permanentlyRemovesData => 'আপনার ডেটা স্থায়ীভাবে মুছে ফেলে';

  @override
  String get signOutConfirmTitle => 'সাইন আউট করবেন?';

  @override
  String get signOutConfirmMessage =>
      'আপনি যেকোনো সময় আবার সাইন ইন করতে পারবেন।';

  @override
  String get deleteAccountConfirmTitle => 'অ্যাকাউন্ট মুছবেন?';

  @override
  String get deleteAccountConfirmMessage =>
      'এটি আপনার অ্যাকাউন্ট এবং সমস্ত সংরক্ষিত পণ্য স্থায়ীভাবে মুছে ফেলবে। এটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get freePlan => 'ফ্রি প্ল্যান';

  @override
  String freePlanUsage(int total, int limit) {
    return '$limit এর মধ্যে $totalটি আইটেম ব্যবহৃত';
  }

  @override
  String itemsLeft(int remaining) {
    return '$remainingটি বাকি';
  }

  @override
  String get limitReached => 'সীমা পূর্ণ';

  @override
  String get notificationsEnabled => 'বিজ্ঞপ্তি সক্রিয়';

  @override
  String get notificationsOff =>
      'বিজ্ঞপ্তি বন্ধ আছে। আপনার ডিভাইস সেটিংসে সক্রিয় করুন।';

  @override
  String exportedItems(int count) {
    return '$countটি আইটেম ক্লিপবোর্ডে এক্সপোর্ট করা হয়েছে';
  }

  @override
  String get couldNotOpenLink => 'লিংক খোলা যায়নি';

  @override
  String get accountDeleted => 'অ্যাকাউন্ট মুছে ফেলা হয়েছে';

  @override
  String get reSignInToDelete =>
      'অনুগ্রহ করে আবার সাইন ইন করুন, তারপর অ্যাকাউন্ট মোছার চেষ্টা করুন।';

  @override
  String get couldNotDeleteAccount => 'অ্যাকাউন্ট মুছতে পারেনি';

  @override
  String get signedInWithGoogle => 'Google দিয়ে সাইন ইন';

  @override
  String get signedInWithApple => 'Apple দিয়ে সাইন ইন';

  @override
  String get guestAccount => 'অতিথি অ্যাকাউন্ট';

  @override
  String get signedIn => 'সাইন ইন';

  @override
  String get defaultReminders => 'ডিফল্ট রিমাইন্ডার';

  @override
  String get appliedToNewProducts => 'নতুন পণ্যে প্রযোজ্য';

  @override
  String get theme => 'থিম';

  @override
  String get scanBarcode => 'বারকোড স্ক্যান করুন';

  @override
  String get enterManually => 'ম্যানুয়ালি দিন';

  @override
  String get cameraUnavailable =>
      'ক্যামেরা পাওয়া যাচ্ছে না। অনুমতি পরীক্ষা করুন বা ম্যানুয়ালি দিন।';

  @override
  String get lookingUpProduct => 'পণ্য খুঁজছে…';

  @override
  String get pointAtBarcode => 'পণ্যের বারকোডের দিকে ক্যামেরা ধরুন';

  @override
  String get scanExpiryDate => 'মেয়াদ শেষের তারিখ স্ক্যান করুন';

  @override
  String get searchProductByName => 'নাম দিয়ে পণ্য খুঁজুন';

  @override
  String get searchProduct => 'পণ্য খুঁজুন';

  @override
  String get searchHintExample => 'যেমন ম্যাগি কেচাপ';

  @override
  String get typeProductNameHint => 'পণ্যের নাম টাইপ করে খুঁজুন।';

  @override
  String get scanExpiryInstruction =>
      'প্রিন্ট করা মেয়াদ শেষ, \"best before\", বা MFG তারিখের দিকে ক্যামেরা ধরুন।';

  @override
  String get captureDateLabel => 'তারিখ লেবেল ক্যাপচার করুন';

  @override
  String get reScan => 'আবার স্ক্যান';

  @override
  String get pickDateManually => 'তারিখ ম্যানুয়ালি বাছুন';

  @override
  String get detectedDates => 'শনাক্ত করা তারিখ';

  @override
  String get detectedDatesPlaceholder => 'শনাক্ত করা তারিখ এখানে দেখা যাবে।';

  @override
  String get noDateDetected => 'তারিখ শনাক্ত হয়নি। নিচে ম্যানুয়ালি বাছুন।';

  @override
  String get couldNotCaptureImage => 'ছবি ক্যাপচার করা যায়নি।';

  @override
  String get scanNutritionLabel => 'পুষ্টি লেবেল স্ক্যান করুন';

  @override
  String get nutritionInstruction =>
      'প্যাকেজের পুষ্টি তথ্য টেবিলের দিকে ক্যামেরা ধরুন।';

  @override
  String get captureNutritionLabel => 'পুষ্টি লেবেল ক্যাপচার করুন';

  @override
  String get useTheseValues => 'এই মানগুলি ব্যবহার করুন';

  @override
  String get detectedNutritionPlaceholder =>
      'শনাক্ত করা পুষ্টি মান এখানে দেখা যাবে।';

  @override
  String get detectedValuesPer100g => 'শনাক্ত করা মান (প্রতি 100g)';

  @override
  String get calories => 'ক্যালোরি';

  @override
  String get protein => 'প্রোটিন';

  @override
  String get fat => 'ফ্যাট';

  @override
  String get carbs => 'কার্বস';

  @override
  String get fiber => 'ফাইবার';

  @override
  String get sugar => 'চিনি';

  @override
  String get couldNotDetectNutrition =>
      'পুষ্টি তথ্য শনাক্ত করা যায়নি। লেবেলে স্পষ্ট ফোকাস দিয়ে আবার চেষ্টা করুন।';

  @override
  String get recipeIdeas => 'রেসিপি আইডিয়া';

  @override
  String get thinkingOfRecipes => 'রেসিপি ভাবছে...';

  @override
  String get couldNotGenerateRecipes =>
      'এখন সাজেশন তৈরি করা যাচ্ছে না। পরে আবার চেষ্টা করুন।';

  @override
  String usingProducts(String products) {
    return 'ব্যবহার করছে: $products';
  }

  @override
  String get ingredients => 'উপকরণ';

  @override
  String get steps => 'ধাপ';

  @override
  String get confirmDetails => 'বিবরণ নিশ্চিত করুন';

  @override
  String get productName => 'পণ্যের নাম';

  @override
  String get productNameHint => 'যেমন আমুল বাটার';

  @override
  String get brandOptional => 'ব্র্যান্ড (ঐচ্ছিক)';

  @override
  String get brandHint => 'যেমন আমুল';

  @override
  String get category => 'বিভাগ';

  @override
  String get storage => 'সংরক্ষণ';

  @override
  String get quantity => 'পরিমাণ';

  @override
  String nutritionPer(String per) {
    return 'পুষ্টি (প্রতি $per)';
  }

  @override
  String get expiryDate => 'মেয়াদ শেষের তারিখ';

  @override
  String get remindMe => 'আমাকে মনে করিয়ে দিন';

  @override
  String get saveProduct => 'পণ্য সংরক্ষণ করুন';

  @override
  String get pleaseEnterProductName => 'অনুগ্রহ করে পণ্যের নাম দিন';

  @override
  String productQuantityUpdated(String name, int qty) {
    return '$name পরিমাণ $qty তে আপডেট হয়েছে।';
  }

  @override
  String productSaved(String name) {
    return '$name সংরক্ষিত। রিমাইন্ডার সেট করা হয়েছে।';
  }

  @override
  String get notSignedIn => 'আপনি সাইন ইন করেননি।';

  @override
  String get productDetails => 'পণ্যের বিবরণ';

  @override
  String get editProduct => 'পণ্য সম্পাদনা';

  @override
  String get saveChanges => 'পরিবর্তন সংরক্ষণ';

  @override
  String get required => 'আবশ্যক';

  @override
  String get deleteProductTitle => 'পণ্য মুছবেন?';

  @override
  String deleteProductMessage(String name) {
    return '\"$name\" এবং এর রিমাইন্ডার স্থায়ীভাবে মুছে ফেলা হবে।';
  }

  @override
  String get productUpdated => 'পণ্য আপডেট হয়েছে';

  @override
  String get couldNotUpdateProduct => 'পণ্য আপডেট করা যায়নি';

  @override
  String get remindersUpdated => 'রিমাইন্ডার আপডেট হয়েছে';

  @override
  String get couldNotUpdateReminders => 'রিমাইন্ডার আপডেট করা যায়নি';

  @override
  String get note => 'নোট';

  @override
  String get noteHint => 'যেমন খোলা হয়েছে, দরজার শেল্ফে রাখুন…';

  @override
  String get noteSaved => 'নোট সংরক্ষিত';

  @override
  String get couldNotSaveNote => 'নোট সংরক্ষণ করা যায়নি';

  @override
  String get noNoteYet => 'এখনো কোনো নোট নেই।';

  @override
  String get markedAsConsumed => 'ব্যবহৃত হিসেবে চিহ্নিত';

  @override
  String get movedBackToInventory => 'ইনভেন্টরিতে ফেরত পাঠানো হয়েছে';

  @override
  String get couldNotUpdateStatus => 'স্ট্যাটাস আপডেট করা যায়নি';

  @override
  String get markAsConsumed => 'ব্যবহৃত হিসেবে চিহ্নিত করুন';

  @override
  String get moveBackToInventory => 'ইনভেন্টরিতে ফেরত পাঠান';

  @override
  String get nutrition => 'পুষ্টি';

  @override
  String get scanLabel => 'লেবেল স্ক্যান';

  @override
  String get update => 'আপডেট';

  @override
  String get noNutritionDataYet => 'এখনো পুষ্টি ডেটা নেই।';

  @override
  String get nutritionInfoUpdated => 'পুষ্টি তথ্য আপডেট হয়েছে';

  @override
  String get couldNotSaveNutritionData => 'পুষ্টি ডেটা সংরক্ষণ করা যায়নি';

  @override
  String get couldNotDetectNutritionShort =>
      'পুষ্টি তথ্য শনাক্ত করা যায়নি। স্পষ্ট ফোকাসে চেষ্টা করুন।';

  @override
  String get productDeleted => 'পণ্য মুছে ফেলা হয়েছে';

  @override
  String get couldNotDeleteProduct => 'পণ্য মুছতে পারেনি';

  @override
  String get getRecipeIdeas => 'রেসিপি আইডিয়া পান';

  @override
  String get dateSource => 'তারিখের উৎস';

  @override
  String get sourceOcr => 'স্ক্যান করা (OCR)';

  @override
  String get sourceApi => 'পণ্য ডেটাবেস';

  @override
  String get sourceManual => 'ম্যানুয়ালি দেওয়া';

  @override
  String get manufactured => 'উৎপাদিত';

  @override
  String get barcode => 'বারকোড';

  @override
  String get nutritionSourceApi => 'পণ্য ডেটাবেস';

  @override
  String get nutritionSourceOcr => 'স্ক্যান করা';

  @override
  String get nutritionSourceManual => 'ম্যানুয়াল';

  @override
  String perSourceLabel(String per, String source) {
    return 'প্রতি $per · উৎস: $source';
  }

  @override
  String get cal => 'ক্যালো';

  @override
  String get statusFresh => 'তাজা';

  @override
  String get statusExpiringSoon => 'শীঘ্রই মেয়াদ শেষ';

  @override
  String get statusExpired => 'মেয়াদ শেষ';

  @override
  String get statusConsumed => 'ব্যবহৃত';

  @override
  String get categoryDairy => 'দুগ্ধজাত';

  @override
  String get categoryBakery => 'বেকারি';

  @override
  String get categoryProduce => 'শাকসবজি';

  @override
  String get categoryMeat => 'মাংস ও মাছ';

  @override
  String get categoryBeverages => 'পানীয়';

  @override
  String get categorySnacks => 'স্ন্যাকস';

  @override
  String get categoryFrozen => 'হিমায়িত';

  @override
  String get categoryPantry => 'প্যান্ট্রি';

  @override
  String get categoryMedicine => 'ওষুধ';

  @override
  String get categoryCosmetics => 'প্রসাধনী';

  @override
  String get categoryBaby => 'শিশু';

  @override
  String get categoryPetFood => 'পোষা প্রাণীর খাবার';

  @override
  String get categoryOther => 'অন্যান্য';

  @override
  String get storageFridge => 'ফ্রিজ';

  @override
  String get storageFreezer => 'ফ্রিজার';

  @override
  String get storagePantry => 'প্যান্ট্রি';

  @override
  String get storageCabinet => 'ক্যাবিনেট';

  @override
  String get storageOther => 'অন্যান্য';

  @override
  String daysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিন আগে',
      one: '১ দিন আগে',
    );
    return '$_temp0';
  }

  @override
  String get expiresToday => 'আজ মেয়াদ শেষ';

  @override
  String get expiresTomorrow => 'আগামীকাল মেয়াদ শেষ';

  @override
  String daysLeft(int count) {
    return '$count দিন বাকি';
  }

  @override
  String get onExpiryDay => 'মেয়াদ শেষের দিনে';

  @override
  String get oneDayBefore => '১ দিন আগে';

  @override
  String daysBefore(int count) {
    return '$count দিন আগে';
  }

  @override
  String notifExpiresToday(String name) {
    return '$name আজ মেয়াদ শেষ হচ্ছে';
  }

  @override
  String notifExpiresSoon(String name) {
    return '$name শীঘ্রই মেয়াদ শেষ হবে';
  }

  @override
  String get notifBodyToday => 'অনুগ্রহ করে নিরাপদে ব্যবহার করুন বা ফেলে দিন।';

  @override
  String notifBodySoon(String name, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count দিনে',
      one: '১ দিনে',
    );
    return '$name $_temp0 মেয়াদ শেষ হবে। অপচয় এড়াতে শীঘ্রই ব্যবহার করুন।';
  }

  @override
  String get expiryReminders => 'মেয়াদ শেষের রিমাইন্ডার';

  @override
  String get expiryRemindersDesc =>
      'আপনার রান্নাঘরের আইটেম মেয়াদ শেষ হওয়ার আগে রিমাইন্ডার।';

  @override
  String get language => 'ভাষা';
}
