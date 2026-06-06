// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'ক্রস-প্ল্যাটফর্ম Pub মিরর ব্রাউজার';

  @override
  String get navSearch => 'অনুসন্ধান';

  @override
  String get navFavorites => 'পছন্দের';

  @override
  String get navSettings => 'সেটিংস';

  @override
  String get searchHint => 'Flutter/Dart প্যাকেজ অনুসন্ধান করুন...';

  @override
  String get searchFailed => 'অনুসন্ধান ব্যর্থ, আপনার নেটওয়ার্ক পরীক্ষা করুন';

  @override
  String get searchEmpty =>
      'আপনার প্রয়োজনীয় Flutter/Dart প্যাকেজ অনুসন্ধান করুন';

  @override
  String get searchNoResults => 'কোন প্যাকেজ পাওয়া যায়নি';

  @override
  String get hotRecommend => 'জনপ্রিয় সুপারিশ';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get install => 'ইনস্টল করুন';

  @override
  String get terminal => 'টার্মিনাল';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README লোড হচ্ছে...';

  @override
  String get about => 'সম্পর্কে';

  @override
  String get topics => 'বিষয়';

  @override
  String get details => 'বিস্তারিত';

  @override
  String get language => 'ভাষা';

  @override
  String get selectLanguage => 'ভাষা নির্বাচন করুন';

  @override
  String get languageSystem => 'সিস্টেম';

  @override
  String get checkUpdate => 'আপডেট পরীক্ষা করুন';

  @override
  String get autoTranslate => 'স্বয়ংক্রিয় অনুবাদ';

  @override
  String get autoTranslateDesc => 'OpenAI সামঞ্জস্যপূর্ণ API অনুবাদ';

  @override
  String get latestVersion => 'সর্বশেষ';

  @override
  String get publishDate => 'প্রকাশিত';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'নির্ভরতা';

  @override
  String get links => 'লিংক';

  @override
  String get homepage => 'হোমপেজ';

  @override
  String get repository => 'রিপোজিটরি';

  @override
  String get dependencies => 'নির্ভরতা';

  @override
  String get noDependencies => 'কোন সরাসরি নির্ভরতা নেই';

  @override
  String get versionHistory => 'সংস্করণ ইতিহাস';

  @override
  String moreVersions(int count) {
    return '$countটি পুরানো সংস্করণ...';
  }

  @override
  String get latest => 'সর্বশেষ';

  @override
  String get copied => 'কপি করা হয়েছে';

  @override
  String get copiedToClipboard => 'কোড ক্লিপবোর্ডে কপি করা হয়েছে';

  @override
  String get favoritesFolders => 'ফোল্ডার';

  @override
  String get noFavorites => 'এখনো কোন পছন্দের নেই';

  @override
  String get noFavoritesHint =>
      'পছন্দের যোগ করতে অনুসন্ধান ফলাফলে হার্ট আইকনে ট্যাপ করুন';

  @override
  String emptyFolder(String name) {
    return '\"$name\" এ কোন পছন্দের নেই';
  }

  @override
  String get createFolder => 'নতুন ফোল্ডার';

  @override
  String get folderName => 'ফোল্ডারের নাম';

  @override
  String get create => 'তৈরি করুন';

  @override
  String get rename => 'নাম পরিবর্তন করুন';

  @override
  String get delete => 'মুছুন';

  @override
  String get renameFolder => 'ফোল্ডারের নাম পরিবর্তন করুন';

  @override
  String get deleteFolder => 'ফোল্ডার মুছুন';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" মুছবেন? এতে থাকা প্যাকেজ সরিয়ে ফেলা হবে।';
  }

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get confirm => 'নিশ্চিত করুন';

  @override
  String get folderExists => 'ফোল্ডার ইতিমধ্যে বিদ্যমান';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" থেকে সরাবেন?';
  }

  @override
  String get removeFavorite => 'পছন্দের থেকে সরান';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" পছন্দের থেকে সরাবেন?';
  }

  @override
  String get addToOtherFolders => 'অন্য ফোল্ডারে যোগ করুন';

  @override
  String get selectFolder => 'ফোল্ডার নির্বাচন করুন';

  @override
  String get createAndAdd => 'তৈরি করুন এবং যোগ করুন';

  @override
  String favoriteManaged(String folders) {
    return 'সংরক্ষিত: $folders';
  }

  @override
  String get cancelAllFavorites => 'সব থেকে সরান';

  @override
  String get pubMirror => 'Pub মিরর';

  @override
  String get pubMirrorHint =>
      'প্যাকেজ অনুসন্ধানের জন্য নতুন মিরর সোর্সে পরিবর্তন করুন';

  @override
  String get githubMirror => 'GitHub মিরর';

  @override
  String get githubRawMirror => 'GitHub Raw মিরর';

  @override
  String get githubMirrorHint =>
      'প্যাকেজ README আনতে, চীনে মিরর ব্যবহার করার সুপারিশ';

  @override
  String get appearance => 'চেহারা';

  @override
  String get theme => 'থিম';

  @override
  String get themeSystem => 'সিস্টেম';

  @override
  String get themeLight => 'হালকা';

  @override
  String get themeDark => 'গাঢ়';

  @override
  String get selectTheme => 'থিম নির্বাচন করুন';

  @override
  String get themeColor => 'থিম রং';

  @override
  String get data => 'ডেটা';

  @override
  String get clearCache => 'ক্যাশ পরিষ্কার করুন';

  @override
  String get clearCacheSubtitle => 'সমস্ত API ক্যাশ ডেটা পরিষ্কার করুন';

  @override
  String get clearCacheTitle => 'ক্যাশ পরিষ্কার করুন';

  @override
  String get clearCacheConfirm =>
      'সমস্ত API ক্যাশ পরিষ্কার করবেন? পছন্দের এবং সেটিংস মুছে যাবে না।';

  @override
  String get cacheCleared => 'ক্যাশ পরিষ্কার করা হয়েছে';

  @override
  String get aboutPubPub => 'PubPub সম্পর্কে';

  @override
  String version(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get aboutTitle => 'সম্পর্কে';

  @override
  String get aboutDescription => 'ক্রস-প্ল্যাটফর্ম Pub মিরর ব্রাউজার';

  @override
  String get features => 'বৈশিষ্ট্য';

  @override
  String get featureSearch => 'প্যাকেজ অনুসন্ধান';

  @override
  String get featureSearchDesc => 'একাধিক Pub মিররের মাধ্যমে অনুসন্ধান';

  @override
  String get featureDetail => 'প্যাকেজ বিস্তারিত';

  @override
  String get featureDetailDesc => 'সংস্করণ, নির্ভরতা, README সম্পূর্ণ প্রদর্শন';

  @override
  String get featureFavorites => 'কাস্টম সংগ্রহ';

  @override
  String get featureFavoritesDesc => 'সংগঠিত করতে একাধিক ফোল্ডার তৈরি করুন';

  @override
  String get featureTheme => 'থিম কাস্টমাইজেশন';

  @override
  String get featureThemeDesc => '১০টি থিম রং + ডার্ক মোড';

  @override
  String get featureLayout => 'রেসপন্সিভ লেআউট';

  @override
  String get featureLayoutDesc => 'মোবাইল/ডেস্কটপ অ্যাডাপ্টিভ';

  @override
  String get techStack => 'টেক স্ট্যাক';

  @override
  String get linksTitle => 'লিংক';

  @override
  String get githubRepo => 'GitHub রিপোজিটরি';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter অফিসিয়াল';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'লাইসেন্স';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter দিয়ে ❤️ দিয়ে তৈরি';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get error => 'ত্রুটি';

  @override
  String get success => 'সফল';

  @override
  String get ok => 'ঠিক আছে';

  @override
  String get yes => 'হ্যাঁ';

  @override
  String get no => 'না';
}
