// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => 'Кроссплатформенный браузер зеркал Pub';

  @override
  String get navSearch => 'Поиск';

  @override
  String get navFavorites => 'Избранное';

  @override
  String get navSettings => 'Настройки';

  @override
  String get searchHint => 'Поиск пакетов Flutter/Dart...';

  @override
  String get searchFailed => 'Ошибка поиска, проверьте сеть';

  @override
  String get searchEmpty => 'Найдите нужные пакеты Flutter/Dart';

  @override
  String get searchNoResults => 'Пакеты не найдены';

  @override
  String get hotRecommend => 'Популярные рекомендации';

  @override
  String get retry => 'Повторить';

  @override
  String get install => 'Установить';

  @override
  String get terminal => 'Терминал';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => 'Загрузка README...';

  @override
  String get about => 'О приложении';

  @override
  String get topics => 'Темы';

  @override
  String get details => 'Подробности';

  @override
  String get language => 'Язык';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get languageSystem => 'Системный';

  @override
  String get checkUpdate => 'Проверить обновления';

  @override
  String get autoTranslate => 'Автоперевод';

  @override
  String get autoTranslateDesc => 'Перевод через API, совместимый с OpenAI';

  @override
  String get latestVersion => 'Последняя';

  @override
  String get publishDate => 'Опубликовано';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => 'Зависимости';

  @override
  String get links => 'Ссылки';

  @override
  String get homepage => 'Домашняя страница';

  @override
  String get repository => 'Репозиторий';

  @override
  String get dependencies => 'Зависимости';

  @override
  String get noDependencies => 'Нет прямых зависимостей';

  @override
  String get versionHistory => 'История версий';

  @override
  String moreVersions(int count) {
    return '$count предыдущих версий...';
  }

  @override
  String get latest => 'последняя';

  @override
  String get copied => 'Скопировано';

  @override
  String get copiedToClipboard => 'Код скопирован в буфер обмена';

  @override
  String get favoritesFolders => 'Папки';

  @override
  String get noFavorites => 'Пока нет избранного';

  @override
  String get noFavoritesHint =>
      'Нажмите на значок сердца в результатах поиска, чтобы добавить в избранное';

  @override
  String emptyFolder(String name) {
    return 'В \"$name\" нет избранного';
  }

  @override
  String get createFolder => 'Новая папка';

  @override
  String get folderName => 'Название папки';

  @override
  String get create => 'Создать';

  @override
  String get rename => 'Переименовать';

  @override
  String get delete => 'Удалить';

  @override
  String get renameFolder => 'Переименовать папку';

  @override
  String get deleteFolder => 'Удалить папку';

  @override
  String deleteFolderConfirm(String name) {
    return 'Удалить \"$name\"? Пакеты в ней будут удалены.';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get folderExists => 'Папка уже существует';

  @override
  String removeFromFolder(String folder) {
    return 'Удалить из \"$folder\"?';
  }

  @override
  String get removeFavorite => 'Удалить из избранного';

  @override
  String removeFavoriteConfirm(String name) {
    return 'Удалить \"$name\" из избранного?';
  }

  @override
  String get addToOtherFolders => 'Добавить в другие папки';

  @override
  String get selectFolder => 'Выберите папку';

  @override
  String get createAndAdd => 'Создать и добавить';

  @override
  String favoriteManaged(String folders) {
    return 'Сохранено в: $folders';
  }

  @override
  String get cancelAllFavorites => 'Удалить из всех';

  @override
  String get pubMirror => 'Зеркало Pub';

  @override
  String get pubMirrorHint =>
      'Переключиться на новое зеркало для поиска пакетов';

  @override
  String get githubMirror => 'Зеркало GitHub';

  @override
  String get githubRawMirror => 'Зеркало GitHub Raw';

  @override
  String get githubMirrorHint =>
      'Для получения README пакетов, рекомендуется использовать зеркало в Китае';

  @override
  String get appearance => 'Внешний вид';

  @override
  String get theme => 'Тема';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get selectTheme => 'Выберите тему';

  @override
  String get themeColor => 'Цвет темы';

  @override
  String get data => 'Данные';

  @override
  String get clearCache => 'Очистить кэш';

  @override
  String get clearCacheSubtitle => 'Очистить все данные кэша API';

  @override
  String get clearCacheTitle => 'Очистить кэш';

  @override
  String get clearCacheConfirm =>
      'Очистить весь кэш API? Избранное и настройки не будут удалены.';

  @override
  String get cacheCleared => 'Кэш очищен';

  @override
  String get aboutPubPub => 'О PubPub';

  @override
  String version(String version) {
    return 'Версия $version';
  }

  @override
  String get aboutTitle => 'О приложении';

  @override
  String get aboutDescription => 'Кроссплатформенный браузер зеркал Pub';

  @override
  String get features => 'Функции';

  @override
  String get featureSearch => 'Поиск пакетов';

  @override
  String get featureSearchDesc => 'Поиск через несколько зеркал Pub';

  @override
  String get featureDetail => 'Информация о пакете';

  @override
  String get featureDetailDesc =>
      'Версия, зависимости, полное отображение README';

  @override
  String get featureFavorites => 'Пользовательские коллекции';

  @override
  String get featureFavoritesDesc =>
      'Создавайте несколько папок для организации';

  @override
  String get featureTheme => 'Настройка темы';

  @override
  String get featureThemeDesc => '10 цветов темы + тёмный режим';

  @override
  String get featureLayout => 'Адаптивный дизайн';

  @override
  String get featureLayoutDesc =>
      'Адаптация для мобильных/десктопных устройств';

  @override
  String get techStack => 'Технологический стек';

  @override
  String get linksTitle => 'Ссылки';

  @override
  String get githubRepo => 'Репозиторий GitHub';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter официальный';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => 'Лицензия';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Сделано с ❤️ на Flutter';

  @override
  String get loading => 'Загрузка...';

  @override
  String get error => 'Ошибка';

  @override
  String get success => 'Успех';

  @override
  String get ok => 'ОК';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

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
