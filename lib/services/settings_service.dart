import 'package:hive_flutter/hive_flutter.dart';
import '../common/cache_keys.dart';
import '../common/constants.dart';
import '../common/logger.dart';

/// 用户设置的存储与读取
class SettingsService {
  static const String _tag = 'SettingsService';

  /// 获取当前源地址
  static String getSource() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(
        CacheKeys.settingsSource,
        defaultValue: AppConstants.defaultPubHostUrl,
      ) as String;
    } catch (e) {
      AppLogger.e(_tag, 'Error reading source', e);
      return AppConstants.defaultPubHostUrl;
    }
  }

  /// 设置源地址
  static Future<void> setSource(String source) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsSource, source);
      AppLogger.d(_tag, 'Source set to: $source');
    } catch (e) {
      AppLogger.e(_tag, 'Error setting source', e);
    }
  }

  /// 获取主题模式
  static String getThemeMode() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsThemeMode, defaultValue: 'system')
          as String;
    } catch (e) {
      AppLogger.e(_tag, 'Error reading theme mode', e);
      return 'system';
    }
  }

  /// 设置主题模式
  static Future<void> setThemeMode(String mode) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsThemeMode, mode);
      AppLogger.d(_tag, 'Theme mode set to: $mode');
    } catch (e) {
      AppLogger.e(_tag, 'Error setting theme mode', e);
    }
  }

  /// 获取主题色
  static String getColorScheme() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsColorScheme, defaultValue: 'blue')
          as String;
    } catch (e) {
      AppLogger.e(_tag, 'Error reading color scheme', e);
      return 'blue';
    }
  }

  /// 设置主题色
  static Future<void> setColorScheme(String scheme) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsColorScheme, scheme);
      AppLogger.d(_tag, 'Color scheme set to: $scheme');
    } catch (e) {
      AppLogger.e(_tag, 'Error setting color scheme', e);
    }
  }

  /// 获取 GitHub 镜像源
  static String getGithubMirror() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsGithubMirror,
          defaultValue: 'github.com') as String;
    } catch (e) {
      AppLogger.e(_tag, 'Error reading github mirror', e);
      return 'github.com';
    }
  }

  /// 设置 GitHub 镜像源
  static Future<void> setGithubMirror(String mirror) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsGithubMirror, mirror);
      AppLogger.d(_tag, 'GitHub mirror set to: $mirror');
    } catch (e) {
      AppLogger.e(_tag, 'Error setting github mirror', e);
    }
  }

  /// 获取 GitHub Raw 镜像源
  static String getGithubRawMirror() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsGithubRawMirror,
          defaultValue: 'raw.githubusercontent.com') as String;
    } catch (e) {
      AppLogger.e(_tag, 'Error reading github raw mirror', e);
      return 'raw.githubusercontent.com';
    }
  }

  /// 设置 GitHub Raw 镜像源
  static Future<void> setGithubRawMirror(String mirror) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsGithubRawMirror, mirror);
      AppLogger.d(_tag, 'GitHub raw mirror set to: $mirror');
    } catch (e) {
      AppLogger.e(_tag, 'Error setting github raw mirror', e);
    }
  }

  /// 获取翻译 API Endpoint
  static String getTranslationEndpoint() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsTranslationEndpoint, defaultValue: '')
          as String;
    } catch (e) {
      return '';
    }
  }

  /// 设置翻译 API Endpoint
  static Future<void> setTranslationEndpoint(String value) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsTranslationEndpoint, value);
    } catch (e) {
      AppLogger.e(_tag, 'Error setting translation endpoint', e);
    }
  }

  /// 获取翻译 API Key
  static String getTranslationApiKey() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsTranslationApiKey, defaultValue: '')
          as String;
    } catch (e) {
      return '';
    }
  }

  /// 设置翻译 API Key
  static Future<void> setTranslationApiKey(String value) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsTranslationApiKey, value);
    } catch (e) {
      AppLogger.e(_tag, 'Error setting translation api key', e);
    }
  }

  /// 获取翻译模型
  static String getTranslationModel() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsTranslationModel,
          defaultValue: 'gpt-4o-mini') as String;
    } catch (e) {
      return 'gpt-4o-mini';
    }
  }

  /// 设置翻译模型
  static Future<void> setTranslationModel(String value) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsTranslationModel, value);
    } catch (e) {
      AppLogger.e(_tag, 'Error setting translation model', e);
    }
  }

  /// 获取翻译目标语言
  static String getTranslationTargetLang() {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      return box.get(CacheKeys.settingsTranslationTargetLang,
          defaultValue: '简体中文') as String;
    } catch (e) {
      return '简体中文';
    }
  }

  /// 设置翻译目标语言
  static Future<void> setTranslationTargetLang(String value) async {
    try {
      final box = Hive.box(CacheKeys.settingsBox);
      await box.put(CacheKeys.settingsTranslationTargetLang, value);
    } catch (e) {
      AppLogger.e(_tag, 'Error setting translation target lang', e);
    }
  }
}
