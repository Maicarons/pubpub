import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/favorites_page.dart';
import '../pages/settings_page.dart';
import 'widgets/mobile_bottom_nav.dart';

/// 移动端脚手架：底部导航栏 + 页面切换
class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    FavoritesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: MobileBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
