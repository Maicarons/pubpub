import 'package:flutter/foundation.dart';

/// 日志工具封装
class AppLogger {
  static void d(String tag, String message) {
    if (kDebugMode) {
      debugPrint('[$tag] $message');
    }
  }

  static void e(String tag, String message, [Object? error]) {
    if (kDebugMode) {
      debugPrint('[$tag] ERROR: $message');
      if (error != null) {
        debugPrint('[$tag] $error');
      }
    }
  }

  static void w(String tag, String message) {
    if (kDebugMode) {
      debugPrint('[$tag] WARN: $message');
    }
  }
}
