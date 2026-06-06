import 'package:flutter/foundation.dart' show kIsWeb;

/// 应用常量定义
class AppConstants {
  /// 默认 Pub 镜像源地址（Web 端必须使用 pub.dev，中国镜像不支持浏览器 CORS）
  static const String defaultPubHostUrl = kIsWeb
      ? 'https://pub.dev'
      : 'https://pub.flutter-io.cn';

  /// 缓存时长（毫秒），默认 30 分钟
  static const int defaultCacheTtlMs = 30 * 60 * 1000;

  /// 布局断点：小于此宽度为移动端
  static const double mobileBreakpoint = 600;

  /// 布局断点：小于此宽度为平板，否则为桌面端
  static const double tabletBreakpoint = 1200;

  /// 搜索结果每页数量
  static const int pageSize = 20;

  /// 依赖树最大递归深度
  static const int maxDependencyDepth = 3;
}
