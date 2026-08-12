---
title: Localization
---

# Localization Guide

## Overview

PubPub uses Flutter's official localization solution (`flutter_localizations` + `intl`) to support multiple languages.

## Supported languages

| Language | Code | ARB file |
|----------|------|----------|
| English | `en` | `lib/l10n/app_en.arb` |
| Chinese | `zh` | `lib/l10n/app_zh.arb` |

## Add a new language

### 1. Create the ARB file

Copy `lib/l10n/app_en.arb` and rename it to `lib/l10n/app_{code}.arb`, then translate all values.

### 2. Update configuration

Add the new language to `supportedLocales` in `lib/app.dart`:

```dart
supportedLocales: const [
  Locale('en'),
  Locale('zh'),
  Locale('ja'), // Japanese
],
```

Add a new option in `_showLanguageDialog` inside `lib/pages/settings_page.dart`:

```dart
SimpleDialogOption(
  onPressed: () {
    ctrl.setLocale(const Locale('ja'));
    Navigator.pop(context);
  },
  child: const Text('Japanese'),
),
```

### 3. Regenerate

```bash
flutter gen-l10n
```

### 4. Update display name

Add the new language's display name in `_buildLanguageTile` inside `lib/pages/settings_page.dart`:

```dart
case 'ja':
  langText = 'Japanese';
  break;
```

## ARB file format

ARB files are JSON with translation key-value pairs:

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

### Placeholders

Use the `{variable}` syntax to define placeholders:

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

## Use in code

### Option 1: context extension

```dart
import '../common/l10n_ext.dart';

// Inside a Widget
Text(context.l10n.appTitle)
```

### Option 2: direct access

```dart
import '../l10n/app_localizations.dart';

// Inside a Widget
Text(AppLocalizations.of(context)!.appTitle)
```

## Translation conventions

1. **Keys**: camelCase, semantically clear
2. **English**: source language, keep it concise
3. **Placeholders**: use `{name}` format and define `@key` in the ARB
4. **Plurals**: use ICU message format
5. **HTML**: avoid HTML tags inside translations

## File structure

```
lib/l10n/
├── app_en.arb              # English (source)
├── app_zh.arb              # Chinese
├── app_localizations.dart  # generated localization class
├── app_localizations_en.dart
├── app_localizations_zh.dart
└── untranslated.txt        # untranslated strings
```
