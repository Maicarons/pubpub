// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Cross-platform Pub mirror browser';

  @override
  String get navSearch => 'Search';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navSettings => 'Settings';

  @override
  String get searchHint => 'Search Flutter/Dart packages...';

  @override
  String get searchFailed => 'Search failed, please check your network';

  @override
  String get searchEmpty => 'Search for Flutter/Dart packages you need';

  @override
  String get searchNoResults => 'No packages found';

  @override
  String get hotRecommend => 'Hot Recommendations';

  @override
  String get retry => 'Retry';

  @override
  String get install => 'Install';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Loading README...';

  @override
  String get about => 'About';

  @override
  String get topics => 'Topics';

  @override
  String get details => 'Details';

  @override
  String get language => 'Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get languageSystem => 'System';

  @override
  String get checkUpdate => 'Check for Updates';

  @override
  String get autoTranslate => 'Auto Translate';

  @override
  String get autoTranslateDesc => 'OpenAI compatible API translation';

  @override
  String get latestVersion => 'Latest';

  @override
  String get publishDate => 'Published';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Dependencies';

  @override
  String get links => 'Links';

  @override
  String get homepage => 'Homepage';

  @override
  String get repository => 'Repository';

  @override
  String get dependencies => 'Dependencies';

  @override
  String get noDependencies => 'No direct dependencies';

  @override
  String get versionHistory => 'Version History';

  @override
  String moreVersions(int count) {
    return '$count more historical versions...';
  }

  @override
  String get latest => 'latest';

  @override
  String get copied => 'Copied';

  @override
  String get copiedToClipboard => 'Code copied to clipboard';

  @override
  String get favoritesFolders => 'Folders';

  @override
  String get noFavorites => 'No favorites yet';

  @override
  String get noFavoritesHint =>
      'Tap the heart icon in search results to favorite';

  @override
  String emptyFolder(String name) {
    return '\"$name\" has no favorites';
  }

  @override
  String get createFolder => 'New Folder';

  @override
  String get folderName => 'Folder name';

  @override
  String get create => 'Create';

  @override
  String get rename => 'Rename';

  @override
  String get delete => 'Delete';

  @override
  String get renameFolder => 'Rename Folder';

  @override
  String get deleteFolder => 'Delete Folder';

  @override
  String deleteFolderConfirm(String name) {
    return 'Delete \"$name\"? Packages in it will be removed.';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get folderExists => 'Folder already exists';

  @override
  String removeFromFolder(String folder) {
    return 'Remove from \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Remove favorite';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Remove \"$name\" from favorites?';
  }

  @override
  String get addToOtherFolders => 'Add to other folders';

  @override
  String get selectFolder => 'Select Folder';

  @override
  String get createAndAdd => 'Create & Add';

  @override
  String favoriteManaged(String folders) {
    return 'Saved in: $folders';
  }

  @override
  String get cancelAllFavorites => 'Remove from all';

  @override
  String get pubMirror => 'Pub Mirror';

  @override
  String get pubMirrorHint =>
      'Switch to a new mirror source for searching packages';

  @override
  String get githubMirror => 'GitHub Mirror';

  @override
  String get githubRawMirror => 'GitHub Raw Mirror';

  @override
  String get githubMirrorHint =>
      'Used for fetching package README, recommended to use mirror in China';

  @override
  String get appearance => 'Appearance';

  @override
  String get theme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get selectTheme => 'Select Theme';

  @override
  String get themeColor => 'Theme Color';

  @override
  String get data => 'Data';

  @override
  String get clearCache => 'Clear Cache';

  @override
  String get clearCacheSubtitle => 'Clear all API cache data';

  @override
  String get clearCacheTitle => 'Clear Cache';

  @override
  String get clearCacheConfirm =>
      'Clear all API cache? Favorites and settings will not be cleared.';

  @override
  String get cacheCleared => 'Cache cleared';

  @override
  String get aboutPubPub => 'About PubPub';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTitle => 'About';

  @override
  String get aboutDescription => 'Cross-platform Pub mirror browser';

  @override
  String get features => 'Features';

  @override
  String get featureSearch => 'Package Search';

  @override
  String get featureSearchDesc => 'Search via multiple Pub mirrors';

  @override
  String get featureDetail => 'Package Details';

  @override
  String get featureDetailDesc => 'Version, dependencies, README full display';

  @override
  String get featureFavorites => 'Custom Collections';

  @override
  String get featureFavoritesDesc => 'Create multiple folders to organize';

  @override
  String get featureTheme => 'Theme Customization';

  @override
  String get featureThemeDesc => '10 theme colors + dark mode';

  @override
  String get featureLayout => 'Responsive Layout';

  @override
  String get featureLayoutDesc => 'Mobile/Desktop adaptive';

  @override
  String get techStack => 'Tech Stack';

  @override
  String get linksTitle => 'Links';

  @override
  String get githubRepo => 'GitHub Repository';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Official';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'License';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Made with ❤️ using Flutter';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

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
}
