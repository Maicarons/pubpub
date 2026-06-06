import 'package:get/get.dart';
import '../common/logger.dart';
import '../services/favorites_service.dart';

/// 收藏夹控制器
class FavoritesController extends GetxController {
  static const String _tag = 'FavoritesController';
  static const String defaultFolderName = '默认收藏'; // Hive 中存储的 key，不可变

  /// 所有收藏夹 { 文件夹名: [包名列表] }
  var folders = <String, List<String>>{}.obs;

  /// 当前选中的文件夹名
  var currentFolder = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadFolders();
  }

  /// 加载所有收藏夹
  void loadFolders() {
    folders.value = FavoritesService.getFolders();
    // 如果当前文件夹不存在，选中第一个
    if (currentFolder.value.isEmpty ||
        !folders.containsKey(currentFolder.value)) {
      currentFolder.value =
          folders.isNotEmpty ? folders.keys.first : defaultFolderName;
    }
    AppLogger.d(_tag, 'Loaded ${folders.length} folders');
  }

  /// 当前文件夹的包列表
  List<String> get currentFavorites {
    return folders[currentFolder.value] ?? [];
  }

  /// 创建收藏夹
  Future<bool> createFolder(String name) async {
    final ok = await FavoritesService.createFolder(name);
    if (ok) loadFolders();
    return ok;
  }

  /// 删除收藏夹
  Future<void> deleteFolder(String name) async {
    await FavoritesService.deleteFolder(name);
    loadFolders();
  }

  /// 重命名收藏夹
  Future<bool> renameFolder(String oldName, String newName) async {
    final ok = await FavoritesService.renameFolder(oldName, newName);
    if (ok) {
      if (currentFolder.value == oldName) {
        currentFolder.value = newName;
      }
      loadFolders();
    }
    return ok;
  }

  /// 添加包到指定收藏夹
  Future<void> addToFolder(String folderName, String packageName) async {
    await FavoritesService.addToFolder(folderName, packageName);
    loadFolders();
  }

  /// 从指定收藏夹移除包
  Future<void> removeFromFolder(String folderName, String packageName) async {
    await FavoritesService.removeFromFolder(folderName, packageName);
    loadFolders();
  }

  /// 从所有收藏夹移除
  Future<void> removeFromAll(String packageName) async {
    for (final folderName in folders.keys) {
      await FavoritesService.removeFromFolder(folderName, packageName);
    }
    loadFolders();
  }

  /// 切换收藏（如果已收藏则移除，否则添加到默认收藏夹）
  Future<void> toggleFavorite(String packageName) async {
    if (isFavorite(packageName)) {
      await removeFromAll(packageName);
    } else {
      await addToFolder(defaultFolderName, packageName);
    }
  }

  /// 检查包是否在任意收藏夹中
  bool isFavorite(String packageName) {
    return folders.values.any((list) => list.contains(packageName));
  }

  /// 获取包含该包的收藏夹名称列表
  List<String> getFoldersContaining(String packageName) {
    return folders.entries
        .where((e) => e.value.contains(packageName))
        .map((e) => e.key)
        .toList();
  }

  /// 切换当前选中的文件夹
  void selectFolder(String name) {
    currentFolder.value = name;
  }
}
