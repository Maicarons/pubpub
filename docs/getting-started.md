---
title: 快速开始
---

# 快速开始

本页介绍如何在本地获取并运行 PubPub。

## 环境要求

- Flutter 3.41 或更高
- Dart 3.11 或更高
- Windows 桌面开发需要 Visual Studio 2022（含使用 C++ 的桌面开发工作负载）

## 获取源码

```bash
git clone https://github.com/Maicarons/pubpub.git
cd pubpub
```

## 安装依赖与代码生成

```bash
flutter pub get
flutter pub run build_runner build
```

## 运行

```bash
flutter run -d windows   # Windows
flutter run -d android   # Android
flutter run -d chrome    # Web
```

## 构建发布版本

```bash
flutter build windows
flutter build apk
flutter build web
```

## 数据源

应用默认使用国内镜像源 `https://pub.flutter-io.cn`，可在设置页切换为官方源 `https://pub.dev/api` 或其他镜像。详见 [API 说明](/api)。

## 文档站本地预览

本项目文档基于 VitePress 构建，可本地预览：

```bash
npm install
npm run docs:dev
```

构建静态站点：

```bash
npm run docs:build
```

## 下一步

- 了解 [架构设计](/architecture)
- 参与 [开发](/development)
- 学习 [本地化](/localization)
