// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'متصفح مرايا Pub متعدد المنصات';

  @override
  String get navSearch => 'بحث';

  @override
  String get navFavorites => 'المفضلة';

  @override
  String get navSettings => 'الإعدادات';

  @override
  String get searchHint => 'البحث عن حزم Flutter/Dart...';

  @override
  String get searchFailed => 'فشل البحث، تحقق من شبكتك';

  @override
  String get searchEmpty => 'ابحث عن حزم Flutter/Dart التي تحتاجها';

  @override
  String get searchNoResults => 'لم يتم العثور على حزم';

  @override
  String get hotRecommend => 'توصيات شائعة';

  @override
  String get retry => 'إعادة المحاولة';

  @override
  String get install => 'تثبيت';

  @override
  String get terminal => 'الطرفية';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'جاري تحميل README...';

  @override
  String get about => 'حول';

  @override
  String get topics => 'المواضيع';

  @override
  String get details => 'التفاصيل';

  @override
  String get language => 'اللغة';

  @override
  String get selectLanguage => 'اختر اللغة';

  @override
  String get languageSystem => 'النظام';

  @override
  String get checkUpdate => 'التحقق من التحديثات';

  @override
  String get autoTranslate => 'ترجمة تلقائية';

  @override
  String get autoTranslateDesc => 'ترجمة عبر API متوافقة مع OpenAI';

  @override
  String get latestVersion => 'الأحدث';

  @override
  String get publishDate => 'تاريخ النشر';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'التبعيات';

  @override
  String get links => 'الروابط';

  @override
  String get homepage => 'الصفحة الرئيسية';

  @override
  String get repository => 'المستودع';

  @override
  String get dependencies => 'التبعيات';

  @override
  String get noDependencies => 'لا تبعيات مباشرة';

  @override
  String get versionHistory => 'سجل الإصدارات';

  @override
  String moreVersions(int count) {
    return '$count إصدارات سابقة...';
  }

  @override
  String get latest => 'الأحدث';

  @override
  String get copied => 'تم النسخ';

  @override
  String get copiedToClipboard => 'تم نسخ الكود إلى الحافظة';

  @override
  String get favoritesFolders => 'المجلدات';

  @override
  String get noFavorites => 'لا توجد مفضلات بعد';

  @override
  String get noFavoritesHint => 'اضغط على أيقونة القلب في نتائج البحث للمفضلة';

  @override
  String emptyFolder(String name) {
    return '\"$name\" لا توجد مفضلات';
  }

  @override
  String get createFolder => 'مجلد جديد';

  @override
  String get folderName => 'اسم المجلد';

  @override
  String get create => 'إنشاء';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get delete => 'حذف';

  @override
  String get renameFolder => 'إعادة تسمية المجلد';

  @override
  String get deleteFolder => 'حذف المجلد';

  @override
  String deleteFolderConfirm(String name) {
    return 'حذف \"$name\"؟ ستتم إزالة الحزم الموجودة فيه.';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get confirm => 'تأكيد';

  @override
  String get folderExists => 'المجلد موجود بالفعل';

  @override
  String removeFromFolder(String folder) {
    return 'إزالة من \"$folder\"؟';
  }

  @override
  String get removeFavorite => 'إزالة من المفضلة';

  @override
  String removeFavoriteConfirm(String name) {
    return 'إزالة \"$name\" من المفضلة؟';
  }

  @override
  String get addToOtherFolders => 'إضافة إلى مجلدات أخرى';

  @override
  String get selectFolder => 'اختر المجلد';

  @override
  String get createAndAdd => 'إنشاء وإضافة';

  @override
  String favoriteManaged(String folders) {
    return 'محفوظ في: $folders';
  }

  @override
  String get cancelAllFavorites => 'إزالة من الكل';

  @override
  String get pubMirror => 'مرآة Pub';

  @override
  String get pubMirrorHint => 'التبديل إلى مصدر مرآة جديد للبحث عن الحزم';

  @override
  String get githubMirror => 'مرآة GitHub';

  @override
  String get githubRawMirror => 'مرآة GitHub Raw';

  @override
  String get githubMirrorHint =>
      'لجلب README الحزم، يُوصى باستخدام المرآة في الصين';

  @override
  String get appearance => 'المظهر';

  @override
  String get theme => 'السمة';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get selectTheme => 'اختر السمة';

  @override
  String get themeColor => 'لون السمة';

  @override
  String get data => 'البيانات';

  @override
  String get clearCache => 'مسح ذاكرة التخزين المؤقت';

  @override
  String get clearCacheSubtitle => 'مسح جميع بيانات ذاكرة التخزين المؤقت';

  @override
  String get clearCacheTitle => 'مسح ذاكرة التخزين المؤقت';

  @override
  String get clearCacheConfirm =>
      'مسح جميع ذاكرة التخزين المؤقت؟ لن يتم حذف المفضلة والإعدادات.';

  @override
  String get cacheCleared => 'تم مسح ذاكرة التخزين المؤقت';

  @override
  String get aboutPubPub => 'حول PubPub';

  @override
  String version(String version) {
    return 'الإصدار $version';
  }

  @override
  String get aboutTitle => 'حول';

  @override
  String get aboutDescription => 'متصفح مرايا Pub متعدد المنصات';

  @override
  String get features => 'الميزات';

  @override
  String get featureSearch => 'البحث عن الحزم';

  @override
  String get featureSearchDesc => 'البحث عبر مرايا Pub متعددة';

  @override
  String get featureDetail => 'تفاصيل الحزمة';

  @override
  String get featureDetailDesc => 'الإصدار، التبعيات، عرض README كامل';

  @override
  String get featureFavorites => 'مجموعات مخصصة';

  @override
  String get featureFavoritesDesc => 'إنشاء مجلدات متعددة للتنظيم';

  @override
  String get featureTheme => 'تخصيص السمة';

  @override
  String get featureThemeDesc => '10 ألوان سمة + الوضع الداكن';

  @override
  String get featureLayout => 'تصميم متجاوب';

  @override
  String get featureLayoutDesc => 'تكيف الجوال/سطح المكتب';

  @override
  String get techStack => 'التقنيات المستخدمة';

  @override
  String get linksTitle => 'الروابط';

  @override
  String get githubRepo => 'مستودع GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter الرسمي';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'الترخيص';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'حقوق النشر © 2026 PubPub Contributors';

  @override
  String get madeWith => 'صنع بـ ❤️ باستخدام Flutter';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get error => 'خطأ';

  @override
  String get success => 'نجاح';

  @override
  String get ok => 'موافق';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

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
  String get njtech => 'Nanjing Tech';

  @override
  String get cernet => 'CERNET';

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
