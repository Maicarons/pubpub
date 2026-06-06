/// TDesign CSS 主题转 JSON 工具
/// 用法: dart run tool/css2json.dart
import 'dart:convert';
import 'dart:io';

void main() {
  final projectDir = Directory.current.path;
  final cssPath = '$projectDir/lib/themes/theme_main.css';
  final outputPath = '$projectDir/assets/td_theme.json';

  final cssFile = File(cssPath);
  if (!cssFile.existsSync()) {
    print('CSS file not found: $cssPath');
    return;
  }

  final cssContent = cssFile.readAsStringSync();

  // 分割亮色和暗色
  final parts = cssContent.split('[theme-mode="dark"]');
  final lightCss = parts[0];
  final darkCss = parts.length > 1 ? parts[1] : '';

  // 解析亮色主题
  final lightMap = parseCss(lightCss);
  final outputMap = {};
  outputMap['default'] = lightMap;

  // 解析暗色主题
  if (darkCss.isNotEmpty) {
    final darkMap = parseCss(darkCss);
    outputMap['defaultDark'] = darkMap;
  }

  // 写入 JSON
  final outputFile = File(outputPath);
  outputFile.writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(outputMap),
  );
  print('Generated: $outputPath');
}

Map<String, dynamic> parseCss(String cssContent) {
  final jsonMap = convertCssToJson(cssContent);

  final filterMap = <String, String>{};
  final colorKeys = ['brand', 'warning', 'error', 'success', 'gray'];

  jsonMap.forEach((key, value) {
    for (final element in colorKeys) {
      if (key.startsWith('--td-$element-color') ||
          key.startsWith('--td-bg-color') ||
          key.startsWith('--td-text-color') ||
          key.startsWith('--td-component') ||
          key.startsWith('--td-font-white') ||
          key.startsWith('--td-font-gray')) {
        final newKey = convertToCamelCase(key);
        final valueString = value.toString();

        if (valueString.startsWith('#') || valueString.startsWith('var')) {
          var colorString = valueString.replaceAll(';', '');
          if (colorString.length == 4) {
            final sb = StringBuffer('#');
            sb.write(colorString[1]);
            sb.write(colorString[1]);
            sb.write(colorString[2]);
            sb.write(colorString[2]);
            sb.write(colorString[3]);
            sb.write(colorString[3]);
            colorString = sb.toString();
          } else if (colorString.length == 9) {
            final sb = StringBuffer('#');
            sb.write(colorString[7]);
            sb.write(colorString[8]);
            sb.write(colorString[1]);
            sb.write(colorString[2]);
            sb.write(colorString[3]);
            sb.write(colorString[4]);
            sb.write(colorString[5]);
            sb.write(colorString[6]);
            colorString = sb.toString();
          }
          filterMap[newKey] = colorString;
        } else if (valueString.startsWith('rgba')) {
          try {
            var colorString = valueString.replaceAll(';', '');
            final color = colorString.replaceAll('rgba(', '').replaceAll(')', '');
            final colorList = color.split(',');
            final r = int.parse(colorList[0].trim());
            final g = int.parse(colorList[1].trim());
            final b = int.parse(colorList[2].trim());
            final a = double.parse(colorList[3].trim());
            final alphaInt = (a * 255).toInt();
            final hexColor =
                '#${alphaInt.toRadixString(16).padLeft(2, '0')}'
                '${r.toRadixString(16).padLeft(2, '0')}'
                '${g.toRadixString(16).padLeft(2, '0')}'
                '${b.toRadixString(16).padLeft(2, '0')}';
            filterMap[newKey] = hexColor.toUpperCase();
          } catch (e) {
            filterMap[newKey] = '#FFFFFFFF';
          }
        }
        break;
      }
    }
  });

  final functionNames = ['Light', 'Focus', 'Disabled', 'Hover', 'Active'];
  final defaultNames = ['brandColor', 'warningColor', 'errorColor', 'successColor'];
  final refMap = <String, String>{};
  final removeKey = <String>[];

  filterMap.forEach((key, value) {
    if (value.contains('var(')) {
      final field = value.replaceAll('var(', '').replaceAll(')', '');
      for (final f in functionNames) {
        if (key.endsWith(f)) {
          final reKey = key.replaceAll('Color$f', '${f}Color');
          refMap[reKey] = convertToCamelCase(field);
          removeKey.add(key);
          return;
        }
      }
      for (final d in defaultNames) {
        if (key == d) {
          final reKey = key.replaceAll('Color', 'NormalColor');
          refMap[reKey] = convertToCamelCase(field);
          removeKey.add(key);
          return;
        }
      }
      refMap[key] = convertToCamelCase(field);
      removeKey.add(key);
    }
  });

  for (final key in removeKey) {
    filterMap.remove(key);
  }

  final themeMap = <String, dynamic>{};
  themeMap['ref'] = refMap;
  themeMap['color'] = filterMap;
  return themeMap;
}

String convertToCamelCase(String input) {
  input = input.replaceAll('--td-', '');
  final parts = input.split('-');
  final result = StringBuffer(parts[0]);

  for (var i = 1; i < parts.length; i++) {
    final part = parts[i];
    if (part.isNotEmpty) {
      final camelCasePart = part[0].toUpperCase() + part.substring(1);
      result.write(camelCasePart);
    }
  }

  var resultString = result.toString();
  if (resultString.contains('Secondarycontainer')) {
    resultString = resultString.replaceAll('Secondarycontainer', 'SecondaryContainer');
  } else if (resultString.contains('Secondarycomponent')) {
    resultString = resultString.replaceAll('Secondarycomponent', 'SecondaryComponent');
  } else if (resultString.contains('Specialcomponent')) {
    resultString = resultString.replaceAll('Specialcomponent', 'SpecialComponent');
  } else if (resultString.startsWith('component')) {
    resultString = '${resultString}Color';
  } else if (resultString == 'textDisabledColor') {
    resultString = 'textColorDisabled';
  } else if (resultString.startsWith('fontWhite')) {
    resultString = resultString.replaceAll('fontWhite', 'fontWhColor');
  } else if (resultString.startsWith('fontGray')) {
    resultString = resultString.replaceAll('fontGray', 'fontGyColor');
  }
  return resultString;
}

Map<String, dynamic> convertCssToJson(String cssContent) {
  final jsonMap = <String, dynamic>{};
  final lines = cssContent.split('\n');
  for (final line in lines) {
    final trimmedLine = line.trim();
    if (trimmedLine.isNotEmpty && !trimmedLine.startsWith('//')) {
      final parts = trimmedLine.split(':');
      if (parts.length == 2) {
        final key = parts[0].trim();
        final value = parts[1].trim();
        jsonMap[key] = value;
      }
    }
  }
  return jsonMap;
}
