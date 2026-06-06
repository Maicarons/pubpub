// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Navegador de espejos Pub multiplataforma';

  @override
  String get navSearch => 'Buscar';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navSettings => 'Configuración';

  @override
  String get searchHint => 'Buscar paquetes Flutter/Dart...';

  @override
  String get searchFailed => 'Búsqueda fallida, verifique su red';

  @override
  String get searchEmpty => 'Busque los paquetes Flutter/Dart que necesita';

  @override
  String get searchNoResults => 'No se encontraron paquetes';

  @override
  String get hotRecommend => 'Recomendaciones populares';

  @override
  String get retry => 'Reintentar';

  @override
  String get install => 'Instalar';

  @override
  String get terminal => 'Terminal';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Cargando README...';

  @override
  String get about => 'Acerca de';

  @override
  String get topics => 'Temas';

  @override
  String get details => 'Detalles';

  @override
  String get language => 'Idioma';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get languageSystem => 'Sistema';

  @override
  String get checkUpdate => 'Buscar actualizaciones';

  @override
  String get autoTranslate => 'Traducción automática';

  @override
  String get autoTranslateDesc => 'Traducción con API compatible con OpenAI';

  @override
  String get latestVersion => 'Último';

  @override
  String get publishDate => 'Publicado';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Dependencias';

  @override
  String get links => 'Enlaces';

  @override
  String get homepage => 'Página principal';

  @override
  String get repository => 'Repositorio';

  @override
  String get dependencies => 'Dependencias';

  @override
  String get noDependencies => 'Sin dependencias directas';

  @override
  String get versionHistory => 'Historial de versiones';

  @override
  String moreVersions(int count) {
    return '$count versiones anteriores...';
  }

  @override
  String get latest => 'último';

  @override
  String get copied => 'Copiado';

  @override
  String get copiedToClipboard => 'Código copiado al portapapeles';

  @override
  String get favoritesFolders => 'Carpetas';

  @override
  String get noFavorites => 'Aún no hay favoritos';

  @override
  String get noFavoritesHint =>
      'Toque el icono de corazón en los resultados para agregar a favoritos';

  @override
  String emptyFolder(String name) {
    return '\"$name\" no tiene favoritos';
  }

  @override
  String get createFolder => 'Nueva carpeta';

  @override
  String get folderName => 'Nombre de la carpeta';

  @override
  String get create => 'Crear';

  @override
  String get rename => 'Renombrar';

  @override
  String get delete => 'Eliminar';

  @override
  String get renameFolder => 'Renombrar carpeta';

  @override
  String get deleteFolder => 'Eliminar carpeta';

  @override
  String deleteFolderConfirm(String name) {
    return '¿Eliminar \"$name\"? Los paquetes en ella serán eliminados.';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get confirm => 'Confirmar';

  @override
  String get folderExists => 'La carpeta ya existe';

  @override
  String removeFromFolder(String folder) {
    return '¿Eliminar de \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Eliminar favorito';

  @override
  String removeFavoriteConfirm(String name) {
    return '¿Eliminar \"$name\" de favoritos?';
  }

  @override
  String get addToOtherFolders => 'Agregar a otras carpetas';

  @override
  String get selectFolder => 'Seleccionar carpeta';

  @override
  String get createAndAdd => 'Crear y agregar';

  @override
  String favoriteManaged(String folders) {
    return 'Guardado en: $folders';
  }

  @override
  String get cancelAllFavorites => 'Eliminar de todos';

  @override
  String get pubMirror => 'Espejo Pub';

  @override
  String get pubMirrorHint =>
      'Cambiar a una nueva fuente de espejo para buscar paquetes';

  @override
  String get githubMirror => 'Espejo GitHub';

  @override
  String get githubRawMirror => 'Espejo GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Para obtener README de paquetes, se recomienda usar espejo en China';

  @override
  String get appearance => 'Apariencia';

  @override
  String get theme => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get selectTheme => 'Seleccionar tema';

  @override
  String get themeColor => 'Color del tema';

  @override
  String get data => 'Datos';

  @override
  String get clearCache => 'Limpiar caché';

  @override
  String get clearCacheSubtitle => 'Limpiar todos los datos de caché API';

  @override
  String get clearCacheTitle => 'Limpiar caché';

  @override
  String get clearCacheConfirm =>
      '¿Limpiar toda la caché API? Los favoritos y configuraciones no se eliminarán.';

  @override
  String get cacheCleared => 'Caché limpiada';

  @override
  String get aboutPubPub => 'Acerca de PubPub';

  @override
  String version(String version) {
    return 'Versión $version';
  }

  @override
  String get aboutTitle => 'Acerca de';

  @override
  String get aboutDescription => 'Navegador de espejos Pub multiplataforma';

  @override
  String get features => 'Características';

  @override
  String get featureSearch => 'Búsqueda de paquetes';

  @override
  String get featureSearchDesc => 'Búsqueda a través de múltiples espejos Pub';

  @override
  String get featureDetail => 'Detalles del paquete';

  @override
  String get featureDetailDesc =>
      'Versión, dependencias, visualización completa del README';

  @override
  String get featureFavorites => 'Colecciones personalizadas';

  @override
  String get featureFavoritesDesc => 'Crear múltiples carpetas para organizar';

  @override
  String get featureTheme => 'Personalización de tema';

  @override
  String get featureThemeDesc => '10 colores de tema + modo oscuro';

  @override
  String get featureLayout => 'Diseño responsivo';

  @override
  String get featureLayoutDesc => 'Adaptación móvil/escritorio';

  @override
  String get techStack => 'Stack tecnológico';

  @override
  String get linksTitle => 'Enlaces';

  @override
  String get githubRepo => 'Repositorio GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter Oficial';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Licencia';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Hecho con ❤️ usando Flutter';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get success => 'Éxito';

  @override
  String get ok => 'Aceptar';

  @override
  String get yes => 'Sí';

  @override
  String get no => 'No';
}
