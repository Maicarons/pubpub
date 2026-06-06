// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Browser di mirror Pub multipiattaforma';

  @override
  String get navSearch => 'Cerca';

  @override
  String get navFavorites => 'Preferiti';

  @override
  String get navSettings => 'Impostazioni';

  @override
  String get searchHint => 'Cerca pacchetti Flutter/Dart...';

  @override
  String get searchFailed => 'Ricerca fallita, controlla la rete';

  @override
  String get searchEmpty => 'Cerca i pacchetti Flutter/Dart di cui hai bisogno';

  @override
  String get searchNoResults => 'Nessun pacchetto trovato';

  @override
  String get hotRecommend => 'Raccomandazioni popolari';

  @override
  String get retry => 'Riprova';

  @override
  String get install => 'Installa';

  @override
  String get terminal => 'Terminale';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Caricamento README...';

  @override
  String get about => 'Informazioni';

  @override
  String get topics => 'Argomenti';

  @override
  String get details => 'Dettagli';

  @override
  String get language => 'Lingua';

  @override
  String get selectLanguage => 'Seleziona lingua';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get checkUpdate => 'Controlla aggiornamenti';

  @override
  String get autoTranslate => 'Traduzione automatica';

  @override
  String get autoTranslateDesc =>
      'Traduzione tramite API compatibile con OpenAI';

  @override
  String get latestVersion => 'Ultima';

  @override
  String get publishDate => 'Pubblicato';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Dipendenze';

  @override
  String get links => 'Link';

  @override
  String get homepage => 'Pagina iniziale';

  @override
  String get repository => 'Repository';

  @override
  String get dependencies => 'Dipendenze';

  @override
  String get noDependencies => 'Nessuna dipendenza diretta';

  @override
  String get versionHistory => 'Cronologia versioni';

  @override
  String moreVersions(int count) {
    return '$count versioni precedenti...';
  }

  @override
  String get latest => 'ultima';

  @override
  String get copied => 'Copiato';

  @override
  String get copiedToClipboard => 'Codice copiato negli appunti';

  @override
  String get favoritesFolders => 'Cartelle';

  @override
  String get noFavorites => 'Nessun preferito ancora';

  @override
  String get noFavoritesHint =>
      'Tocca l\'icona del cuore nei risultati per aggiungere ai preferiti';

  @override
  String emptyFolder(String name) {
    return '\"$name\" non ha preferiti';
  }

  @override
  String get createFolder => 'Nuova cartella';

  @override
  String get folderName => 'Nome cartella';

  @override
  String get create => 'Crea';

  @override
  String get rename => 'Rinomina';

  @override
  String get delete => 'Elimina';

  @override
  String get renameFolder => 'Rinomina cartella';

  @override
  String get deleteFolder => 'Elimina cartella';

  @override
  String deleteFolderConfirm(String name) {
    return 'Eliminare \"$name\"? I pacchetti al suo interno verranno rimossi.';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get confirm => 'Conferma';

  @override
  String get folderExists => 'La cartella esiste già';

  @override
  String removeFromFolder(String folder) {
    return 'Rimuovere da \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Rimuovi dai preferiti';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Rimuovere \"$name\" dai preferiti?';
  }

  @override
  String get addToOtherFolders => 'Aggiungi ad altre cartelle';

  @override
  String get selectFolder => 'Seleziona cartella';

  @override
  String get createAndAdd => 'Crea e aggiungi';

  @override
  String favoriteManaged(String folders) {
    return 'Salvato in: $folders';
  }

  @override
  String get cancelAllFavorites => 'Rimuovi da tutti';

  @override
  String get pubMirror => 'Mirror Pub';

  @override
  String get pubMirrorHint =>
      'Passa a una nuova fonte mirror per la ricerca pacchetti';

  @override
  String get githubMirror => 'Mirror GitHub';

  @override
  String get githubRawMirror => 'Mirror GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Per ottenere README dei pacchetti, si consiglia di usare il mirror in Cina';

  @override
  String get appearance => 'Aspetto';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get selectTheme => 'Seleziona tema';

  @override
  String get themeColor => 'Colore tema';

  @override
  String get data => 'Dati';

  @override
  String get clearCache => 'Svuota cache';

  @override
  String get clearCacheSubtitle => 'Svuota tutti i dati della cache API';

  @override
  String get clearCacheTitle => 'Svuota cache';

  @override
  String get clearCacheConfirm =>
      'Svuotare tutta la cache API? Preferiti e impostazioni non verranno eliminati.';

  @override
  String get cacheCleared => 'Cache svuotata';

  @override
  String get aboutPubPub => 'Informazioni su PubPub';

  @override
  String version(String version) {
    return 'Versione $version';
  }

  @override
  String get aboutTitle => 'Informazioni';

  @override
  String get aboutDescription => 'Browser di mirror Pub multipiattaforma';

  @override
  String get features => 'Funzionalità';

  @override
  String get featureSearch => 'Ricerca pacchetti';

  @override
  String get featureSearchDesc => 'Ricerca tramite più mirror Pub';

  @override
  String get featureDetail => 'Dettagli pacchetto';

  @override
  String get featureDetailDesc =>
      'Versione, dipendenze, visualizzazione completa README';

  @override
  String get featureFavorites => 'Collezioni personalizzate';

  @override
  String get featureFavoritesDesc => 'Crea più cartelle per organizzare';

  @override
  String get featureTheme => 'Personalizzazione tema';

  @override
  String get featureThemeDesc => '10 colori tema + modalità scura';

  @override
  String get featureLayout => 'Layout responsivo';

  @override
  String get featureLayoutDesc => 'Adattamento mobile/desktop';

  @override
  String get techStack => 'Stack tecnologico';

  @override
  String get linksTitle => 'Link';

  @override
  String get githubRepo => 'Repository GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Ufficiale';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Licenza';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Fatto con ❤️ con Flutter';

  @override
  String get loading => 'Caricamento...';

  @override
  String get error => 'Errore';

  @override
  String get success => 'Successo';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Sì';

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

  @override
  String get mirrorNoSearch =>
      'Current mirror does not support search, please switch to a supported source';

  @override
  String get mirrorSearchNotSupported => 'Search not supported';

  @override
  String get mirrorSearchSupported => 'Search supported';
}
