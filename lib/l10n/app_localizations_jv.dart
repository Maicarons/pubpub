// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Javanese (`jv`).
class AppLocalizationsJv extends AppLocalizations {
  AppLocalizationsJv([String locale = 'jv']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Browser cermin Pub lintas platform';

  @override
  String get navSearch => 'Goleki';

  @override
  String get navFavorites => 'Kesayangan';

  @override
  String get navSettings => 'Setelan';

  @override
  String get searchHint => 'Goleki paket Flutter/Dart...';

  @override
  String get searchFailed => 'Golek gagal, priksa jaringan sampeyan';

  @override
  String get searchEmpty => 'Goleki paket Flutter/Dart sing dibutuhake';

  @override
  String get searchNoResults => 'Ora ana paket sing ditemokake';

  @override
  String get hotRecommend => 'Rekomendasi populer';

  @override
  String get retry => 'Coba maneh';

  @override
  String get install => 'Instal';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README lagi dimuat...';

  @override
  String get about => 'Babagan';

  @override
  String get topics => 'Topik';

  @override
  String get details => 'Rincian';

  @override
  String get language => 'Basa';

  @override
  String get selectLanguage => 'Pilih basa';

  @override
  String get languageSystem => 'Sistem';

  @override
  String get checkUpdate => 'Priksa pembaruan';

  @override
  String get autoTranslate => 'Terjemahan otomatis';

  @override
  String get autoTranslateDesc =>
      'Terjemahan liwat API sing kompatibel karo OpenAI';

  @override
  String get latestVersion => 'Paling anyar';

  @override
  String get publishDate => 'Diterbitake';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Katergantungan';

  @override
  String get links => 'Tautan';

  @override
  String get homepage => 'Kaca ngarep';

  @override
  String get repository => 'Repositori';

  @override
  String get dependencies => 'Katergantungan';

  @override
  String get noDependencies => 'Ora ana katergantungan langsung';

  @override
  String get versionHistory => 'Riwayat versi';

  @override
  String moreVersions(int count) {
    return '$count versi sadurunge...';
  }

  @override
  String get latest => 'paling anyar';

  @override
  String get copied => 'Disalin';

  @override
  String get copiedToClipboard => 'Kode disalin menyang clipboard';

  @override
  String get favoritesFolders => 'Folder';

  @override
  String get noFavorites => 'Durung ana kesayangan';

  @override
  String get noFavoritesHint =>
      'Tutul ikon ati ing asil golekan kanggo nambah kesayangan';

  @override
  String emptyFolder(String name) {
    return '\"$name\" ora ana kesayangan';
  }

  @override
  String get createFolder => 'Folder anyar';

  @override
  String get folderName => 'Jeneng folder';

  @override
  String get create => 'Gawe';

  @override
  String get rename => 'Ganti jeneng';

  @override
  String get delete => 'Busak';

  @override
  String get renameFolder => 'Ganti jeneng folder';

  @override
  String get deleteFolder => 'Busak folder';

  @override
  String deleteFolderConfirm(String name) {
    return 'Busak \"$name\"? Paket ing njero bakal dibusak.';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get confirm => 'Konfirmasi';

  @override
  String get folderExists => 'Folder wis ana';

  @override
  String removeFromFolder(String folder) {
    return 'Busak saka \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Busak saka kesayangan';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Busak \"$name\" saka kesayangan?';
  }

  @override
  String get addToOtherFolders => 'Tambahake menyang folder liyane';

  @override
  String get selectFolder => 'Pilih folder';

  @override
  String get createAndAdd => 'Gawe lan tambahake';

  @override
  String favoriteManaged(String folders) {
    return 'Disimpen ing: $folders';
  }

  @override
  String get cancelAllFavorites => 'Busak saka kabeh';

  @override
  String get pubMirror => 'Cermin Pub';

  @override
  String get pubMirrorHint =>
      'Ganti menyang sumber cermin anyar kanggo golek paket';

  @override
  String get githubMirror => 'Cermin GitHub';

  @override
  String get githubRawMirror => 'Cermin GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Kanggo njupuk README paket, disaranake nggunakake cermin ing China';

  @override
  String get appearance => 'Tampilan';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Cerah';

  @override
  String get themeDark => 'Peteng';

  @override
  String get selectTheme => 'Pilih tema';

  @override
  String get themeColor => 'Warna tema';

  @override
  String get data => 'Data';

  @override
  String get clearCache => 'Resiki cache';

  @override
  String get clearCacheSubtitle => 'Resiki kabeh data cache API';

  @override
  String get clearCacheTitle => 'Resiki cache';

  @override
  String get clearCacheConfirm =>
      'Resiki kabeh cache API? Kesayangan lan setelan ora bakal dibusak.';

  @override
  String get cacheCleared => 'Cache diresiki';

  @override
  String get aboutPubPub => 'Babagan PubPub';

  @override
  String version(String version) {
    return 'Versi $version';
  }

  @override
  String get aboutTitle => 'Babagan';

  @override
  String get aboutDescription => 'Browser cermin Pub lintas platform';

  @override
  String get features => 'Fitur';

  @override
  String get featureSearch => 'Golek paket';

  @override
  String get featureSearchDesc => 'Golek liwat pirang-pirang cermin Pub';

  @override
  String get featureDetail => 'Rincian paket';

  @override
  String get featureDetailDesc =>
      'Versi, katergantungan, tampilan README lengkap';

  @override
  String get featureFavorites => 'Koleksi khusus';

  @override
  String get featureFavoritesDesc => 'Gawe pirang-pirang folder kanggo ngatur';

  @override
  String get featureTheme => 'Kustomisasi tema';

  @override
  String get featureThemeDesc => '10 warna tema + mode peteng';

  @override
  String get featureLayout => 'Tata letak responsif';

  @override
  String get featureLayoutDesc => 'Adaptasi mobile/desktop';

  @override
  String get techStack => 'Stack teknologi';

  @override
  String get linksTitle => 'Tautan';

  @override
  String get githubRepo => 'Repositori GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Resmi';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Lisensi';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Digawe karo ❤️ nggunakake Flutter';

  @override
  String get loading => 'Dimuat...';

  @override
  String get error => 'Galat';

  @override
  String get success => 'Sukses';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Ya';

  @override
  String get no => 'Ora';

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
