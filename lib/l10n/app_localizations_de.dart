// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Plattformübergreifender Pub-Mirror-Browser';

  @override
  String get navSearch => 'Suchen';

  @override
  String get navFavorites => 'Favoriten';

  @override
  String get navSettings => 'Einstellungen';

  @override
  String get searchHint => 'Flutter/Dart-Pakete suchen...';

  @override
  String get searchFailed => 'Suche fehlgeschlagen, Netzwerk prüfen';

  @override
  String get searchEmpty => 'Suchen Sie nach benötigten Flutter/Dart-Paketen';

  @override
  String get searchNoResults => 'Keine Pakete gefunden';

  @override
  String get hotRecommend => 'Beliebte Empfehlungen';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get install => 'Installieren';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'README wird geladen...';

  @override
  String get about => 'Über';

  @override
  String get topics => 'Themen';

  @override
  String get details => 'Details';

  @override
  String get language => 'Sprache';

  @override
  String get selectLanguage => 'Sprache auswählen';

  @override
  String get languageSystem => 'System';

  @override
  String get checkUpdate => 'Nach Updates suchen';

  @override
  String get autoTranslate => 'Automatische Übersetzung';

  @override
  String get autoTranslateDesc => 'Übersetzung über OpenAI-kompatible API';

  @override
  String get latestVersion => 'Neueste';

  @override
  String get publishDate => 'Veröffentlicht';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Abhängigkeiten';

  @override
  String get links => 'Links';

  @override
  String get homepage => 'Startseite';

  @override
  String get repository => 'Repository';

  @override
  String get dependencies => 'Abhängigkeiten';

  @override
  String get noDependencies => 'Keine direkten Abhängigkeiten';

  @override
  String get versionHistory => 'Versionshistorie';

  @override
  String moreVersions(int count) {
    return '$count ältere Versionen...';
  }

  @override
  String get latest => 'neueste';

  @override
  String get copied => 'Kopiert';

  @override
  String get copiedToClipboard => 'Code in Zwischenablage kopiert';

  @override
  String get favoritesFolders => 'Ordner';

  @override
  String get noFavorites => 'Noch keine Favoriten';

  @override
  String get noFavoritesHint =>
      'Tippen Sie auf das Herzsymbol in den Suchergebnissen zum Favorisieren';

  @override
  String emptyFolder(String name) {
    return '\"$name\" hat keine Favoriten';
  }

  @override
  String get createFolder => 'Neuer Ordner';

  @override
  String get folderName => 'Ordnername';

  @override
  String get create => 'Erstellen';

  @override
  String get rename => 'Umbenennen';

  @override
  String get delete => 'Löschen';

  @override
  String get renameFolder => 'Ordner umbenennen';

  @override
  String get deleteFolder => 'Ordner löschen';

  @override
  String deleteFolderConfirm(String name) {
    return '\"$name\" löschen? Die enthaltenen Pakete werden entfernt.';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get folderExists => 'Ordner existiert bereits';

  @override
  String removeFromFolder(String folder) {
    return 'Aus \"$folder\" entfernen?';
  }

  @override
  String get removeFavorite => 'Favorit entfernen';

  @override
  String removeFavoriteConfirm(String name) {
    return '\"$name\" aus Favoriten entfernen?';
  }

  @override
  String get addToOtherFolders => 'Zu anderen Ordnern hinzufügen';

  @override
  String get selectFolder => 'Ordner auswählen';

  @override
  String get createAndAdd => 'Erstellen & hinzufügen';

  @override
  String favoriteManaged(String folders) {
    return 'Gespeichert in: $folders';
  }

  @override
  String get cancelAllFavorites => 'Aus allen entfernen';

  @override
  String get pubMirror => 'Pub-Mirror';

  @override
  String get pubMirrorHint =>
      'Zu einer neuen Mirror-Quelle für die Paketsuche wechseln';

  @override
  String get githubMirror => 'GitHub-Mirror';

  @override
  String get githubRawMirror => 'GitHub Raw Mirror';

  @override
  String get githubMirrorHint =>
      'Für Paket-README, in China Mirror verwenden empfohlen';

  @override
  String get appearance => 'Erscheinungsbild';

  @override
  String get theme => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get selectTheme => 'Design auswählen';

  @override
  String get themeColor => 'Designfarbe';

  @override
  String get data => 'Daten';

  @override
  String get clearCache => 'Cache leeren';

  @override
  String get clearCacheSubtitle => 'Alle API-Cache-Daten löschen';

  @override
  String get clearCacheTitle => 'Cache leeren';

  @override
  String get clearCacheConfirm =>
      'Gesamten API-Cache leeren? Favoriten und Einstellungen werden nicht gelöscht.';

  @override
  String get cacheCleared => 'Cache geleert';

  @override
  String get aboutPubPub => 'Über PubPub';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTitle => 'Über';

  @override
  String get aboutDescription => 'Plattformübergreifender Pub-Mirror-Browser';

  @override
  String get features => 'Funktionen';

  @override
  String get featureSearch => 'Paketsuche';

  @override
  String get featureSearchDesc => 'Suche über mehrere Pub-Mirrors';

  @override
  String get featureDetail => 'Paketdetails';

  @override
  String get featureDetailDesc =>
      'Version, Abhängigkeiten, vollständige README-Anzeige';

  @override
  String get featureFavorites => 'Benutzerdefinierte Sammlungen';

  @override
  String get featureFavoritesDesc =>
      'Mehrere Ordner zur Organisation erstellen';

  @override
  String get featureTheme => 'Designanpassung';

  @override
  String get featureThemeDesc => '10 Designfarben + Dunkelmodus';

  @override
  String get featureLayout => 'Responsives Layout';

  @override
  String get featureLayoutDesc => 'Mobil-/Desktop-Anpassung';

  @override
  String get techStack => 'Technologie-Stack';

  @override
  String get linksTitle => 'Links';

  @override
  String get githubRepo => 'GitHub-Repository';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Offiziell';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Lizenz';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Mit ❤️ mit Flutter erstellt';

  @override
  String get loading => 'Wird geladen...';

  @override
  String get error => 'Fehler';

  @override
  String get success => 'Erfolg';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

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
