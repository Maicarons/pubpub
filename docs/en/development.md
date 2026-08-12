---
title: Development
---

# Development Guide

## Environment setup

### Dependencies

- Flutter 3.41+
- Dart 3.11+
- Visual Studio 2022 (Windows desktop development)

### Initialize

```bash
# Clone
git clone https://github.com/Maicarons/pubpub.git
cd pubpub

# Dependencies
flutter pub get

# Code generation
flutter pub run build_runner build

# Run
flutter run -d windows
```

## Development workflow

### 1. Create a branch

```bash
git checkout -b feature/your-feature
```

### 2. Develop

Use hot reload while editing code:

- `r` — Hot reload
- `R` — Hot restart

### 3. Code checks

```bash
# Static analysis
flutter analyze

# Tests
flutter test
```

### 4. Commit

```bash
git add .
git commit -m "feat: your feature description"
```

### 5. Push & PR

```bash
git push origin feature/your-feature
```

Then open a Pull Request on GitHub.

## Code conventions

### Naming

- Files: `snake_case.dart`
- Classes: `PascalCase`
- Variables / methods: `camelCase`
- Constants: `camelCase` (Dart style)

### File organization

```
lib/
├── common/       # global constants, utilities
├── models/       # data models (match API)
├── services/     # data layer (API, cache)
├── controllers/  # business logic (GetX)
├── layouts/      # layout scaffolding
├── pages/        # page content
└── widgets/      # reusable components
```

### Comments

- Public APIs must have `///` doc comments
- Add inline comments for complex logic
- Use English comments

## Common tasks

### Add a new page

1. Create the page file under `pages/`
2. Register it in `layouts/mobile_layout.dart` and `desktop_layout.dart`
3. If a new controller is needed, create and register it under `controllers/`

### Add a new API

1. Create the data model under `models/`
2. Run `flutter pub run build_runner build`
3. Add the request method in `services/api_service.dart`

### Change theme

Edit the `ThemeData` configuration in `lib/app.dart`.

## Debugging

### View logs

Use `AppLogger` to emit logs:

```dart
import '../common/logger.dart';

AppLogger.d('Tag', 'Debug message');
AppLogger.e('Tag', 'Error message', error);
```

### DevTools

A DevTools URL is printed at runtime:

```
http://127.0.0.1:xxxxx/xxx=/devtools/
```

Use DevTools to inspect:

- Widget tree
- State
- Network requests
- Performance
