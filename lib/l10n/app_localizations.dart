import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'PubPub'**
  String get appTitle;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Cross-platform Pub mirror browser'**
  String get appDescription;

  /// No description provided for @navSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get navSearch;

  /// No description provided for @navFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get navFavorites;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Flutter/Dart packages...'**
  String get searchHint;

  /// No description provided for @searchFailed.
  ///
  /// In en, this message translates to:
  /// **'Search failed, please check your network'**
  String get searchFailed;

  /// No description provided for @searchEmpty.
  ///
  /// In en, this message translates to:
  /// **'Search for Flutter/Dart packages you need'**
  String get searchEmpty;

  /// No description provided for @searchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No packages found'**
  String get searchNoResults;

  /// No description provided for @hotRecommend.
  ///
  /// In en, this message translates to:
  /// **'Hot Recommendations'**
  String get hotRecommend;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @install.
  ///
  /// In en, this message translates to:
  /// **'Install'**
  String get install;

  /// No description provided for @terminal.
  ///
  /// In en, this message translates to:
  /// **'Terminal'**
  String get terminal;

  /// No description provided for @readme.
  ///
  /// In en, this message translates to:
  /// **'README'**
  String get readme;

  /// No description provided for @loadingReadme.
  ///
  /// In en, this message translates to:
  /// **'Loading README...'**
  String get loadingReadme;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @topics.
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get topics;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @latestVersion.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get latestVersion;

  /// No description provided for @publishDate.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get publishDate;

  /// No description provided for @dartSdk.
  ///
  /// In en, this message translates to:
  /// **'Dart SDK'**
  String get dartSdk;

  /// No description provided for @flutterSdk.
  ///
  /// In en, this message translates to:
  /// **'Flutter SDK'**
  String get flutterSdk;

  /// No description provided for @dependencyCount.
  ///
  /// In en, this message translates to:
  /// **'Dependencies'**
  String get dependencyCount;

  /// No description provided for @links.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get links;

  /// No description provided for @homepage.
  ///
  /// In en, this message translates to:
  /// **'Homepage'**
  String get homepage;

  /// No description provided for @repository.
  ///
  /// In en, this message translates to:
  /// **'Repository'**
  String get repository;

  /// No description provided for @dependencies.
  ///
  /// In en, this message translates to:
  /// **'Dependencies'**
  String get dependencies;

  /// No description provided for @noDependencies.
  ///
  /// In en, this message translates to:
  /// **'No direct dependencies'**
  String get noDependencies;

  /// No description provided for @versionHistory.
  ///
  /// In en, this message translates to:
  /// **'Version History'**
  String get versionHistory;

  /// No description provided for @moreVersions.
  ///
  /// In en, this message translates to:
  /// **'{count} more historical versions...'**
  String moreVersions(int count);

  /// No description provided for @latest.
  ///
  /// In en, this message translates to:
  /// **'latest'**
  String get latest;

  /// No description provided for @copied.
  ///
  /// In en, this message translates to:
  /// **'Copied'**
  String get copied;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Code copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @favoritesFolders.
  ///
  /// In en, this message translates to:
  /// **'Folders'**
  String get favoritesFolders;

  /// No description provided for @noFavorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get noFavorites;

  /// No description provided for @noFavoritesHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the heart icon in search results to favorite'**
  String get noFavoritesHint;

  /// No description provided for @emptyFolder.
  ///
  /// In en, this message translates to:
  /// **'\"{name}\" has no favorites'**
  String emptyFolder(String name);

  /// No description provided for @createFolder.
  ///
  /// In en, this message translates to:
  /// **'New Folder'**
  String get createFolder;

  /// No description provided for @folderName.
  ///
  /// In en, this message translates to:
  /// **'Folder name'**
  String get folderName;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @rename.
  ///
  /// In en, this message translates to:
  /// **'Rename'**
  String get rename;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @renameFolder.
  ///
  /// In en, this message translates to:
  /// **'Rename Folder'**
  String get renameFolder;

  /// No description provided for @deleteFolder.
  ///
  /// In en, this message translates to:
  /// **'Delete Folder'**
  String get deleteFolder;

  /// No description provided for @deleteFolderConfirm.
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"? Packages in it will be removed.'**
  String deleteFolderConfirm(String name);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @folderExists.
  ///
  /// In en, this message translates to:
  /// **'Folder already exists'**
  String get folderExists;

  /// No description provided for @removeFromFolder.
  ///
  /// In en, this message translates to:
  /// **'Remove from \"{folder}\"?'**
  String removeFromFolder(String folder);

  /// No description provided for @removeFavorite.
  ///
  /// In en, this message translates to:
  /// **'Remove favorite'**
  String get removeFavorite;

  /// No description provided for @removeFavoriteConfirm.
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\" from favorites?'**
  String removeFavoriteConfirm(String name);

  /// No description provided for @addToOtherFolders.
  ///
  /// In en, this message translates to:
  /// **'Add to other folders'**
  String get addToOtherFolders;

  /// No description provided for @selectFolder.
  ///
  /// In en, this message translates to:
  /// **'Select Folder'**
  String get selectFolder;

  /// No description provided for @createAndAdd.
  ///
  /// In en, this message translates to:
  /// **'Create & Add'**
  String get createAndAdd;

  /// No description provided for @favoriteManaged.
  ///
  /// In en, this message translates to:
  /// **'Saved in: {folders}'**
  String favoriteManaged(String folders);

  /// No description provided for @cancelAllFavorites.
  ///
  /// In en, this message translates to:
  /// **'Remove from all'**
  String get cancelAllFavorites;

  /// No description provided for @pubMirror.
  ///
  /// In en, this message translates to:
  /// **'Pub Mirror'**
  String get pubMirror;

  /// No description provided for @pubMirrorHint.
  ///
  /// In en, this message translates to:
  /// **'Switch to a new mirror source for searching packages'**
  String get pubMirrorHint;

  /// No description provided for @githubMirror.
  ///
  /// In en, this message translates to:
  /// **'GitHub Mirror'**
  String get githubMirror;

  /// No description provided for @githubRawMirror.
  ///
  /// In en, this message translates to:
  /// **'GitHub Raw Mirror'**
  String get githubRawMirror;

  /// No description provided for @githubMirrorHint.
  ///
  /// In en, this message translates to:
  /// **'Used for fetching package README, recommended to use mirror in China'**
  String get githubMirrorHint;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @selectTheme.
  ///
  /// In en, this message translates to:
  /// **'Select Theme'**
  String get selectTheme;

  /// No description provided for @themeColor.
  ///
  /// In en, this message translates to:
  /// **'Theme Color'**
  String get themeColor;

  /// No description provided for @data.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get data;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @clearCacheSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all API cache data'**
  String get clearCacheSubtitle;

  /// No description provided for @clearCacheTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCacheTitle;

  /// No description provided for @clearCacheConfirm.
  ///
  /// In en, this message translates to:
  /// **'Clear all API cache? Favorites and settings will not be cleared.'**
  String get clearCacheConfirm;

  /// No description provided for @cacheCleared.
  ///
  /// In en, this message translates to:
  /// **'Cache cleared'**
  String get cacheCleared;

  /// No description provided for @aboutPubPub.
  ///
  /// In en, this message translates to:
  /// **'About PubPub'**
  String get aboutPubPub;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String version(String version);

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Cross-platform Pub mirror browser'**
  String get aboutDescription;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @featureSearch.
  ///
  /// In en, this message translates to:
  /// **'Package Search'**
  String get featureSearch;

  /// No description provided for @featureSearchDesc.
  ///
  /// In en, this message translates to:
  /// **'Search via multiple Pub mirrors'**
  String get featureSearchDesc;

  /// No description provided for @featureDetail.
  ///
  /// In en, this message translates to:
  /// **'Package Details'**
  String get featureDetail;

  /// No description provided for @featureDetailDesc.
  ///
  /// In en, this message translates to:
  /// **'Version, dependencies, README full display'**
  String get featureDetailDesc;

  /// No description provided for @featureFavorites.
  ///
  /// In en, this message translates to:
  /// **'Custom Collections'**
  String get featureFavorites;

  /// No description provided for @featureFavoritesDesc.
  ///
  /// In en, this message translates to:
  /// **'Create multiple folders to organize'**
  String get featureFavoritesDesc;

  /// No description provided for @featureTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme Customization'**
  String get featureTheme;

  /// No description provided for @featureThemeDesc.
  ///
  /// In en, this message translates to:
  /// **'10 theme colors + dark mode'**
  String get featureThemeDesc;

  /// No description provided for @featureLayout.
  ///
  /// In en, this message translates to:
  /// **'Responsive Layout'**
  String get featureLayout;

  /// No description provided for @featureLayoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Mobile/Desktop adaptive'**
  String get featureLayoutDesc;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'Tech Stack'**
  String get techStack;

  /// No description provided for @linksTitle.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get linksTitle;

  /// No description provided for @githubRepo.
  ///
  /// In en, this message translates to:
  /// **'GitHub Repository'**
  String get githubRepo;

  /// No description provided for @pubDev.
  ///
  /// In en, this message translates to:
  /// **'pub.dev'**
  String get pubDev;

  /// No description provided for @flutterOfficial.
  ///
  /// In en, this message translates to:
  /// **'Flutter Official'**
  String get flutterOfficial;

  /// No description provided for @tdesign.
  ///
  /// In en, this message translates to:
  /// **'TDesign Flutter'**
  String get tdesign;

  /// No description provided for @license.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// No description provided for @licenseApache.
  ///
  /// In en, this message translates to:
  /// **'Apache License 2.0'**
  String get licenseApache;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'Copyright © 2026 PubPub Contributors'**
  String get copyright;

  /// No description provided for @madeWith.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤️ using Flutter'**
  String get madeWith;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
