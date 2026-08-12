---
title: Getting Started
---

# Getting Started

This page explains how to fetch and run PubPub locally.

## Requirements

- Flutter 3.41 or newer
- Dart 3.11 or newer
- Windows desktop development requires Visual Studio 2022 (with the "Desktop development with C++" workload)

## Get the source

```bash
git clone https://github.com/Maicarons/pubpub.git
cd pubpub
```

## Install dependencies and generate code

```bash
# Install Flutter dependencies
flutter pub get

# Generate JSON serialization code
flutter pub run build_runner build
```

## Run

```bash
flutter run -d windows   # Windows
flutter run -d android   # Android
flutter run -d chrome    # Web
```

## Build a release

```bash
flutter build windows
flutter build apk
flutter build web
```

## Data sources

The app defaults to the China mirror `https://pub.flutter-io.cn`. You can switch to the official source `https://pub.dev/api` or another mirror in Settings. See [API](/en/api).

## Preview the docs site locally

The documentation is built with VitePress and can be previewed locally:

```bash
npm install
npm run docs:dev
```

Build the static site:

```bash
npm run docs:build
```

## Next steps

- Learn the [Architecture](/en/architecture)
- Contribute via [Development](/en/development)
- Explore [Localization](/en/localization)
