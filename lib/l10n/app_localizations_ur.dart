// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'کراس پلیٹ فارم Pub میرر براؤزر';

  @override
  String get navSearch => 'تلاش کریں';

  @override
  String get navFavorites => 'پسندیدہ';

  @override
  String get navSettings => 'ترتیبات';

  @override
  String get searchHint => 'Flutter/Dart پیکجز تلاش کریں...';

  @override
  String get searchFailed => 'تلاش ناکام، اپنا نیٹ ورک چیک کریں';

  @override
  String get searchEmpty => 'اپنی ضرورت کے Flutter/Dart پیکجز تلاش کریں';

  @override
  String get searchNoResults => 'کوئی پیکج نہیں ملا';

  @override
  String get hotRecommend => 'مقبول سفارشات';

  @override
  String get retry => 'دوبارہ کوشش کریں';

  @override
  String get install => 'انسٹال کریں';

  @override
  String get terminal => 'ٹرمینل';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README لوڈ ہو رہا ہے...';

  @override
  String get about => 'کے بارے میں';

  @override
  String get topics => 'موضوعات';

  @override
  String get details => 'تفصیلات';

  @override
  String get language => 'زبان';

  @override
  String get selectLanguage => 'زبان منتخب کریں';

  @override
  String get languageSystem => 'سسٹم';

  @override
  String get checkUpdate => 'اپڈیٹ چیک کریں';

  @override
  String get autoTranslate => 'خودکار ترجمہ';

  @override
  String get autoTranslateDesc => 'OpenAI مطابقت پذیر API ترجمہ';

  @override
  String get latestVersion => 'تازہ ترین';

  @override
  String get publishDate => 'شائع شدہ';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'انحصار';

  @override
  String get links => 'لنکس';

  @override
  String get homepage => 'ہوم پیج';

  @override
  String get repository => 'ریپوزٹری';

  @override
  String get dependencies => 'انحصار';

  @override
  String get noDependencies => 'کوئی براہ راست انحصار نہیں';

  @override
  String get versionHistory => 'ورژن کی تاریخ';

  @override
  String moreVersions(int count) {
    return '$count پرانے ورژن...';
  }

  @override
  String get latest => 'تازہ ترین';

  @override
  String get copied => 'کاپی کیا گیا';

  @override
  String get copiedToClipboard => 'کوڈ کلپ بورڈ پر کاپی کیا گیا';

  @override
  String get favoritesFolders => 'فولڈرز';

  @override
  String get noFavorites => 'ابھی تک کوئی پسندیدہ نہیں';

  @override
  String get noFavoritesHint =>
      'پسندیدہ میں شامل کرنے کے لیے تلاش کے نتائج میں ہارٹ آئیکن پر ٹیپ کریں';

  @override
  String emptyFolder(String name) {
    return '\"$name\" میں کوئی پسندیدہ نہیں';
  }

  @override
  String get createFolder => 'نیا فولڈر';

  @override
  String get folderName => 'فولڈر کا نام';

  @override
  String get create => 'بنائیں';

  @override
  String get rename => 'نام تبدیل کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get renameFolder => 'فولڈر کا نام تبدیل کریں';

  @override
  String get deleteFolder => 'فولڈر حذف کریں';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" حذف کریں؟ اس میں شامل پیکجز ہٹا دیے جائیں گے۔';
  }

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get confirm => 'تصدیق کریں';

  @override
  String get folderExists => 'فولڈر پہلے سے موجود ہے';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" سے ہٹائیں؟';
  }

  @override
  String get removeFavorite => 'پسندیدہ سے ہٹائیں';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" کو پسندیدہ سے ہٹائیں؟';
  }

  @override
  String get addToOtherFolders => 'دوسرے فولڈرز میں شامل کریں';

  @override
  String get selectFolder => 'فولڈر منتخب کریں';

  @override
  String get createAndAdd => 'بنائیں اور شامل کریں';

  @override
  String favoriteManaged(String folders) {
    return 'محفوظ کیا: $folders';
  }

  @override
  String get cancelAllFavorites => 'سب سے ہٹائیں';

  @override
  String get pubMirror => 'Pub میرر';

  @override
  String get pubMirrorHint =>
      'پیکجز تلاش کرنے کے لیے نئے میرر ذریعے پر سوئچ کریں';

  @override
  String get githubMirror => 'GitHub میرر';

  @override
  String get githubRawMirror => 'GitHub Raw میرر';

  @override
  String get githubMirrorHint =>
      'پیکج README حاصل کرنے کے لیے، چین میں میرر استعمال کرنے کی سفارش';

  @override
  String get appearance => 'ظاہری شکل';

  @override
  String get theme => 'تھیم';

  @override
  String get themeSystem => 'سسٹم';

  @override
  String get themeLight => 'ہلکا';

  @override
  String get themeDark => 'گہرا';

  @override
  String get selectTheme => 'تھیم منتخب کریں';

  @override
  String get themeColor => 'تھیم رنگ';

  @override
  String get data => 'ڈیٹا';

  @override
  String get clearCache => 'کیشے صاف کریں';

  @override
  String get clearCacheSubtitle => 'تمام API کیشے ڈیٹا صاف کریں';

  @override
  String get clearCacheTitle => 'کیشے صاف کریں';

  @override
  String get clearCacheConfirm =>
      'تمام API کیشے صاف کریں؟ پسندیدہ اور ترتیبات حذف نہیں ہوں گی۔';

  @override
  String get cacheCleared => 'کیشے صاف کیا گیا';

  @override
  String get aboutPubPub => 'PubPub کے بارے میں';

  @override
  String version(String version) {
    return 'ورژن $version';
  }

  @override
  String get aboutTitle => 'کے بارے میں';

  @override
  String get aboutDescription => 'کراس پلیٹ فارم Pub میرر براؤزر';

  @override
  String get features => 'خصوصیات';

  @override
  String get featureSearch => 'پیکج تلاش';

  @override
  String get featureSearchDesc => 'متعدد Pub میررز کے ذریعے تلاش';

  @override
  String get featureDetail => 'پیکج تفصیلات';

  @override
  String get featureDetailDesc => 'ورژن، انحصار، README مکمل نظر';

  @override
  String get featureFavorites => 'حسب ضرورت مجموعے';

  @override
  String get featureFavoritesDesc => 'ترتیب کے لیے متعدد فولڈرز بنائیں';

  @override
  String get featureTheme => 'تھیم کسٹمائزیشن';

  @override
  String get featureThemeDesc => '10 تھیم رنگ + ڈارک موڈ';

  @override
  String get featureLayout => 'ریسپانسولے آؤٹ';

  @override
  String get featureLayoutDesc => 'موبائل/ڈیسکٹاپ مطابقت پذیر';

  @override
  String get techStack => 'ٹیک اسٹیک';

  @override
  String get linksTitle => 'لنکس';

  @override
  String get githubRepo => 'GitHub ریپوزٹری';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter سرکاری';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'لائسنس';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter کے ساتھ ❤️ سے بنایا گیا';

  @override
  String get loading => 'لوڈ ہو رہا ہے...';

  @override
  String get error => 'خرابی';

  @override
  String get success => 'کامیابی';

  @override
  String get ok => 'ٹھیک ہے';

  @override
  String get yes => 'ہاں';

  @override
  String get no => 'نہیں';
}
