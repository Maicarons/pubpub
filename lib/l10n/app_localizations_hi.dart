// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'क्रॉस-प्लेटफॉर्म Pub मिरर ब्राउज़र';

  @override
  String get navSearch => 'खोजें';

  @override
  String get navFavorites => 'पसंदीदा';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get searchHint => 'Flutter/Dart पैकेज खोजें...';

  @override
  String get searchFailed => 'खोज विफल, अपना नेटवर्क जांचें';

  @override
  String get searchEmpty => 'अपने जरूरी Flutter/Dart पैकेज खोजें';

  @override
  String get searchNoResults => 'कोई पैकेज नहीं मिला';

  @override
  String get hotRecommend => 'लोकप्रिय सिफारिशें';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get install => 'इंस्टॉल करें';

  @override
  String get terminal => 'टर्मिनल';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README लोड हो रहा है...';

  @override
  String get about => 'के बारे में';

  @override
  String get topics => 'विषय';

  @override
  String get details => 'विवरण';

  @override
  String get language => 'भाषा';

  @override
  String get selectLanguage => 'भाषा चुनें';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get checkUpdate => 'अपडेट जांचें';

  @override
  String get autoTranslate => 'स्वचालित अनुवाद';

  @override
  String get autoTranslateDesc => 'OpenAI संगत API अनुवाद';

  @override
  String get latestVersion => 'नवीनतम';

  @override
  String get publishDate => 'प्रकाशित';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'निर्भरताएं';

  @override
  String get links => 'लिंक';

  @override
  String get homepage => 'होमपेज';

  @override
  String get repository => 'रिपॉजिटरी';

  @override
  String get dependencies => 'निर्भरताएं';

  @override
  String get noDependencies => 'कोई प्रत्यक्ष निर्भरता नहीं';

  @override
  String get versionHistory => 'संस्करण इतिहास';

  @override
  String moreVersions(int count) {
    return '$count पुराने संस्करण...';
  }

  @override
  String get latest => 'नवीनतम';

  @override
  String get copied => 'कॉपी किया गया';

  @override
  String get copiedToClipboard => 'कोड क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get favoritesFolders => 'फ़ोल्डर';

  @override
  String get noFavorites => 'अभी तक कोई पसंदीदा नहीं';

  @override
  String get noFavoritesHint =>
      'पसंदीदा में जोड़ने के लिए खोज परिणामों में हार्ट आइकन टैप करें';

  @override
  String emptyFolder(String name) {
    return '\"$name\" में कोई पसंदीदा नहीं';
  }

  @override
  String get createFolder => 'नया फ़ोल्डर';

  @override
  String get folderName => 'फ़ोल्डर का नाम';

  @override
  String get create => 'बनाएं';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get delete => 'हटाएं';

  @override
  String get renameFolder => 'फ़ोल्डर का नाम बदलें';

  @override
  String get deleteFolder => 'फ़ोल्डर हटाएं';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" हटाएं? इसमें शामिल पैकेज हटा दिए जाएंगे।';
  }

  @override
  String get cancel => 'रद्द करें';

  @override
  String get confirm => 'पुष्टि करें';

  @override
  String get folderExists => 'फ़ोल्डर पहले से मौजूद है';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" से हटाएं?';
  }

  @override
  String get removeFavorite => 'पसंदीदा हटाएं';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" को पसंदीदा से हटाएं?';
  }

  @override
  String get addToOtherFolders => 'अन्य फ़ोल्डर में जोड़ें';

  @override
  String get selectFolder => 'फ़ोल्डर चुनें';

  @override
  String get createAndAdd => 'बनाएं और जोड़ें';

  @override
  String favoriteManaged(String folders) {
    return 'सहेजा गया: $folders';
  }

  @override
  String get cancelAllFavorites => 'सभी से हटाएं';

  @override
  String get pubMirror => 'Pub मिरर';

  @override
  String get pubMirrorHint => 'पैकेज खोजने के लिए नए मिरर सोर्स पर स्विच करें';

  @override
  String get githubMirror => 'GitHub मिरर';

  @override
  String get githubRawMirror => 'GitHub Raw मिरर';

  @override
  String get githubMirrorHint =>
      'पैकेज README प्राप्त करने के लिए, चीन में मिरर उपयोग करने की सिफारिश';

  @override
  String get appearance => 'दिखावट';

  @override
  String get theme => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get selectTheme => 'थीम चुनें';

  @override
  String get themeColor => 'थीम रंग';

  @override
  String get data => 'डेटा';

  @override
  String get clearCache => 'कैश साफ़ करें';

  @override
  String get clearCacheSubtitle => 'सभी API कैश डेटा साफ़ करें';

  @override
  String get clearCacheTitle => 'कैश साफ़ करें';

  @override
  String get clearCacheConfirm =>
      'सभी API कैश साफ़ करें? पसंदीदा और सेटिंग्स साफ़ नहीं होंगी।';

  @override
  String get cacheCleared => 'कैश साफ़ किया गया';

  @override
  String get aboutPubPub => 'PubPub के बारे में';

  @override
  String version(String version) {
    return 'संस्करण $version';
  }

  @override
  String get aboutTitle => 'के बारे में';

  @override
  String get aboutDescription => 'क्रॉस-प्लेटफॉर्म Pub मिरर ब्राउज़र';

  @override
  String get features => 'विशेषताएं';

  @override
  String get featureSearch => 'पैकेज खोज';

  @override
  String get featureSearchDesc => 'कई Pub मिरर के माध्यम से खोजें';

  @override
  String get featureDetail => 'पैकेज विवरण';

  @override
  String get featureDetailDesc => 'संस्करण, निर्भरताएं, README पूर्ण प्रदर्शन';

  @override
  String get featureFavorites => 'कस्टम संग्रह';

  @override
  String get featureFavoritesDesc => 'व्यवस्थित करने के लिए कई फ़ोल्डर बनाएं';

  @override
  String get featureTheme => 'थीम अनुकूलन';

  @override
  String get featureThemeDesc => '10 थीम रंग + डार्क मोड';

  @override
  String get featureLayout => 'रिस्पॉन्सिव लेआउट';

  @override
  String get featureLayoutDesc => 'मोबाइल/डेस्कटॉप अनुकूली';

  @override
  String get techStack => 'टेक स्टैक';

  @override
  String get linksTitle => 'लिंक';

  @override
  String get githubRepo => 'GitHub रिपॉजिटरी';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter आधिकारिक';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'लाइसेंस';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter के साथ ❤️ से बनाया गया';

  @override
  String get loading => 'लोड हो रहा है...';

  @override
  String get error => 'त्रुटि';

  @override
  String get success => 'सफल';

  @override
  String get ok => 'ठीक है';

  @override
  String get yes => 'हाँ';

  @override
  String get no => 'नहीं';

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
}
