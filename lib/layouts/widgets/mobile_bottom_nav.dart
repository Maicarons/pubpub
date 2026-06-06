import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../../common/l10n_ext.dart';

/// 移动端底部导航栏
class MobileBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MobileBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return TDBottomTabBar(
      TDBottomTabBarBasicType.iconText,
      currentIndex: currentIndex,
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      navigationTabs: [
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navSearch,
          selectedIcon: Icon(TDIcons.search, color: theme.primaryColor),
          unselectedIcon: const Icon(TDIcons.search),
          onTap: () => onTap(0),
        ),
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navFavorites,
          selectedIcon: Icon(TDIcons.heart_filled, color: theme.primaryColor),
          unselectedIcon: const Icon(TDIcons.heart),
          onTap: () => onTap(1),
        ),
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navSettings,
          selectedIcon: Icon(TDIcons.setting_filled, color: theme.primaryColor),
          unselectedIcon: const Icon(TDIcons.setting),
          onTap: () => onTap(2),
        ),
      ],
    );
  }
}
