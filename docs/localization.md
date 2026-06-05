# 本地化指南

## 概述

PubPub 使用 Flutter 的官方本地化方案（`flutter_localizations` + `intl`），支持多语言。

## 支持的语言

| 语言 | 代码 | ARB 文件 |
|------|------|----------|
| English | `en` | `lib/l10n/app_en.arb` |
| 中文 | `zh` | `lib/l10n/app_zh.arb` |

## 添加新语言

### 1. 创建 ARB 文件

复制 `lib/l10n/app_en.arb` 并重命名为 `lib/l10n/app_{语言代码}.arb`，翻译所有值。

### 2. 更新配置

在 `lib/app.dart` 的 `supportedLocales` 中添加新语言：

```dart
supportedLocales: const [
  Locale('en'),
  Locale('zh'),
  Locale('ja'), // 日语
],
```

### 3. 重新生成

```bash
flutter gen-l10n
```

## ARB 文件格式

ARB 文件是 JSON 格式，包含翻译键值对：

```json
{
  "@@locale": "en",
  "hello": "Hello",
  "greeting": "Hello, {name}!",
  "@greeting": {
    "placeholders": {
      "name": {
        "type": "String"
      }
    }
  }
}
```

### 占位符

使用 `{变量名}` 语法定义占位符：

```json
{
  "version": "Version {version}",
  "@version": {
    "placeholders": {
      "version": {
        "type": "String"
      }
    }
  }
}
```

## 在代码中使用

### 方法一：使用 context 扩展

```dart
import '../common/l10n_ext.dart';

// 在 Widget 中
Text(context.l10n.appTitle)
```

### 方法二：直接使用

```dart
import '../l10n/app_localizations.dart';

// 在 Widget 中
Text(AppLocalizations.of(context)!.appTitle)
```

## Crowdin 集成

项目已配置 Crowdin 集成，方便翻译管理。

### 配置

1. 在 [Crowdin](https://crowdin.com) 创建项目
2. 设置环境变量：
   - `CROWDIN_PROJECT_ID` - 项目 ID
   - `CROWDIN_PERSONAL_TOKEN` - 个人访问令牌

### 上传源文件

```bash
crowdin upload sources
```

### 下载翻译

```bash
crowdin download
```

### 上传翻译

```bash
crowdin upload translations
```

## 翻译规范

1. **键名**：使用 camelCase，语义清晰
2. **英文**：作为源语言，保持简洁
3. **占位符**：使用 `{name}` 格式，ARB 中需要定义 `@key`
4. **复数**：使用 ICU 消息格式
5. **HTML**：避免在翻译中使用 HTML 标签

## 文件结构

```
lib/l10n/
├── app_en.arb              # 英文翻译（源）
├── app_zh.arb              # 中文翻译
├── app_localizations.dart  # 生成的本地化类
├── app_localizations_en.dart
├── app_localizations_zh.dart
└── untranslated.txt        # 未翻译的字符串
```
