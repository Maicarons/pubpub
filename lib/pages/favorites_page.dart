import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../common/l10n_ext.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/layout_controller.dart';
import '../layouts/widgets/page_navigation.dart';

/// 收藏内容
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favCtrl = Get.find<FavoritesController>();
    final layoutCtrl = Get.find<LayoutController>();

    return Obx(() {
      if (layoutCtrl.isDesktop) {
        return _buildDesktopLayout(context, favCtrl);
      }
      return _buildMobileLayout(context, favCtrl);
    });
  }

  // ==================== 桌面端：左右分栏 ====================

  Widget _buildDesktopLayout(
    BuildContext context,
    FavoritesController ctrl,
  ) {
    return Row(
      children: [
        // 左侧文件夹列表
        SizedBox(
          width: 220,
          child: _buildFolderList(context, ctrl),
        ),
        const VerticalDivider(width: 1),
        // 右侧包列表
        Expanded(
          child: _buildPackageList(context, ctrl),
        ),
      ],
    );
  }

  // ==================== 移动端：文件夹列表或包列表 ====================

  Widget _buildMobileLayout(
    BuildContext context,
    FavoritesController ctrl,
  ) {
    return _buildFolderList(context, ctrl, isMobile: true);
  }

  // ==================== 文件夹列表 ====================

  Widget _buildFolderList(
    BuildContext context,
    FavoritesController ctrl, {
    bool isMobile = false,
  }) {
    final folderNames = ctrl.folders.keys.toList();

    return Column(
      children: [
        // 标题栏
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Text(
                context.l10n.favoritesFolders,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(TDIcons.add, size: 20),
                tooltip: context.l10n.createFolder,
                onPressed: () => _showCreateFolderDialog(context, ctrl),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        // 文件夹列表
        Expanded(
          child: folderNames.isEmpty
              ? Center(
                  child: Text(
                    context.l10n.favoritesFolders,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                )
              : ListView.builder(
                  itemCount: folderNames.length,
                  itemBuilder: (context, index) {
                    final name = folderNames[index];
                    final count = ctrl.folders[name]?.length ?? 0;
                    final isSelected = ctrl.currentFolder.value == name;

                    return ListTile(
                      selected: isSelected,
                      selectedTileColor:
                          Theme.of(context).primaryColor.withValues(alpha: 0.08),
                      leading: Icon(
                        TDIcons.folder,
                        color: isSelected
                            ? Theme.of(context).primaryColor
                            : Colors.grey[500],
                      ),
                      title: Text(
                        name,
                        style: TextStyle(
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '$count',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                          if (name != FavoritesController.defaultFolderName)
                            IconButton(
                              icon: Icon(TDIcons.more,
                                  size: 16, color: Colors.grey[400]),
                              onPressed: () => _showFolderMenu(
                                  context, ctrl, name),
                            ),
                        ],
                      ),
                      onTap: () {
                        ctrl.selectFolder(name);
                        // 移动端点击文件夹后显示包列表
                        if (isMobile) {
                          _showMobilePackageList(context, ctrl, name);
                        }
                      },
                    );
                  },
                ),
        ),
      ],
    );
  }

  // ==================== 包列表 ====================

  Widget _buildPackageList(
    BuildContext context,
    FavoritesController ctrl,
  ) {
    final packages = ctrl.currentFavorites;
    final folderName = ctrl.currentFolder.value;

    if (packages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(TDIcons.heart, size: 48, color: Colors.grey[300]),
            const SizedBox(height: 12),
            Text(
              '"$folderName" 暂无收藏',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            '$folderName (${packages.length})',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              final packageName = packages[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    child: Text(
                      packageName.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    packageName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: IconButton(
                    icon: const Icon(TDIcons.close, size: 18),
                    onPressed: () =>
                        _showRemoveDialog(context, ctrl, packageName),
                  ),
                  onTap: () => PageNavigation.toDetail(context, packageName),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ==================== 移动端包列表弹出 ====================

  void _showMobilePackageList(
    BuildContext context,
    FavoritesController ctrl,
    String folderName,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _MobilePackageListPage(
          folderName: folderName,
          favCtrl: ctrl,
        ),
      ),
    );
  }

  // ==================== 对话框 ==================

  void _showCreateFolderDialog(
    BuildContext context,
    FavoritesController ctrl,
  ) {
    final textCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.createFolder),
        content: TextField(
          controller: textCtrl,
          autofocus: true,
          decoration: InputDecoration(
            hintText: context.l10n.folderName,
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              final name = textCtrl.text.trim();
              if (name.isNotEmpty) {
                final ok = await ctrl.createFolder(name);
                if (!context.mounted) return;
                Navigator.pop(context);
                if (!ok) {
                  Get.snackbar(context.l10n.tip, context.l10n.folderExists,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
            },
            child: Text(context.l10n.create),
          ),
        ],
      ),
    );
  }

  void _showFolderMenu(
    BuildContext context,
    FavoritesController ctrl,
    String folderName,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(TDIcons.edit),
              title: Text(context.l10n.rename),
              onTap: () {
                Navigator.pop(context);
                _showRenameFolderDialog(context, ctrl, folderName);
              },
            ),
            ListTile(
              leading: const Icon(TDIcons.delete, color: Colors.red),
              title: Text(context.l10n.delete, style: const TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pop(context);
                _showDeleteFolderDialog(context, ctrl, folderName);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showRenameFolderDialog(
    BuildContext context,
    FavoritesController ctrl,
    String oldName,
  ) {
    final textCtrl = TextEditingController(text: oldName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.renameFolder),
        content: TextField(
          controller: textCtrl,
          autofocus: true,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              final newName = textCtrl.text.trim();
              if (newName.isNotEmpty && newName != oldName) {
                final ok = await ctrl.renameFolder(oldName, newName);
                if (!context.mounted) return;
                Navigator.pop(context);
                if (!ok) {
                  Get.snackbar(context.l10n.tip, context.l10n.folderExists,
                      snackPosition: SnackPosition.BOTTOM);
                }
              }
            },
            child: Text(context.l10n.confirm),
          ),
        ],
      ),
    );
  }

  void _showDeleteFolderDialog(
    BuildContext context,
    FavoritesController ctrl,
    String folderName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.deleteFolder),
        content: Text(context.l10n.deleteFolderConfirm(folderName)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ctrl.deleteFolder(folderName);
              Navigator.pop(context);
            },
            child: Text(context.l10n.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showRemoveDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.removeFavorite),
        content: Text(context.l10n.removeFromFolder(ctrl.currentFolder.value)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ctrl.removeFromFolder(ctrl.currentFolder.value, packageName);
              Navigator.pop(context);
            },
            child: Text(context.l10n.confirm),
          ),
        ],
      ),
    );
  }
}

/// 移动端包列表页面
class _MobilePackageListPage extends StatelessWidget {
  final String folderName;
  final FavoritesController favCtrl;

  const _MobilePackageListPage({
    required this.folderName,
    required this.favCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(folderName)),
      body: Obx(() {
        final packages = favCtrl.folders[folderName] ?? [];

        if (packages.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(TDIcons.heart, size: 48, color: Colors.grey[300]),
                const SizedBox(height: 12),
                Text(
                  context.l10n.emptyFolder(folderName),
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: packages.length,
          itemBuilder: (context, index) {
            final packageName = packages[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).primaryColor.withValues(alpha: 0.1),
                  child: Text(
                    packageName.substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  packageName,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                trailing: IconButton(
                  icon: const Icon(TDIcons.close, size: 18),
                  onPressed: () {
                    favCtrl.removeFromFolder(folderName, packageName);
                  },
                ),
                onTap: () => PageNavigation.toDetail(context, packageName),
              ),
            );
          },
        );
      }),
    );
  }
}
