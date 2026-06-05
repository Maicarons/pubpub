# 开发指南

## 环境搭建

### 依赖

- Flutter 3.41+
- Dart 3.11+
- Visual Studio 2022（Windows 开发）

### 初始化

```bash
# 克隆
git clone https://github.com/your-username/pubpub.git
cd pubpub

# 依赖
flutter pub get

# 代码生成
flutter pub run build_runner build

# 运行
flutter run -d windows
```

## 开发流程

### 1. 创建分支

```bash
git checkout -b feature/your-feature
```

### 2. 开发

编辑代码后，使用热重载：
- `r` — Hot reload
- `R` — Hot restart

### 3. 代码检查

```bash
# 静态分析
flutter analyze

# 测试
flutter test
```

### 4. 提交

```bash
git add .
git commit -m "feat: your feature description"
```

### 5. 推送 & PR

```bash
git push origin feature/your-feature
```

然后在 GitHub 上创建 Pull Request。

## 代码规范

### 命名

- 文件名：`snake_case.dart`
- 类名：`PascalCase`
- 变量/方法：`camelCase`
- 常量：`camelCase`（Dart 风格）

### 文件组织

```
lib/
├── common/       # 全局常量、工具
├── models/       # 数据模型（与 API 对应）
├── services/     # 数据层（API、缓存）
├── controllers/  # 业务逻辑（GetX）
├── layouts/      # 布局框架
├── pages/        # 页面内容
└── widgets/      # 可复用组件
```

### 注释

- 公开 API 必须有文档注释 `///`
- 复杂逻辑添加行内注释
- 使用中文注释

## 常见任务

### 添加新页面

1. 在 `pages/` 创建页面文件
2. 在 `layouts/mobile_layout.dart` 和 `desktop_layout.dart` 中添加
3. 如需新控制器，在 `controllers/` 创建并注册

### 添加新 API

1. 在 `models/` 创建数据模型
2. 运行 `flutter pub run build_runner build` 生成代码
3. 在 `services/api_service.dart` 添加请求方法

### 修改主题

编辑 `lib/app.dart` 中的 `ThemeData` 配置。

## 调试

### 查看日志

使用 `AppLogger` 输出日志：

```dart
import '../common/logger.dart';

AppLogger.d('Tag', 'Debug message');
AppLogger.e('Tag', 'Error message', error);
```

### DevTools

运行时会显示 DevTools URL：
```
http://127.0.0.1:xxxxx/xxx=/devtools/
```

可用 DevTools 检查：
- Widget 树
- 状态
- 网络请求
- 性能
