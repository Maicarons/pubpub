import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../../common/l10n_ext.dart';

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
    final tdTheme = TDTheme.of(context);

    return Container(
      width: 220,
      color: tdTheme.bgColorContainer,
      child: Column(
        children: [
          // Logo 区域
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'logo.png',
                    width: 32,
                    height: 32,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      TDIcons.logo_github,
                      size: 32,
                      color: tdTheme.brandNormalColor,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'PubPub',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: tdTheme.brandNormalColor,
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
            label: context.l10n.navSearch,
          ),
          _buildMenuItem(
            context,
            index: 1,
            icon: TDIcons.heart,
            label: context.l10n.navFavorites,
          ),
          _buildMenuItem(
            context,
            index: 2,
            icon: TDIcons.setting,
            label: context.l10n.navSettings,
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
    final tdTheme = TDTheme.of(context);
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: isSelected
            ? tdTheme.brandNormalColor.withValues(alpha: 0.1)
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
                  color: isSelected ? tdTheme.brandNormalColor : tdTheme.textColorSecondary,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? tdTheme.brandNormalColor : tdTheme.textColorPrimary,
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
