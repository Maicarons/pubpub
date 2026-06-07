import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'controllers/layout_controller.dart';
import 'controllers/search_controller.dart';
import 'controllers/favorites_controller.dart';
import 'controllers/settings_controller.dart';
import 'l10n/app_localizations.dart';
import 'layouts/adaptive_builder.dart';
import 'themes/app_theme.dart';

/// 应用入口 Widget
class PubPubApp extends StatefulWidget {
  const PubPubApp({super.key});

  @override
  State<PubPubApp> createState() => _PubPubAppState();
}

class _PubPubAppState extends State<PubPubApp> with WidgetsBindingObserver {
  TDThemeData? _tdTheme;

  /// 跟踪系统亮度变化，用于 system 模式下正确切换 TDTheme
  final _platformBrightness = Brightness.light.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _platformBrightness.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    _loadTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    _platformBrightness.value =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }

  Future<void> _loadTheme() async {
    final theme = await AppTheme.loadTDTheme();
    setState(() => _tdTheme = theme);
  }

  @override
  Widget build(BuildContext context) {
    // 注册全局控制器
    final settingsCtrl = Get.put(SettingsController());
    Get.put(LayoutController());
    Get.put(AppSearchController());
    Get.put(FavoritesController());

    // 主题未加载时使用默认主题
    final baseTheme = _tdTheme ?? TDThemeData.defaultData();

    return Obx(() {
      final isDark =
          AppTheme.isDarkMode(settingsCtrl.themeMode.value, _platformBrightness.value);

      // 应用用户选择的品牌色
      final brandColor = settingsCtrl.primaryColor;
      final tdTheme = AppTheme.applyBrandColor(baseTheme, brandColor);
      final darkBase = baseTheme.dark ?? baseTheme;
      final darkTdTheme = AppTheme.applyBrandColor(darkBase, brandColor);

      final currentTdTheme = isDark ? darkTdTheme : tdTheme;
      final lightTheme = AppTheme.buildLightTheme(tdTheme);
      final darkTheme = AppTheme.buildDarkTheme(darkTdTheme);

      return TDTheme(
        data: currentTdTheme,
        systemData: isDark ? darkTheme : lightTheme,
        child: GetMaterialApp(
          title: 'PubPub',
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: settingsCtrl.themeMode.value,
          locale: settingsCtrl.locale.value,
          localeResolutionCallback: (locale, supportedLocales) {
            for (final supported in supportedLocales) {
              if (supported.languageCode ==
                  settingsCtrl.locale.value.languageCode) {
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
        ),
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
        if (width != _lastWidth) {
          _lastWidth = width;
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
