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
    final tdTheme = TDTheme.of(context);

    return TDBottomTabBar(
      TDBottomTabBarBasicType.iconText,
      currentIndex: currentIndex,
      navigationTabs: [
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navSearch,
          selectedIcon: Icon(TDIcons.search, color: tdTheme.brandNormalColor),
          unselectedIcon: Icon(TDIcons.search, color: tdTheme.textColorSecondary),
          onTap: () => onTap(0),
        ),
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navFavorites,
          selectedIcon: Icon(TDIcons.heart_filled, color: tdTheme.brandNormalColor),
          unselectedIcon: Icon(TDIcons.heart, color: tdTheme.textColorSecondary),
          onTap: () => onTap(1),
        ),
        TDBottomTabBarTabConfig(
          tabText: context.l10n.navSettings,
          selectedIcon: Icon(TDIcons.setting_filled, color: tdTheme.brandNormalColor),
          unselectedIcon: Icon(TDIcons.setting, color: tdTheme.textColorSecondary),
          onTap: () => onTap(2),
        ),
      ],
    );
  }
}
