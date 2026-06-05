import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import '../common/cache_keys.dart';
import '../common/logger.dart';

/// 收藏数据的 Hive 操作（支持文件夹）
class FavoritesService {
  static const String _tag = 'FavoritesService';
  static const String _defaultFolder = '默认收藏';

  /// 获取所有收藏夹：{ 文件夹名: [包名列表] }
  static Map<String, List<String>> getFolders() {
    try {
      _migrateIfNeeded();
      final box = Hive.box(CacheKeys.favoritesBox);
      final raw = box.get(CacheKeys.favoritesFolders);
      if (raw == null) return {_defaultFolder: []};

      final Map<String, dynamic> decoded =
          Map<String, dynamic>.from(jsonDecode(raw as String) as Map);
      return decoded.map(
        (key, value) => MapEntry(key, List<String>.from(value as List)),
      );
    } catch (e) {
      AppLogger.e(_tag, 'Error reading folders', e);
      return {_defaultFolder: []};
    }
  }

  /// 保存所有收藏夹
  static Future<void> _saveFolders(Map<String, List<String>> folders) async {
    try {
      final box = Hive.box(CacheKeys.favoritesBox);
      await box.put(CacheKeys.favoritesFolders, jsonEncode(folders));
    } catch (e) {
      AppLogger.e(_tag, 'Error saving folders', e);
    }
  }

  /// 创建收藏夹
  static Future<bool> createFolder(String name) async {
    if (name.trim().isEmpty) return false;
    final folders = getFolders();
    if (folders.containsKey(name)) return false;
    folders[name] = [];
    await _saveFolders(folders);
    AppLogger.d(_tag, 'Created folder: $name');
    return true;
  }

  /// 删除收藏夹
  static Future<void> deleteFolder(String name) async {
    final folders = getFolders();
    folders.remove(name);
    // 至少保留一个文件夹
    if (folders.isEmpty) folders[_defaultFolder] = [];
    await _saveFolders(folders);
    AppLogger.d(_tag, 'Deleted folder: $name');
  }

  /// 重命名收藏夹
  static Future<bool> renameFolder(String oldName, String newName) async {
    if (newName.trim().isEmpty) return false;
    final folders = getFolders();
    if (!folders.containsKey(oldName) || folders.containsKey(newName)) {
      return false;
    }
    final packages = folders.remove(oldName)!;
    folders[newName] = packages;
    await _saveFolders(folders);
    AppLogger.d(_tag, 'Renamed folder: $oldName -> $newName');
    return true;
  }

  /// 添加包到指定收藏夹
  static Future<void> addToFolder(String folderName, String packageName) async {
    final folders = getFolders();
    final list = folders[folderName] ?? [];
    if (!list.contains(packageName)) {
      list.add(packageName);
      folders[folderName] = list;
      await _saveFolders(folders);
      AppLogger.d(_tag, 'Added $packageName to $folderName');
    }
  }

  /// 从指定收藏夹移除包
  static Future<void> removeFromFolder(
    String folderName,
    String packageName,
  ) async {
    final folders = getFolders();
    final list = folders[folderName];
    if (list != null) {
      list.remove(packageName);
      folders[folderName] = list;
      await _saveFolders(folders);
      AppLogger.d(_tag, 'Removed $packageName from $folderName');
    }
  }

  /// 检查包是否在任意收藏夹中
  static bool isFavorite(String packageName) {
    final folders = getFolders();
    return folders.values.any((list) => list.contains(packageName));
  }

  /// 获取包含该包的收藏夹名称列表
  static List<String> getFoldersContaining(String packageName) {
    final folders = getFolders();
    return folders.entries
        .where((e) => e.value.contains(packageName))
        .map((e) => e.key)
        .toList();
  }

  /// 获取所有收藏的包名（去重）
  static List<String> getAllFavorites() {
    final folders = getFolders();
    final all = <String>{};
    for (final list in folders.values) {
      all.addAll(list);
    }
    return all.toList();
  }

  /// 旧数据迁移：favorites_list → favorites_folders
  static void _migrateIfNeeded() {
    try {
      final box = Hive.box(CacheKeys.favoritesBox);
      // 如果已有新数据，跳过
      if (box.get(CacheKeys.favoritesFolders) != null) return;
      // 如果有旧数据，迁移
      final oldList = box.get(CacheKeys.favoritesList);
      if (oldList != null) {
        final packages = List<String>.from(oldList as List);
        final folders = {_defaultFolder: packages};
        box.put(CacheKeys.favoritesFolders, jsonEncode(folders));
        box.delete(CacheKeys.favoritesList);
        AppLogger.d(_tag, 'Migrated ${packages.length} favorites to default folder');
      }
    } catch (e) {
      AppLogger.e(_tag, 'Migration error', e);
    }
  }
}
