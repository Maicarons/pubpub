// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Navigateur de miroirs Pub multiplateforme';

  @override
  String get navSearch => 'Rechercher';

  @override
  String get navFavorites => 'Favoris';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get searchHint => 'Rechercher des packages Flutter/Dart...';

  @override
  String get searchFailed => 'Échec de la recherche, vérifiez votre réseau';

  @override
  String get searchEmpty =>
      'Recherchez les packages Flutter/Dart dont vous avez besoin';

  @override
  String get searchNoResults => 'Aucun package trouvé';

  @override
  String get hotRecommend => 'Recommandations populaires';

  @override
  String get retry => 'Réessayer';

  @override
  String get install => 'Installer';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Chargement du README...';

  @override
  String get about => 'À propos';

  @override
  String get topics => 'Sujets';

  @override
  String get details => 'Détails';

  @override
  String get language => 'Langue';

  @override
  String get selectLanguage => 'Sélectionner la langue';

  @override
  String get languageSystem => 'Système';

  @override
  String get checkUpdate => 'Vérifier les mises à jour';

  @override
  String get autoTranslate => 'Traduction automatique';

  @override
  String get autoTranslateDesc => 'Traduction via API compatible OpenAI';

  @override
  String get latestVersion => 'Dernière';

  @override
  String get publishDate => 'Publié';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Dépendances';

  @override
  String get links => 'Liens';

  @override
  String get homepage => 'Page d\'accueil';

  @override
  String get repository => 'Dépôt';

  @override
  String get dependencies => 'Dépendances';

  @override
  String get noDependencies => 'Aucune dépendance directe';

  @override
  String get versionHistory => 'Historique des versions';

  @override
  String moreVersions(int count) {
    return '$count versions précédentes...';
  }

  @override
  String get latest => 'dernière';

  @override
  String get copied => 'Copié';

  @override
  String get copiedToClipboard => 'Code copié dans le presse-papiers';

  @override
  String get favoritesFolders => 'Dossiers';

  @override
  String get noFavorites => 'Pas encore de favoris';

  @override
  String get noFavoritesHint =>
      'Appuyez sur l\'icône cœur dans les résultats pour ajouter aux favoris';

  @override
  String emptyFolder(String name) {
    return '\"$name\" n\'a pas de favoris';
  }

  @override
  String get createFolder => 'Nouveau dossier';

  @override
  String get folderName => 'Nom du dossier';

  @override
  String get create => 'Créer';

  @override
  String get rename => 'Renommer';

  @override
  String get delete => 'Supprimer';

  @override
  String get renameFolder => 'Renommer le dossier';

  @override
  String get deleteFolder => 'Supprimer le dossier';

  @override
  String deleteFolderConfirm(String name) {
    return 'Supprimer \"$name\" ? Les packages qu\'il contient seront supprimés.';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get folderExists => 'Le dossier existe déjà';

  @override
  String removeFromFolder(String folder) {
    return 'Retirer de \"$folder\" ?';
  }

  @override
  String get removeFavorite => 'Retirer des favoris';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Retirer \"$name\" des favoris ?';
  }

  @override
  String get addToOtherFolders => 'Ajouter à d\'autres dossiers';

  @override
  String get selectFolder => 'Sélectionner un dossier';

  @override
  String get createAndAdd => 'Créer et ajouter';

  @override
  String favoriteManaged(String folders) {
    return 'Enregistré dans : $folders';
  }

  @override
  String get cancelAllFavorites => 'Retirer de tous';

  @override
  String get pubMirror => 'Miroir Pub';

  @override
  String get pubMirrorHint =>
      'Changer de source miroir pour la recherche de packages';

  @override
  String get githubMirror => 'Miroir GitHub';

  @override
  String get githubRawMirror => 'Miroir GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Pour obtenir les README des packages, utiliser un miroir en Chine recommandé';

  @override
  String get appearance => 'Apparence';

  @override
  String get theme => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get selectTheme => 'Sélectionner le thème';

  @override
  String get themeColor => 'Couleur du thème';

  @override
  String get data => 'Données';

  @override
  String get clearCache => 'Vider le cache';

  @override
  String get clearCacheSubtitle => 'Supprimer toutes les données du cache API';

  @override
  String get clearCacheTitle => 'Vider le cache';

  @override
  String get clearCacheConfirm =>
      'Vider tout le cache API ? Les favoris et paramètres ne seront pas supprimés.';

  @override
  String get cacheCleared => 'Cache vidé';

  @override
  String get aboutPubPub => 'À propos de PubPub';

  @override
  String version(String version) {
    return 'Version $version';
  }

  @override
  String get aboutTitle => 'À propos';

  @override
  String get aboutDescription => 'Navigateur de miroirs Pub multiplateforme';

  @override
  String get features => 'Fonctionnalités';

  @override
  String get featureSearch => 'Recherche de packages';

  @override
  String get featureSearchDesc => 'Recherche via plusieurs miroirs Pub';

  @override
  String get featureDetail => 'Détails du package';

  @override
  String get featureDetailDesc =>
      'Version, dépendances, affichage complet du README';

  @override
  String get featureFavorites => 'Collections personnalisées';

  @override
  String get featureFavoritesDesc => 'Créez plusieurs dossiers pour organiser';

  @override
  String get featureTheme => 'Personnalisation du thème';

  @override
  String get featureThemeDesc => '10 couleurs de thème + mode sombre';

  @override
  String get featureLayout => 'Mise en page responsive';

  @override
  String get featureLayoutDesc => 'Adaptation mobile/ordinateur';

  @override
  String get techStack => 'Stack technologique';

  @override
  String get linksTitle => 'Liens';

  @override
  String get githubRepo => 'Dépôt GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Officiel';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Licence';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Fait avec ❤️ avec Flutter';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Erreur';

  @override
  String get success => 'Succès';

  @override
  String get ok => 'OK';

  @override
  String get yes => 'Oui';

  @override
  String get no => 'Non';
}
