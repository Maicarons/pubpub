import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/cache_keys.dart';
import '../common/logger.dart';

/// Hive 缓存读写逻辑
class CacheService {
  static const String _tag = 'CacheService';

  /// 获取 API 缓存，返回 null 表示无缓存或已过期
  static Future<Map<String, dynamic>?> getApiCache(String key) async {
    try {
      final box = Hive.box(CacheKeys.apiCacheBox);
      final raw = box.get(key);
      if (raw == null) return null;

      final Map<String, dynamic> entry = Map<String, dynamic>.from(
        jsonDecode(raw as String) as Map,
      );
      final int timestamp = entry['timestamp'] as int;
      final int ttl = entry['ttl'] as int;
      final int now = DateTime.now().millisecondsSinceEpoch;

      if (now - timestamp > ttl) {
        AppLogger.d(_tag, 'Cache expired for key: $key');
        return null;
      }

      AppLogger.d(_tag, 'Cache hit for key: $key');
      return Map<String, dynamic>.from(entry['data'] as Map);
    } catch (e) {
      AppLogger.e(_tag, 'Error reading cache', e);
      return null;
    }
  }

  /// 获取过期缓存（离线降级用）
  static Future<Map<String, dynamic>?> getStaleApiCache(String key) async {
    try {
      final box = Hive.box(CacheKeys.apiCacheBox);
      final raw = box.get(key);
      if (raw == null) return null;

      final Map<String, dynamic> entry = Map<String, dynamic>.from(
        jsonDecode(raw as String) as Map,
      );
      return Map<String, dynamic>.from(entry['data'] as Map);
    } catch (e) {
      AppLogger.e(_tag, 'Error reading stale cache', e);
      return null;
    }
  }

  /// 写入 API 缓存
  static Future<void> setApiCache(
    String key,
    Map<String, dynamic> data, {
    int? ttlMs,
  }) async {
    try {
      final box = Hive.box(CacheKeys.apiCacheBox);
      final entry = {
        'data': data,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'ttl': ttlMs ?? 30 * 60 * 1000,
      };
      await box.put(key, jsonEncode(entry));
      AppLogger.d(_tag, 'Cache written for key: $key');
    } catch (e) {
      AppLogger.e(_tag, 'Error writing cache', e);
    }
  }

  /// 清除所有 API 缓存
  static Future<void> clearApiCache() async {
    try {
      final box = Hive.box(CacheKeys.apiCacheBox);
      await box.clear();
      AppLogger.d(_tag, 'API cache cleared');
    } catch (e) {
      AppLogger.e(_tag, 'Error clearing cache', e);
    }
  }
}
