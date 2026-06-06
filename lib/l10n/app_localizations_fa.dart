// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'مرورگر آینه Pub چندسکویی';

  @override
  String get navSearch => 'جستجو';

  @override
  String get navFavorites => 'علاقه‌مندی‌ها';

  @override
  String get navSettings => 'تنظیمات';

  @override
  String get searchHint => 'جستجوی بسته‌های Flutter/Dart...';

  @override
  String get searchFailed => 'جستجو ناموفق، شبکه خود را بررسی کنید';

  @override
  String get searchEmpty => 'بسته‌های Flutter/Dart مورد نیاز خود را جستجو کنید';

  @override
  String get searchNoResults => 'بسته‌ای یافت نشد';

  @override
  String get hotRecommend => 'توصیه‌های محبوب';

  @override
  String get retry => 'تلاش مجدد';

  @override
  String get install => 'نصب';

  @override
  String get terminal => 'ترمینال';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'در حال بارگذاری README...';

  @override
  String get about => 'درباره';

  @override
  String get topics => 'موضوعات';

  @override
  String get details => 'جزئیات';

  @override
  String get language => 'زبان';

  @override
  String get selectLanguage => 'زبان را انتخاب کنید';

  @override
  String get languageSystem => 'سیستم';

  @override
  String get checkUpdate => 'بررسی به‌روزرسانی';

  @override
  String get autoTranslate => 'ترجمه خودکار';

  @override
  String get autoTranslateDesc => 'ترجمه از طریق API سازگار با OpenAI';

  @override
  String get latestVersion => 'جدیدترین';

  @override
  String get publishDate => 'تاریخ انتشار';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'وابستگی‌ها';

  @override
  String get links => 'لینک‌ها';

  @override
  String get homepage => 'صفحه اصلی';

  @override
  String get repository => 'مخزن';

  @override
  String get dependencies => 'وابستگی‌ها';

  @override
  String get noDependencies => 'بدون وابستگی مستقیم';

  @override
  String get versionHistory => 'تاریخچه نسخه';

  @override
  String moreVersions(int count) {
    return '$count نسخه قبلی...';
  }

  @override
  String get latest => 'جدیدترین';

  @override
  String get copied => 'کپی شد';

  @override
  String get copiedToClipboard => 'کد در کلیپ‌بورد کپی شد';

  @override
  String get favoritesFolders => 'پوشه‌ها';

  @override
  String get noFavorites => 'هنوز علاقه‌مندی وجود ندارد';

  @override
  String get noFavoritesHint =>
      'برای افزودن به علاقه‌مندی‌ها، روی نماد قلب در نتایج جستجو ضربه بزنید';

  @override
  String emptyFolder(String name) {
    return '\"$name\" علاقه‌مندی ندارد';
  }

  @override
  String get createFolder => 'پوشه جدید';

  @override
  String get folderName => 'نام پوشه';

  @override
  String get create => 'ایجاد';

  @override
  String get rename => 'تغییر نام';

  @override
  String get delete => 'حذف';

  @override
  String get renameFolder => 'تغییر نام پوشه';

  @override
  String get deleteFolder => 'حذف پوشه';

  @override
  String deleteFolderConfirm(String name) {
    return 'آیا \"$name\" حذف شود؟ بسته‌های داخل آن حذف خواهند شد.';
  }

  @override
  String get cancel => 'لغو';

  @override
  String get confirm => 'تأیید';

  @override
  String get folderExists => 'پوشه از قبل وجود دارد';

  @override
  String removeFromFolder(String folder) {
    return 'از \"$folder\" حذف شود؟';
  }

  @override
  String get removeFavorite => 'حذف از علاقه‌مندی‌ها';

  @override
  String removeFavoriteConfirm(String name) {
    return 'آیا \"$name\" از علاقه‌مندی‌ها حذف شود؟';
  }

  @override
  String get addToOtherFolders => 'افزودن به پوشه‌های دیگر';

  @override
  String get selectFolder => 'انتخاب پوشه';

  @override
  String get createAndAdd => 'ایجاد و افزودن';

  @override
  String favoriteManaged(String folders) {
    return 'ذخیره شده در: $folders';
  }

  @override
  String get cancelAllFavorites => 'حذف از همه';

  @override
  String get pubMirror => 'آینه Pub';

  @override
  String get pubMirrorHint => 'تغییر به منبع آینه جدید برای جستجوی بسته‌ها';

  @override
  String get githubMirror => 'آینه GitHub';

  @override
  String get githubRawMirror => 'آینه GitHub Raw';

  @override
  String get githubMirrorHint =>
      'برای دریافت README بسته‌ها، استفاده از آینه در چین توصیه می‌شود';

  @override
  String get appearance => 'ظاهر';

  @override
  String get theme => 'تم';

  @override
  String get themeSystem => 'سیستم';

  @override
  String get themeLight => 'روشن';

  @override
  String get themeDark => 'تاریک';

  @override
  String get selectTheme => 'انتخاب تم';

  @override
  String get themeColor => 'رنگ تم';

  @override
  String get data => 'داده‌ها';

  @override
  String get clearCache => 'پاک کردن حافظه پنهان';

  @override
  String get clearCacheSubtitle => 'پاک کردن تمام داده‌های حافظه پنهان API';

  @override
  String get clearCacheTitle => 'پاک کردن حافظه پنهان';

  @override
  String get clearCacheConfirm =>
      'آیا تمام حافظه پنهان API پاک شود؟ علاقه‌مندی‌ها و تنظیمات حذف نخواهند شد.';

  @override
  String get cacheCleared => 'حافظه پنهان پاک شد';

  @override
  String get aboutPubPub => 'درباره PubPub';

  @override
  String version(String version) {
    return 'نسخه $version';
  }

  @override
  String get aboutTitle => 'درباره';

  @override
  String get aboutDescription => 'مرورگر آینه Pub چندسکویی';

  @override
  String get features => 'ویژگی‌ها';

  @override
  String get featureSearch => 'جستجوی بسته';

  @override
  String get featureSearchDesc => 'جستجو از طریق چندین آینه Pub';

  @override
  String get featureDetail => 'جزئیات بسته';

  @override
  String get featureDetailDesc => 'نسخه، وابستگی‌ها، نمایش کامل README';

  @override
  String get featureFavorites => 'مجموعه‌های سفارشی';

  @override
  String get featureFavoritesDesc => 'ایجاد چندین پوشه برای سازماندهی';

  @override
  String get featureTheme => 'سفارشی‌سازی تم';

  @override
  String get featureThemeDesc => '10 رنگ تم + حالت تاریک';

  @override
  String get featureLayout => 'چیدمان واکنش‌گرا';

  @override
  String get featureLayoutDesc => 'تطبیق موبایل/دسکتاپ';

  @override
  String get techStack => 'پشته فناوری';

  @override
  String get linksTitle => 'لینک‌ها';

  @override
  String get githubRepo => 'مخزن GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter رسمی';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'مجوز';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'ساخته شده با ❤️ با Flutter';

  @override
  String get loading => 'در حال بارگذاری...';

  @override
  String get error => 'خطا';

  @override
  String get success => 'موفقیت';

  @override
  String get ok => 'تأیید';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';

  @override
  String get defaultFolder => 'Default';

  @override
  String get detailFailed =>
      'Failed to load details, please check your network';

  @override
  String get tip => 'Tip';

  @override
  String get checkingUpdate => 'Checking for updates...';

  @override
  String get alreadyLatest => 'Already the latest version';

  @override
  String get close => 'Close';

  @override
  String get original => 'Original';

  @override
  String get translated => 'Translated';

  @override
  String get latestVersionLabel => 'Latest Version';

  @override
  String get publishTime => 'Published';

  @override
  String get dependencyNum => 'Dependencies';

  @override
  String get colorBlue => 'Blue';

  @override
  String get colorIndigo => 'Indigo';

  @override
  String get colorPurple => 'Purple';

  @override
  String get colorDeepPurple => 'Deep Purple';

  @override
  String get colorTeal => 'Teal';

  @override
  String get colorGreen => 'Green';

  @override
  String get colorOrange => 'Orange';

  @override
  String get colorRed => 'Red';

  @override
  String get colorPink => 'Pink';

  @override
  String get colorBrown => 'Brown';

  @override
  String get configured => 'Configured';

  @override
  String get notConfigured => 'Not Configured';

  @override
  String get modelLabel => 'Model';

  @override
  String get targetLangLabel => 'Target Language';

  @override
  String get targetLangHint => '简体中文 / English / 日本語';

  @override
  String get translateApiHint =>
      'Supports all OpenAI compatible APIs (OpenAI, DeepSeek, Moonshot, etc.)';

  @override
  String get pubOfficial => 'Official (pub.dev)';

  @override
  String get tuna => 'Tsinghua TUNA';

  @override
  String get sjtu => 'SJTU';

  @override
  String get flutterChina => 'Flutter China';

  @override
  String get mirrorNoSearch =>
      'Current mirror does not support search, please switch to a supported source';

  @override
  String get mirrorSearchNotSupported => 'Search not supported';

  @override
  String get mirrorSearchSupported => 'Search supported';

  @override
  String get addCustomMirror => 'Add Custom Mirror';

  @override
  String get deleteMirror => 'Delete Mirror';

  @override
  String deleteMirrorConfirm(Object url) {
    return 'Delete \"$url\"?';
  }
}
