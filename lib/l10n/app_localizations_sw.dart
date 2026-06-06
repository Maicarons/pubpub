// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Kivinjari cha kioo cha Pub cha majukwaa mengi';

  @override
  String get navSearch => 'Tafuta';

  @override
  String get navFavorites => 'Vipendwa';

  @override
  String get navSettings => 'Mipangilio';

  @override
  String get searchHint => 'Tafuta pakiti za Flutter/Dart...';

  @override
  String get searchFailed => 'Utafutaji umeshindikana, angalia mtandao wako';

  @override
  String get searchEmpty => 'Tafuta pakiti za Flutter/Dart unazohitaji';

  @override
  String get searchNoResults => 'Hakuna pakiti zilizopatikana';

  @override
  String get hotRecommend => 'Mapendekezo maarufu';

  @override
  String get retry => 'Jaribu tena';

  @override
  String get install => 'Sakinisha';

  @override
  String get terminal => 'Kituo';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Inapakia README...';

  @override
  String get about => 'Kuhusu';

  @override
  String get topics => 'Mada';

  @override
  String get details => 'Maelezo';

  @override
  String get language => 'Lugha';

  @override
  String get selectLanguage => 'Chagua lugha';

  @override
  String get languageSystem => 'Mfumo';

  @override
  String get checkUpdate => 'Angalia masasisho';

  @override
  String get autoTranslate => 'Tafsiri otomatiki';

  @override
  String get autoTranslateDesc => 'Tafsiri kupitia API inayolingana na OpenAI';

  @override
  String get latestVersion => 'Mpya zaidi';

  @override
  String get publishDate => 'Iliyochapishwa';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Utegemezi';

  @override
  String get links => 'Viungo';

  @override
  String get homepage => 'Ukurasa wa nyumbani';

  @override
  String get repository => 'Hifadhi';

  @override
  String get dependencies => 'Utegemezi';

  @override
  String get noDependencies => 'Hakuna utegemezi wa moja kwa moja';

  @override
  String get versionHistory => 'Historia ya toleo';

  @override
  String moreVersions(int count) {
    return 'Toleo $count za zamani...';
  }

  @override
  String get latest => 'mpya zaidi';

  @override
  String get copied => 'Imenakiliwa';

  @override
  String get copiedToClipboard => 'Imenakiliwa kwenye ubao wa kunakili';

  @override
  String get favoritesFolders => 'Folda';

  @override
  String get noFavorites => 'Hakuna vipendwa bado';

  @override
  String get noFavoritesHint =>
      'Gusa ikoni ya moyo kwenye matokeo ya utafutaji ili uongeze kwenye vipendwa';

  @override
  String emptyFolder(String name) {
    return '\"$name\" haina vipendwa';
  }

  @override
  String get createFolder => 'Folda mpya';

  @override
  String get folderName => 'Jina la folda';

  @override
  String get create => 'Unda';

  @override
  String get rename => 'Badilisha jina';

  @override
  String get delete => 'Futa';

  @override
  String get renameFolder => 'Badilisha jina la folda';

  @override
  String get deleteFolder => 'Futa folda';

  @override
  String deleteFolderConfirm(String name) {
    return 'Futa \"$name\"? Pakiti zake zitafutwa.';
  }

  @override
  String get cancel => 'Ghairi';

  @override
  String get confirm => 'Thibitisha';

  @override
  String get folderExists => 'Folda tayari ipo';

  @override
  String removeFromFolder(String folder) {
    return 'Ondoa kutoka \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Ondoa kutoka vipendwa';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Ondoa \"$name\" kutoka vipendwa?';
  }

  @override
  String get addToOtherFolders => 'Ongeza kwenye folda zingine';

  @override
  String get selectFolder => 'Chagua folda';

  @override
  String get createAndAdd => 'Unda na uongeze';

  @override
  String favoriteManaged(String folders) {
    return 'Imehifadhiwa katika: $folders';
  }

  @override
  String get cancelAllFavorites => 'Ondoa kutoka zote';

  @override
  String get pubMirror => 'Kioo cha Pub';

  @override
  String get pubMirrorHint =>
      'Badilisha chanzo kipya cha kioo cha kutafuta pakiti';

  @override
  String get githubMirror => 'Kioo cha GitHub';

  @override
  String get githubRawMirror => 'Kioo cha GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Kwa kupata README za pakiti, inapendekezwa kutumia kioo nchini China';

  @override
  String get appearance => 'Mwonekano';

  @override
  String get theme => 'Mandhari';

  @override
  String get themeSystem => 'Mfumo';

  @override
  String get themeLight => 'Nuru';

  @override
  String get themeDark => 'Giza';

  @override
  String get selectTheme => 'Chagua mandhari';

  @override
  String get themeColor => 'Rangi ya mandhari';

  @override
  String get data => 'Data';

  @override
  String get clearCache => 'Futa kashe';

  @override
  String get clearCacheSubtitle => 'Futa data yote ya kashe ya API';

  @override
  String get clearCacheTitle => 'Futa kashe';

  @override
  String get clearCacheConfirm =>
      'Futa kashe yote ya API? Vipendwa na mipangilio havitafutwa.';

  @override
  String get cacheCleared => 'Kashe imefutwa';

  @override
  String get aboutPubPub => 'Kuhusu PubPub';

  @override
  String version(String version) {
    return 'Toleo $version';
  }

  @override
  String get aboutTitle => 'Kuhusu';

  @override
  String get aboutDescription =>
      'Kivinjari cha kioo cha Pub cha majukwaa mengi';

  @override
  String get features => 'Vipengele';

  @override
  String get featureSearch => 'Utafutaji wa pakiti';

  @override
  String get featureSearchDesc => 'Tafuta kupitia vioo vingi vya Pub';

  @override
  String get featureDetail => 'Maelezo ya pakiti';

  @override
  String get featureDetailDesc => 'Toleo, utegemezi, onyesho kamili la README';

  @override
  String get featureFavorites => 'Mikusanyiko maalum';

  @override
  String get featureFavoritesDesc => 'Unda folda nyingi za kupanga';

  @override
  String get featureTheme => 'Kubinafsisha mandhari';

  @override
  String get featureThemeDesc => 'Rangi 10 za mandhari + hali ya giza';

  @override
  String get featureLayout => 'Mpangilio wa kubadilika';

  @override
  String get featureLayoutDesc => 'Kubadilika kwa simu/desktop';

  @override
  String get techStack => 'Msururu wa teknolojia';

  @override
  String get linksTitle => 'Viungo';

  @override
  String get githubRepo => 'Hifadhi ya GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Rasmi';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Leseni';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Imetengenezwa kwa ❤️ kwa kutumia Flutter';

  @override
  String get loading => 'Inapakia...';

  @override
  String get error => 'Hitilafu';

  @override
  String get success => 'Mafanikio';

  @override
  String get ok => 'Sawa';

  @override
  String get yes => 'Ndiyo';

  @override
  String get no => 'Hapana';

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
