# PubPub

<div align="center">

<img src="logo.png" alt="PubPub Logo" width="120" height="120">

![Flutter](https://img.shields.io/badge/Flutter-3.41+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.11+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-Apache%202.0-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20Web-lightgrey)

**跨平台 Pub 包浏览器** — 搜索、浏览、收藏 Flutter/Dart 包

[English](#features) | [中文](#功能特性)

</div>

---

## 功能特性

- 🔍 **包搜索** — 支持镜像源搜索
- 📦 **包详情** — 版本信息、依赖树、评分、许可证
- ❤️ **自定义收藏夹** — 创建多个收藏夹，分类管理收藏的包
- 🔄 **响应式布局** — 移动端底部导航 / 桌面端侧边栏自动切换
- 💾 **本地缓存** — Hive 缓存 + 离线降级，断网也能浏览
- 🌐 **源切换** — 支持切换不同的 Pub 镜像源
- 🎨 **主题适配** — 跟随系统 / 浅色 / 深色模式

## 快速开始

### 环境要求

- Flutter 3.41+
- Dart 3.11+

### 安装与运行

```bash
# 克隆仓库
git clone https://github.com/your-username/pubpub.git
cd pubpub

# 安装依赖
flutter pub get

# 生成序列化代码
flutter pub run build_runner build

# 运行
flutter run -d windows   # Windows
flutter run -d android   # Android
flutter run -d chrome    # Web
```

### 构建发布版

```bash
flutter build windows
flutter build apk
flutter build web
```

## 项目结构

```
lib/
├── main.dart                     # 应用入口
├── app.dart                      # GetMaterialApp 配置
├── common/                       # 常量、缓存 key、日志
├── models/                       # 数据模型
├── services/                     # API、缓存、收藏、设置服务
├── controllers/                  # GetX 控制器
├── layouts/                      # 响应式布局（移动端/桌面端）
├── pages/                        # 页面（首页、详情、收藏、设置）
└── widgets/                      # 公共组件
```

## 技术栈

| 类别 | 技术 |
|------|------|
| 框架 | Flutter 3.41 |
| 状态管理 | GetX |
| 网络 | Dio |
| 本地存储 | Hive |
| UI 组件库 | TDesign Flutter |
| 代码生成 | json_serializable |

## API

应用使用 Pub 镜像站 API：

```
GET /api/search?q={query}&page={page}    # 搜索包
GET /api/packages/{name}                  # 获取包详情
```

默认镜像源：`https://pub.flutter-io.cn`

## 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 许可证

Apache 2.0 — 详见 [LICENSE](LICENSE)

## 致谢

- [Flutter](https://flutter.dev)
- [pub.dev](https://pub.dev)
- [TDesign Flutter](https://github.com/Tencent/tdesign-flutter)
