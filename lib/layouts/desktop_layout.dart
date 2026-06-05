import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/favorites_page.dart';
import '../pages/settings_page.dart';
import 'widgets/desktop_sidebar.dart';

/// 桌面端脚手架：左侧固定侧边栏 + 右侧内容区
class DesktopLayout extends StatefulWidget {
  const DesktopLayout({super.key});

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FavoritesPage(),
    SettingsPage(),
  ];

  final List<String> _pageTitles = const ['搜索', '收藏', '设置'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Row(
        children: [
          // 左侧固定侧边栏
          DesktopSidebar(
            selectedIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          // 分隔线
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: theme.dividerColor.withValues(alpha: 0.3),
          ),
          // 右侧内容区
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 顶部标题栏
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Text(
                    _pageTitles[_selectedIndex],
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Divider(height: 1),
                // 页面内容
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _pages,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
