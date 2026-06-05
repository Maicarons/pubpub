import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 桌面端侧边栏
class DesktopSidebar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const DesktopSidebar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 220,
      color: isDark ? Colors.grey[900] : Colors.grey[50],
      child: Column(
        children: [
          // Logo 区域
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                Icon(
                  TDIcons.logo_github,
                  size: 32,
                  color: theme.primaryColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'PubPub',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: 8),
          // 菜单项
          _buildMenuItem(
            context,
            index: 0,
            icon: TDIcons.search,
            label: '搜索',
          ),
          _buildMenuItem(
            context,
            index: 1,
            icon: TDIcons.heart,
            label: '收藏',
          ),
          _buildMenuItem(
            context,
            index: 2,
            icon: TDIcons.setting,
            label: '设置',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String label,
  }) {
    final theme = Theme.of(context);
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: isSelected
            ? theme.primaryColor.withValues(alpha: 0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () => onTap(index),
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: isSelected ? theme.primaryColor : Colors.grey[600],
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? theme.primaryColor : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
