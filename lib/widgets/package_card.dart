import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../controllers/favorites_controller.dart';
import '../models/package_search_result.dart';

/// 搜索结果卡片（搜索 API 只返回包名）
class PackageCard extends StatefulWidget {
  final PackageItem item;
  final VoidCallback onTap;

  const PackageCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _isHovered
            ? (Matrix4.identity()..translateByDouble(0, -2, 0, 1))
            : Matrix4.identity(),
        child: Card(
          elevation: _isHovered ? 4 : 1,
          shadowColor: _isHovered
              ? theme.primaryColor.withValues(alpha: 0.3)
              : Colors.black26,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // 包图标
                  CircleAvatar(
                    backgroundColor: isDark
                        ? theme.primaryColor.withValues(alpha: 0.2)
                        : theme.primaryColor.withValues(alpha: 0.1),
                    child: Text(
                      widget.item.package.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // 包名
                  Expanded(
                    child: Text(
                      widget.item.package,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // 收藏按钮
                  Obx(() {
                    final favCtrl = Get.find<FavoritesController>();
                    final isFav =
                        favCtrl.isFavorite(widget.item.package);
                    return GestureDetector(
                      onTap: () => _showFavoriteDialog(
                        context,
                        favCtrl,
                        widget.item.package,
                        isFav,
                      ),
                      child: Icon(
                        isFav ? TDIcons.heart_filled : TDIcons.heart,
                        color: isFav ? Colors.red : Colors.grey[400],
                        size: 20,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showFavoriteDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
    bool isFav,
  ) {
    if (isFav) {
      final folders = ctrl.getFoldersContaining(packageName);
      showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  '已收藏到：${folders.join(", ")}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(TDIcons.heart_filled, color: Colors.red),
                title: const Text('取消所有收藏'),
                onTap: () {
                  ctrl.removeFromAll(packageName);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(TDIcons.add),
                title: const Text('添加到其他收藏夹'),
                onTap: () {
                  Navigator.pop(context);
                  _showAddToFolderDialog(context, ctrl, packageName);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      _showAddToFolderDialog(context, ctrl, packageName);
    }
  }

  void _showAddToFolderDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                '选择收藏夹',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ),
            const Divider(height: 1),
            ...ctrl.folders.keys.map((folderName) {
              final contains =
                  ctrl.folders[folderName]?.contains(packageName) ?? false;
              return ListTile(
                leading: Icon(
                  contains ? TDIcons.check : TDIcons.folder,
                  color: contains ? Colors.green : null,
                ),
                title: Text(folderName),
                onTap: () {
                  if (!contains) {
                    ctrl.addToFolder(folderName, packageName);
                  }
                  Navigator.pop(context);
                },
              );
            }),
            ListTile(
              leading: const Icon(TDIcons.add),
              title: const Text('新建收藏夹'),
              onTap: () {
                Navigator.pop(context);
                _showCreateAndAddDialog(context, ctrl, packageName);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showCreateAndAddDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
  ) {
    final textCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('新建收藏夹'),
        content: TextField(
          controller: textCtrl,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: '收藏夹名称',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () async {
              final name = textCtrl.text.trim();
              if (name.isNotEmpty) {
                await ctrl.createFolder(name);
                await ctrl.addToFolder(name, packageName);
              }
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: const Text('创建并收藏'),
          ),
        ],
      ),
    );
  }
}
