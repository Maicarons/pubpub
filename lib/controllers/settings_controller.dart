import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/constants.dart';
import '../common/logger.dart';
import '../services/settings_service.dart';
import '../services/cache_service.dart';
import 'search_controller.dart';
import 'detail_controller.dart';

/// 主题色配置
class ColorSchemeOption {
  final String name;
  final String key;
  final Color color;

  const ColorSchemeOption({
    required this.name,
    required this.key,
    required this.color,
  });
}

/// 可选主题色列表
const List<ColorSchemeOption> colorSchemeOptions = [
  ColorSchemeOption(name: '蓝色', key: 'blue', color: Colors.blue),
  ColorSchemeOption(name: '靛蓝', key: 'indigo', color: Colors.indigo),
  ColorSchemeOption(name: '紫色', key: 'purple', color: Colors.purple),
  ColorSchemeOption(name: '深紫', key: 'deepPurple', color: Colors.deepPurple),
  ColorSchemeOption(name: '青色', key: 'teal', color: Colors.teal),
  ColorSchemeOption(name: '绿色', key: 'green', color: Colors.green),
  ColorSchemeOption(name: '橙色', key: 'orange', color: Colors.orange),
  ColorSchemeOption(name: '红色', key: 'red', color: Colors.red),
  ColorSchemeOption(name: '粉色', key: 'pink', color: Colors.pink),
  ColorSchemeOption(name: '棕色', key: 'brown', color: Colors.brown),
];

/// 设置控制器
class SettingsController extends GetxController {
  static const String _tag = 'SettingsController';

  var currentSource = ''.obs;
  var themeMode = ThemeMode.system.obs;
  var colorSchemeKey = 'blue'.obs;
  var githubRawMirror = ''.obs;
  var translationEndpoint = ''.obs;
  var translationApiKey = ''.obs;
  var translationModel = 'gpt-4o-mini'.obs;
  var translationTargetLang = '简体中文'.obs;
  var locale = const Locale('zh').obs;
  var localeKey = 'system'.obs;

  /// 获取当前主题色
  Color get primaryColor {
    final option = colorSchemeOptions.firstWhere(
      (o) => o.key == colorSchemeKey.value,
      orElse: () => colorSchemeOptions.first,
    );
    return option.color;
  }

  /// 翻译是否已配置
  bool get isTranslationConfigured =>
      translationEndpoint.value.isNotEmpty && translationApiKey.value.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  void _loadSettings() {
    currentSource.value = SettingsService.getSource();
    final mode = SettingsService.getThemeMode();
    themeMode.value = _parseThemeMode(mode);
    colorSchemeKey.value = SettingsService.getColorScheme();
    githubRawMirror.value = SettingsService.getGithubRawMirror();
    translationEndpoint.value = SettingsService.getTranslationEndpoint();
    translationApiKey.value = SettingsService.getTranslationApiKey();
    translationModel.value = SettingsService.getTranslationModel();
    translationTargetLang.value = SettingsService.getTranslationTargetLang();

    final savedLocale = SettingsService.getLocale();
    localeKey.value = savedLocale;
    if (savedLocale == 'system') {
      // 使用系统语言
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
      locale.value = Locale(systemLocale.languageCode);
    } else {
      locale.value = Locale(savedLocale);
    }
  }

  ThemeMode _parseThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  /// 切换源地址
  Future<void> setSource(String source) async {
    if (source.trim().isEmpty) return;
    currentSource.value = source.trim();
    await SettingsService.setSource(source.trim());
    AppLogger.d(_tag, 'Source changed to: $source');
    _refreshControllers();
  }

  /// 重置为默认源
  Future<void> resetSource() async {
    await setSource(AppConstants.defaultPubHostUrl);
  }

  /// 切换主题模式
  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.value = mode;
    await SettingsService.setThemeMode(_themeModeToString(mode));
    Get.changeThemeMode(mode);
  }

  /// 切换主题色
  Future<void> setColorScheme(String key) async {
    colorSchemeKey.value = key;
    await SettingsService.setColorScheme(key);
    // 重建应用以应用新主题色
    Get.forceAppUpdate();
  }

  /// 切换 GitHub Raw 镜像
  Future<void> setGithubRawMirror(String mirror) async {
    githubRawMirror.value = mirror;
    await SettingsService.setGithubRawMirror(mirror);
    AppLogger.d(_tag, 'GitHub raw mirror changed to: $mirror');
  }

  /// 设置翻译 API Endpoint
  Future<void> setTranslationEndpoint(String value) async {
    translationEndpoint.value = value;
    await SettingsService.setTranslationEndpoint(value);
  }

  /// 设置翻译 API Key
  Future<void> setTranslationApiKey(String value) async {
    translationApiKey.value = value;
    await SettingsService.setTranslationApiKey(value);
  }

  /// 设置翻译模型
  Future<void> setTranslationModel(String value) async {
    translationModel.value = value;
    await SettingsService.setTranslationModel(value);
  }

  /// 设置翻译目标语言
  Future<void> setTranslationTargetLang(String value) async {
    translationTargetLang.value = value;
    await SettingsService.setTranslationTargetLang(value);
  }

  /// 切换语言
  Future<void> setLocale(String key) async {
    localeKey.value = key;
    await SettingsService.setLocale(key);

    Locale newLocale;
    if (key == 'system') {
      final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;
      newLocale = Locale(systemLocale.languageCode);
    } else {
      newLocale = Locale(key);
    }

    locale.value = newLocale;
    // 延迟一帧执行，确保 locale 已更新
    Future.microtask(() {
      Get.updateLocale(newLocale);
    });
  }

  /// 清除缓存
  Future<void> clearCache() async {
    await CacheService.clearApiCache();
    AppLogger.d(_tag, 'Cache cleared');
    Get.snackbar(
      '提示',
      '缓存已清除',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }

  /// 源切换后刷新相关控制器
  void _refreshControllers() {
    try {
      final searchCtrl = Get.find<AppSearchController>();
      searchCtrl.clearResults();
    } catch (_) {}
    try {
      final detailCtrl = Get.find<DetailController>();
      detailCtrl.clear();
    } catch (_) {}
  }
}
