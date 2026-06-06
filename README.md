# PubPub

<div align="center">

<img src="logo.png" alt="PubPub Logo" width="120" height="120">

![Flutter](https://img.shields.io/badge/Flutter-3.41+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.11+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-Apache%202.0-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20Web-lightgrey)

**Cross-platform Pub Package Browser** — Search, browse, and favorite Flutter/Dart packages

[English](#features) | [中文](README.zh.md#功能特性)

</div>

---

## Features

- 🔍 **Package Search** — Search via multiple Pub mirror sources
- 📦 **Package Details** — Version history, dependency tree, README display
- ❤️ **Custom Collections** — Create multiple folders to organize favorites
- 🔄 **Responsive Layout** — Mobile bottom navigation / Desktop sidebar auto-switch
- 💾 **Local Cache** — Hive cache + offline fallback, browse without network
- 🌐 **Mirror Sources** — Switch between different Pub mirrors
- 🎨 **Theme Support** — System / Light / Dark mode with 10 theme colors
- 🌍 **Multi-language** — 22 languages supported, including RTL layout

## Supported Languages

| Region | Languages |
|--------|-----------|
| Asia | 简体中文、日本語、한국어、हिन्दी、বাংলা、ਪੰਜਾਬੀ、मराठी、తెలుగు、اردو、فارسی |
| Europe | English、Deutsch、Français、Italiano、Português、Español、Русский、Türkçe |
| Africa | العربية、Kiswahili、Basa Jawa |

> Arabic, Urdu, and Persian support RTL (Right-to-Left) layout

## Getting Started

### Requirements

- Flutter 3.41+
- Dart 3.11+

### Install & Run

```bash
# Clone repository
git clone https://github.com/your-username/pubpub.git
cd pubpub

# Install dependencies
flutter pub get

# Generate serialization code
flutter pub run build_runner build

# Run
flutter run -d windows   # Windows
flutter run -d android   # Android
flutter run -d chrome    # Web
```

### Build Release

```bash
flutter build windows
flutter build apk
flutter build web
```

## Project Structure

```
lib/
├── main.dart                     # App entry point
├── app.dart                      # GetMaterialApp configuration
├── common/                       # Constants, cache keys, logger
├── models/                       # Data models
├── services/                     # API, cache, favorites, settings
├── controllers/                  # GetX controllers
├── layouts/                      # Responsive layout (mobile/desktop)
├── pages/                        # Pages (home, detail, favorites, settings)
└── widgets/                      # Shared widgets
```

## Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter 3.41 |
| State Management | GetX |
| Networking | Dio |
| Local Storage | Hive |
| UI Components | TDesign Flutter |
| Code Generation | json_serializable |

## API

The app uses Pub mirror API:

```
GET /api/search?q={query}&page={page}    # Search packages
GET /api/packages/{name}                  # Get package details
```

Default mirror: `https://pub.flutter-io.cn`

## Contributing

Contributions welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Apache 2.0 — See [LICENSE](LICENSE)

## Acknowledgements

- [Flutter](https://flutter.dev)
- [pub.dev](https://pub.dev)
- [TDesign Flutter](https://github.com/Tencent/tdesign-flutter)
