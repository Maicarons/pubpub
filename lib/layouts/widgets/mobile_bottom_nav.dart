import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

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
    return TDBottomTabBar(
      TDBottomTabBarBasicType.iconText,
      currentIndex: currentIndex,
      navigationTabs: [
        TDBottomTabBarTabConfig(
          tabText: '搜索',
          selectedIcon: const Icon(TDIcons.search, color: Colors.blue),
          unselectedIcon: const Icon(TDIcons.search),
          onTap: () => onTap(0),
        ),
        TDBottomTabBarTabConfig(
          tabText: '收藏',
          selectedIcon: const Icon(TDIcons.heart_filled, color: Colors.blue),
          unselectedIcon: const Icon(TDIcons.heart),
          onTap: () => onTap(1),
        ),
        TDBottomTabBarTabConfig(
          tabText: '设置',
          selectedIcon: const Icon(TDIcons.setting_filled, color: Colors.blue),
          unselectedIcon: const Icon(TDIcons.setting),
          onTap: () => onTap(2),
        ),
      ],
    );
  }
}
