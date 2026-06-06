# PubPub

<div align="center">

<img src="logo.png" alt="PubPub Logo" width="120" height="120">

![Flutter](https://img.shields.io/badge/Flutter-3.41+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.11+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-Apache%202.0-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20Web-lightgrey)

**Cross-platform Pub Mirror Browser** — Search, browse, and favorite Flutter/Dart packages

[中文](README.md) | [English](#features)

</div>

---

## Features

- 🔍 **Package Search** — Search via pub.flutter-io.cn mirror
- 📦 **Package Details** — Version history, dependencies, SDK constraints, links
- ❤️ **Custom Collections** — Create multiple folders to organize favorite packages
- 🔄 **Responsive Layout** — Mobile bottom nav / Desktop sidebar auto-switch
- 💾 **Local Cache** — Hive caching with offline fallback
- 🌐 **Mirror Switching** — Switch between multiple Pub mirror sources
- 🎨 **Theme Support** — System / Light / Dark mode

## Getting Started

### Prerequisites

- Flutter 3.41+
- Dart 3.11+

### Installation

```bash
# Clone the repository
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
├── layouts/                      # Responsive layouts (mobile/desktop)
├── pages/                        # Pages (home, detail, favorites, settings)
└── widgets/                      # Reusable widgets
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

The app uses Pub mirror APIs:

```
GET /api/search?q={query}&page={page}    # Search packages
GET /api/packages/{name}                  # Get package details
```

Default mirror: `https://pub.flutter-io.cn`

## Built-in Mirrors

| Mirror | URL |
|--------|-----|
| Flutter China | `https://pub.flutter-io.cn` |
| Flutter China (Storage) | `https://storage.flutter-io.cn` |
| Official (pub.dev) | `https://pub.dev` |
| Tsinghua TUNA | `https://mirrors.tuna.tsinghua.edu.cn/dart-pub` |
| SJTU | `https://mirror.sjtu.edu.cn/dart-pub` |

## Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Apache 2.0 — See [LICENSE](LICENSE)

## Acknowledgements

- [Flutter](https://flutter.dev)
- [pub.dev](https://pub.dev)
- [TDesign Flutter](https://github.com/Tencent/tdesign-flutter)
