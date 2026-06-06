// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'ਕਰਾਸ-ਪਲੇਟਫਾਰਮ Pub ਮਿਰਰ ਬ੍ਰਾਊਜ਼ਰ';

  @override
  String get navSearch => 'ਖੋਜੋ';

  @override
  String get navFavorites => 'ਪਸੰਦੀਦਾ';

  @override
  String get navSettings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get searchHint => 'Flutter/Dart ਪੈਕੇਜ ਖੋਜੋ...';

  @override
  String get searchFailed => 'ਖੋਜ ਅਸਫਲ, ਆਪਣਾ ਨੈੱਟਵਰਕ ਜਾਂਚੋ';

  @override
  String get searchEmpty => 'ਆਪਣੀਆਂ ਲੋੜੀਂਦੀਆਂ Flutter/Dart ਪੈਕੇਜਾਂ ਖੋਜੋ';

  @override
  String get searchNoResults => 'ਕੋਈ ਪੈਕੇਜ ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String get hotRecommend => 'ਪ੍ਰਸਿੱਧ ਸਿਫਾਰਿਸ਼ਾਂ';

  @override
  String get retry => 'ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ';

  @override
  String get install => 'ਇੰਸਟਾਲ ਕਰੋ';

  @override
  String get terminal => 'ਟਰਮੀਨਲ';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get about => 'ਬਾਰੇ';

  @override
  String get topics => 'ਵਿਸ਼ੇ';

  @override
  String get details => 'ਵੇਰਵੇ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get selectLanguage => 'ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get languageSystem => 'ਸਿਸਟਮ';

  @override
  String get checkUpdate => 'ਅੱਪਡੇਟ ਜਾਂਚੋ';

  @override
  String get autoTranslate => 'ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦ';

  @override
  String get autoTranslateDesc => 'OpenAI ਅਨੁਕੂਲ API ਅਨੁਵਾਦ';

  @override
  String get latestVersion => 'ਨਵੀਨਤਮ';

  @override
  String get publishDate => 'ਪ੍ਰਕਾਸ਼ਿਤ';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'ਨਿਰਭਰਤਾਵਾਂ';

  @override
  String get links => 'ਲਿੰਕ';

  @override
  String get homepage => 'ਹੋਮਪੇਜ';

  @override
  String get repository => 'ਰਿਪੋਜ਼ਟਰੀ';

  @override
  String get dependencies => 'ਨਿਰਭਰਤਾਵਾਂ';

  @override
  String get noDependencies => 'ਕੋਈ ਸਿੱਧੀ ਨਿਰਭਰਤਾ ਨਹੀਂ';

  @override
  String get versionHistory => 'ਵਰਜਨ ਇਤਿਹਾਸ';

  @override
  String moreVersions(int count) {
    return '$count ਪੁਰਾਣੇ ਵਰਜਨ...';
  }

  @override
  String get latest => 'ਨਵੀਨਤਮ';

  @override
  String get copied => 'ਕਾਪੀ ਕੀਤਾ';

  @override
  String get copiedToClipboard => 'ਕੋਡ ਕਲਿੱਪਬੋਰਡ \'ਤੇ ਕਾਪੀ ਕੀਤਾ ਗਿਆ';

  @override
  String get favoritesFolders => 'ਫੋਲਡਰ';

  @override
  String get noFavorites => 'ਅਜੇ ਕੋਈ ਪਸੰਦੀਦਾ ਨਹੀਂ';

  @override
  String get noFavoritesHint =>
      'ਪਸੰਦੀਦਾ ਵਿੱਚ ਜੋੜਨ ਲਈ ਖੋਜ ਨਤੀਜਿਆਂ ਵਿੱਚ ਦਿਲ ਆਈਕਨ \'ਤੇ ਟੈਪ ਕਰੋ';

  @override
  String emptyFolder(String name) {
    return '\"$name\" ਵਿੱਚ ਕੋਈ ਪਸੰਦੀਦਾ ਨਹੀਂ';
  }

  @override
  String get createFolder => 'ਨਵਾਂ ਫੋਲਡਰ';

  @override
  String get folderName => 'ਫੋਲਡਰ ਦਾ ਨਾਮ';

  @override
  String get create => 'ਬਣਾਓ';

  @override
  String get rename => 'ਨਾਮ ਬਦਲੋ';

  @override
  String get delete => 'ਮਿਟਾਓ';

  @override
  String get renameFolder => 'ਫੋਲਡਰ ਦਾ ਨਾਮ ਬਦਲੋ';

  @override
  String get deleteFolder => 'ਫੋਲਡਰ ਮਿਟਾਓ';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" ਮਿਟਾਓ? ਇਸ ਵਿੱਚ ਸ਼ਾਮਲ ਪੈਕੇਜ ਹਟਾ ਦਿੱਤੇ ਜਾਣਗੇ।';
  }

  @override
  String get cancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get confirm => 'ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get folderExists => 'ਫੋਲਡਰ ਪਹਿਲਾਂ ਤੋਂ ਮੌਜੂਦ ਹੈ';

  @override
  String removeFromFolder(String folder) {
    return '\"$folder\" ਤੋਂ ਹਟਾਓ?';
  }

  @override
  String get removeFavorite => 'ਪਸੰਦੀਦਾ ਤੋਂ ਹਟਾਓ';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" ਨੂੰ ਪਸੰਦੀਦਾ ਤੋਂ ਹਟਾਓ?';
  }

  @override
  String get addToOtherFolders => 'ਹੋਰ ਫੋਲਡਰਾਂ ਵਿੱਚ ਜੋੜੋ';

  @override
  String get selectFolder => 'ਫੋਲਡਰ ਚੁਣੋ';

  @override
  String get createAndAdd => 'ਬਣਾਓ ਅਤੇ ਜੋੜੋ';

  @override
  String favoriteManaged(String folders) {
    return 'ਸੰਭਾਲਿਆ: $folders';
  }

  @override
  String get cancelAllFavorites => 'ਸਭ ਤੋਂ ਹਟਾਓ';

  @override
  String get pubMirror => 'Pub ਮਿਰਰ';

  @override
  String get pubMirrorHint => 'ਪੈਕੇਜ ਖੋਜ ਲਈ ਨਵੇਂ ਮਿਰਰ ਸਰੋਤ \'ਤੇ ਸਵਿੱਚ ਕਰੋ';

  @override
  String get githubMirror => 'GitHub ਮਿਰਰ';

  @override
  String get githubRawMirror => 'GitHub Raw ਮਿਰਰ';

  @override
  String get githubMirrorHint =>
      'ਪੈਕੇਜ README ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ, ਚੀਨ ਵਿੱਚ ਮਿਰਰ ਵਰਤਣ ਦੀ ਸਿਫਾਰਿਸ਼';

  @override
  String get appearance => 'ਦਿੱਖ';

  @override
  String get theme => 'ਥੀਮ';

  @override
  String get themeSystem => 'ਸਿਸਟਮ';

  @override
  String get themeLight => 'ਹਲਕਾ';

  @override
  String get themeDark => 'ਗੂੜ੍ਹਾ';

  @override
  String get selectTheme => 'ਥੀਮ ਚੁਣੋ';

  @override
  String get themeColor => 'ਥੀਮ ਰੰਗ';

  @override
  String get data => 'ਡਾਟਾ';

  @override
  String get clearCache => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearCacheSubtitle => 'ਸਾਰੇ API ਕੈਸ਼ ਡਾਟਾ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearCacheTitle => 'ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ';

  @override
  String get clearCacheConfirm =>
      'ਸਾਰਾ API ਕੈਸ਼ ਸਾਫ਼ ਕਰੋ? ਪਸੰਦੀਦਾ ਅਤੇ ਸੈਟਿੰਗਾਂ ਮਿਟਾਈਆਂ ਨਹੀਂ ਜਾਣਗੀਆਂ।';

  @override
  String get cacheCleared => 'ਕੈਸ਼ ਸਾਫ਼ ਕੀਤਾ ਗਿਆ';

  @override
  String get aboutPubPub => 'PubPub ਬਾਰੇ';

  @override
  String version(String version) {
    return 'ਵਰਜਨ $version';
  }

  @override
  String get aboutTitle => 'ਬਾਰੇ';

  @override
  String get aboutDescription => 'ਕਰਾਸ-ਪਲੇਟਫਾਰਮ Pub ਮਿਰਰ ਬ੍ਰਾਊਜ਼ਰ';

  @override
  String get features => 'ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ';

  @override
  String get featureSearch => 'ਪੈਕੇਜ ਖੋਜ';

  @override
  String get featureSearchDesc => 'ਕਈ Pub ਮਿਰਰਾਂ ਰਾਹੀਂ ਖੋਜੋ';

  @override
  String get featureDetail => 'ਪੈਕੇਜ ਵੇਰਵੇ';

  @override
  String get featureDetailDesc => 'ਵਰਜਨ, ਨਿਰਭਰਤਾਵਾਂ, README ਪੂਰਾ ਪ੍ਰਦਰਸ਼ਨ';

  @override
  String get featureFavorites => 'ਕਸਟਮ ਸੰਗ੍ਰਹਿ';

  @override
  String get featureFavoritesDesc => 'ਵਿਵਸਥਿਤ ਕਰਨ ਲਈ ਕਈ ਫੋਲਡਰ ਬਣਾਓ';

  @override
  String get featureTheme => 'ਥੀਮ ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ';

  @override
  String get featureThemeDesc => '10 ਥੀਮ ਰੰਗ + ਡਾਰਕ ਮੋਡ';

  @override
  String get featureLayout => 'ਰਸਪਾਂਸਿਵ ਲੇਆਉਟ';

  @override
  String get featureLayoutDesc => 'ਮੋਬਾਈਲ/ਡੈਸਕਟਾਪ ਅਨੁਕੂਲ';

  @override
  String get techStack => 'ਟੈਕ ਸਟੈਕ';

  @override
  String get linksTitle => 'ਲਿੰਕ';

  @override
  String get githubRepo => 'GitHub ਰਿਪੋਜ਼ਟਰੀ';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter ਅਧਿਕਾਰਿਕ';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'ਲਾਇਸੈਂਸ';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Flutter ਨਾਲ ❤️ ਨਾਲ ਬਣਾਇਆ';

  @override
  String get loading => 'ਲੋਡ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get error => 'ਗਲਤੀ';

  @override
  String get success => 'ਸਫਲ';

  @override
  String get ok => 'ਠੀਕ ਹੈ';

  @override
  String get yes => 'ਹਾਂ';

  @override
  String get no => 'ਨਹੀਂ';
}
