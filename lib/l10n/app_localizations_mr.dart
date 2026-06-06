// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'क्रॉस-प्लॅटफॉर्म Pub मिरर ब्राउझर';

  @override
  String get navSearch => 'शोधा';

  @override
  String get navFavorites => 'आवडते';

  @override
  String get navSettings => 'सेटिंग्ज';

  @override
  String get searchHint => 'Flutter/Dart पॅकेज शोधा...';

  @override
  String get searchFailed => 'शोध अयशस्वी, आपले नेटवर्क तपासा';

  @override
  String get searchEmpty => 'तुम्हाला आवश्यक असलेले Flutter/Dart पॅकेज शोधा';

  @override
  String get searchNoResults => 'कोणतेही पॅकेज सापडले नाही';

  @override
  String get hotRecommend => 'लोकप्रिय शिफारसी';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get install => 'स्थापित करा';

  @override
  String get terminal => 'टर्मिनल';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README लोड होत आहे...';

  @override
  String get about => 'बद्दल';

  @override
  String get topics => 'विषय';

  @override
  String get details => 'तपशील';

  @override
  String get language => 'भाषा';

  @override
  String get selectLanguage => 'भाषा निवडा';

  @override
  String get languageSystem => 'सिस्टम';

  @override
  String get checkUpdate => 'अपडेट तपासा';

  @override
  String get autoTranslate => 'स्वयंचलित भाषांतर';

  @override
  String get autoTranslateDesc => 'OpenAI सुसंगत API भाषांतर';

  @override
  String get latestVersion => 'नवीनतम';

  @override
  String get publishDate => 'प्रकाशित';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'अवलंबित्व';

  @override
  String get links => 'लिंक्स';

  @override
  String get homepage => 'मुख्यपृष्ठ';

  @override
  String get repository => 'रेपॉझिटरी';

  @override
  String get dependencies => 'अवलंबित्व';

  @override
  String get noDependencies => 'थेट अवलंबित्व नाही';

  @override
  String get versionHistory => 'आवृत्ती इतिहास';

  @override
  String moreVersions(int count) {
    return '$count जुन्या आवृत्त्या...';
  }

  @override
  String get latest => 'नवीनतम';

  @override
  String get copied => 'कॉपी केले';

  @override
  String get copiedToClipboard => 'कोड क्लिपबोर्डवर कॉपी केला';

  @override
  String get favoritesFolders => 'फोल्डर';

  @override
  String get noFavorites => 'अजून आवडते नाही';

  @override
  String get noFavoritesHint =>
      'आवडते मध्ये जोडण्यासाठी शोध परिणामांमध्ये हार्ट आयकॉनवर टॅप करा';

  @override
  String emptyFolder(String name) {
    return '\"$name\" मध्ये आवडते नाही';
  }

  @override
  String get createFolder => 'नवीन फोल्डर';

  @override
  String get folderName => 'फोल्डर नाव';

  @override
  String get create => 'तयार करा';

  @override
  String get rename => 'नाव बदला';

  @override
  String get delete => 'हटवा';

  @override
  String get renameFolder => 'फोल्डर नाव बदला';

  @override
  String get deleteFolder => 'फोल्डर हटवा';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" हटवायचे? त्यातील पॅकेज काढली जातील.';
  }

  @override
  String get cancel => 'रद्द करा';

  @override
  String get confirm => 'पुष्टी करा';

  @override
  String get folderExists => 'फोल्डर आधीपासून अस्तित्वात आहे';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" मधून काढायचे?';
  }

  @override
  String get removeFavorite => 'आवडते मधून काढा';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" आवडते मधून काढायचे?';
  }

  @override
  String get addToOtherFolders => 'इतर फोल्डरमध्ये जोडा';

  @override
  String get selectFolder => 'फोल्डर निवडा';

  @override
  String get createAndAdd => 'तयार करा आणि जोडा';

  @override
  String favoriteManaged(String folders) {
    return 'साठवले: $folders';
  }

  @override
  String get cancelAllFavorites => 'सर्वांमधून काढा';

  @override
  String get pubMirror => 'Pub मिरर';

  @override
  String get pubMirrorHint =>
      'पॅकेज शोधण्यासाठी नवीन मिरर स्त्रोतावर स्विच करा';

  @override
  String get githubMirror => 'GitHub मिरर';

  @override
  String get githubRawMirror => 'GitHub Raw मिरर';

  @override
  String get githubMirrorHint =>
      'पॅकेज README मिळवण्यासाठी, चीनमध्ये मिरर वापरण्याची शिफारस';

  @override
  String get appearance => 'दिसावट';

  @override
  String get theme => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'उजळ';

  @override
  String get themeDark => 'गडद';

  @override
  String get selectTheme => 'थीम निवडा';

  @override
  String get themeColor => 'थीम रंग';

  @override
  String get data => 'डेटा';

  @override
  String get clearCache => 'कॅशे साफ करा';

  @override
  String get clearCacheSubtitle => 'सर्व API कॅशे डेटा साफ करा';

  @override
  String get clearCacheTitle => 'कॅशे साफ करा';

  @override
  String get clearCacheConfirm =>
      'सर्व API कॅशे साफ करायचे? आवडते आणि सेटिंग्ज हटवल्या जाणार नाहीत.';

  @override
  String get cacheCleared => 'कॅशे साफ केले';

  @override
  String get aboutPubPub => 'PubPub बद्दल';

  @override
  String version(String version) {
    return 'आवृत्ती $version';
  }

  @override
  String get aboutTitle => 'बद्दल';

  @override
  String get aboutDescription => 'क्रॉस-प्लॅटफॉर्म Pub मिरर ब्राउझर';

  @override
  String get features => 'वैशिष्ट्ये';

  @override
  String get featureSearch => 'पॅकेज शोध';

  @override
  String get featureSearchDesc => 'अनेक Pub मिररद्वारे शोधा';

  @override
  String get featureDetail => 'पॅकेज तपशील';

  @override
  String get featureDetailDesc => 'आवृत्ती, अवलंबित्व, README संपूर्ण प्रदर्शन';

  @override
  String get featureFavorites => 'सानुकूल संग्रह';

  @override
  String get featureFavoritesDesc =>
      'व्यवस्थित करण्यासाठी अनेक फोल्डर तयार करा';

  @override
  String get featureTheme => 'थीम सानुकूलन';

  @override
  String get featureThemeDesc => '10 थीम रंग + डार्क मोड';

  @override
  String get featureLayout => 'रेस्पॉन्सिव्ह लेआउट';

  @override
  String get featureLayoutDesc => 'मोबाइल/डेस्कटॉप अनुकूल';

  @override
  String get techStack => 'टेक स्टॅक';

  @override
  String get linksTitle => 'लिंक्स';

  @override
  String get githubRepo => 'GitHub रेपॉझिटरी';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter अधिकृत';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'परवाना';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter वापरून ❤️ ने बनवले';

  @override
  String get loading => 'लोड होत आहे...';

  @override
  String get error => 'त्रुटी';

  @override
  String get success => 'यशस्वी';

  @override
  String get ok => 'ठीक आहे';

  @override
  String get yes => 'हो';

  @override
  String get no => 'नाही';

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
