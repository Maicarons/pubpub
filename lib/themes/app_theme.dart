import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

/// 应用主题管理
class AppTheme {
  AppTheme._();

  /// 从 assets 加载 TDesign 主题数据
  static Future<TDThemeData> loadTDTheme() async {
    final json = await rootBundle.loadString('assets/td_theme.json');
    return TDThemeData.fromJson('default', json, darkName: 'defaultDark') ??
        TDThemeData.defaultData();
  }

  /// 根据 themeMode 和系统亮度判断是否为暗色模式
  static bool isDarkMode(ThemeMode mode, Brightness platformBrightness) {
    switch (mode) {
      case ThemeMode.dark:
        return true;
      case ThemeMode.light:
        return false;
      case ThemeMode.system:
        return platformBrightness == Brightness.dark;
    }
  }

  /// 从基础色生成 10 级品牌色阶（TDesign 风格）
  static List<Color> generateBrandPalette(Color base) {
    final hsl = HSLColor.fromColor(base);
    return [
      hsl.withLightness(0.95).toColor(), // brandColor1
      hsl.withLightness(0.88).toColor(), // brandColor2
      hsl.withLightness(0.78).toColor(), // brandColor3
      hsl.withLightness(0.65).toColor(), // brandColor4
      hsl.withLightness(0.50).toColor(), // brandColor5
      base, // brandColor6
      hsl
          .withLightness((hsl.lightness - 0.08).clamp(0.0, 1.0))
          .toColor(), // brandColor7
      hsl
          .withLightness((hsl.lightness - 0.16).clamp(0.0, 1.0))
          .toColor(), // brandColor8
      hsl
          .withLightness((hsl.lightness - 0.24).clamp(0.0, 1.0))
          .toColor(), // brandColor9
      hsl
          .withLightness((hsl.lightness - 0.32).clamp(0.0, 1.0))
          .toColor(), // brandColor10
    ];
  }

  /// 为 TDThemeData 应用自定义品牌色
  static TDThemeData applyBrandColor(TDThemeData theme, Color brandColor) {
    final palette = generateBrandPalette(brandColor);
    final newColorMap = <String, Color>{};
    theme.colorMap.forEach((key, value) {
      newColorMap[key] = value;
    });
    for (var i = 0; i < 10; i++) {
      newColorMap['brandColor${i + 1}'] = palette[i];
    }
    return theme.copyWithTDThemeData(theme.name, colorMap: newColorMap);
  }

  /// 构建完整的亮色 Material ThemeData
  static ThemeData buildLightTheme(TDThemeData td) {
    final base = td.systemThemeDataLight ?? ThemeData();
    var theme = base.copyWith(
      scaffoldBackgroundColor: td.bgColorPage,
      cardColor: td.bgColorContainer,
      dividerColor: td.componentStrokeColor,
      colorScheme: base.colorScheme.copyWith(
        surface: td.bgColorContainer,
        onSurface: td.textColorPrimary,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: td.bgColorContainer,
        foregroundColor: td.textColorPrimary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: td.bgColorContainer,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: td.bgColorContainer,
      ),
      textTheme: _buildTextTheme(base.textTheme, td),
      iconTheme: IconThemeData(color: td.textColorPrimary),
      inputDecorationTheme: _buildInputDecorationTheme(td),
    );
    if (!kIsWeb) {
      theme = theme.useSystemChineseFont(Brightness.light);
    }
    return theme;
  }

  /// 构建完整的暗色 Material ThemeData
  static ThemeData buildDarkTheme(TDThemeData td) {
    final base = td.systemThemeDataDark ?? ThemeData.dark();
    var theme = base.copyWith(
      scaffoldBackgroundColor: td.bgColorPage,
      cardColor: td.bgColorContainer,
      dividerColor: td.componentStrokeColor,
      colorScheme: base.colorScheme.copyWith(
        surface: td.bgColorContainer,
        onSurface: td.textColorPrimary,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: td.bgColorContainer,
        foregroundColor: td.textColorPrimary,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: td.bgColorContainer,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: td.bgColorContainer,
      ),
      textTheme: _buildTextTheme(base.textTheme, td),
      iconTheme: IconThemeData(color: td.textColorPrimary),
      inputDecorationTheme: _buildInputDecorationTheme(td),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        backgroundColor: td.bgColorContainer,
        selectedItemColor: td.brandNormalColor,
        unselectedItemColor: td.textColorSecondary,
      ),
    );
    if (!kIsWeb) {
      theme = theme.useSystemChineseFont(Brightness.dark);
    }
    return theme;
  }

  /// 构建 TextTheme，统一亮/暗色文字样式
  static TextTheme _buildTextTheme(TextTheme base, TDThemeData td) {
    return base.copyWith(
      bodyLarge: TextStyle(color: td.textColorPrimary),
      bodyMedium: TextStyle(color: td.textColorPrimary),
      bodySmall: TextStyle(color: td.textColorSecondary),
      titleLarge:
          TextStyle(color: td.textColorPrimary, fontWeight: FontWeight.w600),
      titleMedium:
          TextStyle(color: td.textColorPrimary, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: td.textColorSecondary),
      labelLarge: TextStyle(color: td.textColorPrimary),
      labelMedium: TextStyle(color: td.textColorSecondary),
      labelSmall: TextStyle(color: td.textColorPlaceholder),
    );
  }

  /// 构建 InputDecorationTheme，统一亮/暗色输入框样式
  static InputDecorationTheme _buildInputDecorationTheme(TDThemeData td) {
    return InputDecorationTheme(
      filled: true,
      fillColor: td.bgColorSecondaryContainer,
      hintStyle: TextStyle(color: td.textColorPlaceholder),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: td.componentBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: td.componentBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: td.brandNormalColor, width: 2),
      ),
    );
  }
}
