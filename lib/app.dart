import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'controllers/layout_controller.dart';
import 'controllers/search_controller.dart';
import 'controllers/favorites_controller.dart';
import 'controllers/settings_controller.dart';
import 'l10n/app_localizations.dart';
import 'layouts/adaptive_builder.dart';

/// 应用入口 Widget
class PubPubApp extends StatelessWidget {
  const PubPubApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 注册全局控制器
    final settingsCtrl = Get.put(SettingsController());
    Get.put(LayoutController());
    Get.put(AppSearchController());
    Get.put(FavoritesController());

    return Obx(() {
      final seedColor = settingsCtrl.primaryColor;

      // Web 端不支持 chinese_font_library（文件系统访问），跳过字体加载
      final lightTheme = ThemeData(
        colorSchemeSeed: seedColor,
        useMaterial3: true,
        brightness: Brightness.light,
      );
      final darkTheme = ThemeData(
        colorSchemeSeed: seedColor,
        useMaterial3: true,
        brightness: Brightness.dark,
      );

      return GetMaterialApp(
        title: 'PubPub',
        debugShowCheckedModeBanner: false,
        theme: kIsWeb ? lightTheme : lightTheme.useSystemChineseFont(Brightness.light),
        darkTheme: kIsWeb ? darkTheme : darkTheme.useSystemChineseFont(Brightness.dark),
        themeMode: settingsCtrl.themeMode.value,
        locale: settingsCtrl.locale.value,
        localeResolutionCallback: (locale, supportedLocales) {
          // 优先使用用户设置的语言
          for (final supported in supportedLocales) {
            if (supported.languageCode == settingsCtrl.locale.value.languageCode) {
              return supported;
            }
          }
          return supportedLocales.first;
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'),
          Locale('bn'),
          Locale('de'),
          Locale('en'),
          Locale('es'),
          Locale('fa'),
          Locale('fr'),
          Locale('hi'),
          Locale('it'),
          Locale('ja'),
          Locale('jv'),
          Locale('ko'),
          Locale('mr'),
          Locale('pa'),
          Locale('pt'),
          Locale('ru'),
          Locale('sw'),
          Locale('te'),
          Locale('tr'),
          Locale('ur'),
          Locale('zh'),
        ],
        home: const _ResponsiveRoot(),
      );
    });
  }
}

/// 响应式根布局：监听窗口尺寸并传递给 LayoutController
class _ResponsiveRoot extends StatefulWidget {
  const _ResponsiveRoot();

  @override
  State<_ResponsiveRoot> createState() => _ResponsiveRootState();
}

class _ResponsiveRootState extends State<_ResponsiveRoot> {
  double _lastWidth = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        // 仅当宽度变化时才更新，避免不必要的重建
        if (width != _lastWidth) {
          _lastWidth = width;
          // 使用微任务延迟更新，避免在 build 阶段触发 setState
          Future.microtask(() {
            if (mounted) {
              final layoutCtrl = Get.find<LayoutController>();
              layoutCtrl.updateWidth(width);
            }
          });
        }
        return const AdaptiveBuilder();
      },
    );
  }
}
