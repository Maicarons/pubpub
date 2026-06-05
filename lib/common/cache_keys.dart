/// Hive 缓存 key 定义
class CacheKeys {
  /// API 缓存盒名称
  static const String apiCacheBox = 'api_cache';

  /// 收藏盒名称
  static const String favoritesBox = 'favorites';

  /// 设置盒名称
  static const String settingsBox = 'settings';

  /// 设置项：源地址
  static const String settingsSource = 'source';

  /// 设置项：主题模式
  static const String settingsThemeMode = 'themeMode';

  /// 设置项：主题色
  static const String settingsColorScheme = 'color_scheme';

  /// 设置项：GitHub 镜像源
  static const String settingsGithubMirror = 'github_mirror';

  /// 设置项：GitHub Raw 镜像源
  static const String settingsGithubRawMirror = 'github_raw_mirror';

  /// 设置项：翻译 API Endpoint
  static const String settingsTranslationEndpoint = 'translation_endpoint';

  /// 设置项：翻译 API Key
  static const String settingsTranslationApiKey = 'translation_api_key';

  /// 设置项：翻译模型
  static const String settingsTranslationModel = 'translation_model';

  /// 设置项：翻译目标语言
  static const String settingsTranslationTargetLang = 'translation_target_lang';

  /// 收藏列表 key（旧版，用于迁移）
  static const String favoritesList = 'favorites_list';

  /// 收藏夹 key（新版：文件夹名 -> 包名列表）
  static const String favoritesFolders = 'favorites_folders';
}
