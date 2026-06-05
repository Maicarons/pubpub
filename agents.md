```markdown
# Claude 项目指令：Flutter Pub 包浏览器（GetX + TDesign 版本，支持移动端与桌面端）

## 项目概述
开发一个跨平台的 Flutter 应用（**支持移动端 iOS/Android 和桌面端 Windows/macOS/Linux**,web端），用于浏览和搜索 [pub.dev](https://pub.dev) 上的 Dart/Flutter 包。支持从官方源和国内镜像源（`https://pub-web.flutter-io.cn`）获取数据，用户可自由切换源。

## 核心功能需求
1. **搜索包**  
   - 支持按包名关键词搜索，实时防抖。  
   - 展示搜索结果：包名、简短描述、最新版本、点赞数、Pub 分数（如果 API 提供）。  
   - 支持分页加载（滚动到底部自动加载下一页）。

2. **包详情页**  
   - 展示包的完整信息：  
     - 标题、描述、版本、发布者、许可证。  
     - 点赞数、分析分数、受欢迎度分数。  
     - 依赖关系（分为 `dependencies` 和 `dev_dependencies`）。  
     - 版本列表（支持点击查看某个版本的依赖信息）。  
   - 提供“打开主页”按钮（如果包提供了 `homepage` 或 `repository` 链接）。  
   - 提供“复制 `flutter pub add 包名`”命令的功能。

3. **数据源切换**  
   - 设置页面允许用户选择：  
     - **官方源** `https://pub.dev/api`  
     - **镜像源** `https://pub-web.flutter-io.cn/api`  
   - 切换后立即生效，后续所有 API 请求使用新源。  
   - 保存用户的源偏好（本地持久化）。

4. **本地缓存机制（必须）**  
   - 对 API 响应进行分级缓存：  
     - **搜索结果**：缓存 30 分钟，下次相同关键词搜索优先读取缓存。  
     - **包详情**：缓存 1 小时，因为版本变化不频繁。  
     - **热门包列表**：缓存 24 小时。  
   - 提供“手动清除缓存”功能（设置页一键清除）。  
   - 缓存使用 Hive 实现，存储为二进制格式以提升性能。  
   - 支持离线模式：当无网络时，自动展示缓存数据（如果有）。

5. **收藏功能**  
   - 用户可收藏喜欢的包。  
   - 在“我的收藏”页面查看收藏的包列表。  
   - 支持移除收藏。  
   - 收藏数据使用 Hive 单独存储，不参与 API 缓存清理。

## 技术选型（必须严格遵守）
| 类别       | 技术/库                          | 说明                                                                 |
| ---------- | -------------------------------- | -------------------------------------------------------------------- |
| UI 框架    | Flutter + **TDesign Flutter**    | 使用腾讯 TDesign 组件库（`tdesign_flutter`），确保界面美观、一致。    |
| 状态管理   | **GetX**                         | 使用 GetX 进行路由、状态管理和依赖注入。                             |
| 网络请求   | **Dio**                          | 结合拦截器实现缓存控制、错误处理、日志打印。                         |
| 本地存储   | **Hive**                         | 存储收藏列表、API 响应缓存、用户设置。                               |
| 序列化     | `json_annotation` + `json_serializable` | 定义 API 响应的数据模型。                                    |
| 日志       | `logger`                         | 便于调试网络请求和缓存。                                            |
| 响应式布局 | `flutter_layout_grid`（可选）    | 用于桌面端网格布局，也可使用 `Wrap` + `MediaQuery` 自行实现。       |

> **设计辅助**：AI 在生成 UI 时可调用 **MCP**（Model Context Protocol）工具或 **Skill**（如 Figma 设计转换）来辅助布局与配色，但最终输出必须是完整可运行的 Flutter 代码。

## 响应式布局要求（移动端 + 桌面端）

### 布局策略
- 使用 `LayoutBuilder` 或 `MediaQuery` 检测屏幕宽度，定义三个断点：
  - **移动端**：宽度 < 600px（单列布局，底部导航栏）。
  - **平板端**：600px ≤ 宽度 < 1200px（双列布局，侧边栏可折叠）。
  - **桌面端**：宽度 ≥ 1200px（多列网格布局，固定侧边栏 + 内容区）。

- 在 `GetMaterialApp` 的 `home` 中根据当前窗口大小**动态切换**顶层布局组件（`MobileScaffold` / `DesktopScaffold`），无需手动重启应用。

### 移动端 UI 设计
- **底部导航栏**：包含“首页”、“收藏”、“设置”三个标签（`TDTabBar`）。
- **首页**：顶部 `TDSearchBar`，下方为单列 `TDListView` 展示搜索结果。
- **详情页**：从底部弹出 `TDBottomSheet` 或全屏 `Get.to()` 跳转，使用 `TDSliverAppBar`。
- **侧边栏**（可选）：左侧可增加抽屉菜单（`TDDrawer`）用于切换源和清除缓存。

### 桌面端 UI 设计
- **整体布局**：左侧固定侧边栏（`TDNavigation`），右侧内容区。
  - 侧边栏宽度 260px，包含：
    - 应用 Logo 和标题。
    - 搜索框（固定在侧边栏顶部）。
    - 导航菜单：首页、收藏、设置。
    - 数据源切换控件（下拉菜单）。
    - 清除缓存按钮。
  - 右侧内容区：
    - **首页**：搜索结果使用网格布局（`TDGrid`），每行显示 2~4 个包卡片（根据窗口宽度自适应）。
    - **详情页**：右侧内容区直接替换为详情视图（不打开新页面），左侧侧边栏保持不变。支持通过路由参数或状态控制显示哪个页面。
- **窗口管理**：支持调整窗口大小时，网格列数自动变化；侧边栏宽度固定，内容区自适应。

### 自适应切换逻辑
- 使用 `GetX` 创建一个 `LayoutController`，监听窗口尺寸变化（通过 `WidgetsBindingObserver` 或 `debounce` 的 `LayoutBuilder`）。
- 当宽度跨越断点时，自动重新构建 `home` 的根布局（`MobileLayout` 或 `DesktopLayout`）。
- 布局切换时，需要保持页面状态（如当前搜索关键词、搜索结果、滚动位置），建议将页面内容封装为独立组件，顶层只替换结构。

## API 接口定义
所有接口的 `baseUrl` 根据用户选择的源动态变化。

### 1. 搜索包
```
GET /api/search?q={query}&page={page} (可选)
响应结构：
{
"packages": [
{
"package": "dio",
"description": "...",
"version": "5.4.0",
"likes": 1234,
"pubScore": 98,
"popularityScore": 0.97
}
],
"nextPage": "/api/search?q=dio&page=2"
}
```

### 2. 获取包详情
```
GET /api/packages/{package_name}
响应结构：
{
"name": "dio",
"latestVersion": "5.4.0",
"description": "...",
"publisher": { "name": "flutter.dev" },
"license": "MIT",
"likes": 1234,
"score": 98,
"popularityScore": 0.97,
"versions": [
{
"version": "5.4.0",
"published": "2024-01-01T00:00:00Z",
"dartVersion": ">=3.0.0 <4.0.0",
"flutterVersion": ">=3.10.0",
"dependencies": {
"http": "^1.0.0",
"path": "^1.8.0"
},
"dev_dependencies": { ... }
}
],
"homepage": "https://pub.dev/packages/dio",
"repository": "https://github.com/flutterchina/dio"
}
```

> **注意**：镜像站 `pub-web.flutter-io.cn` 的 API 结构与官方完全一致，只需替换 `baseUrl`。

## 项目结构（必须严格遵守）
```
lib/
├── main.dart                     # 应用入口，初始化 Hive、GetX 绑定
├── app.dart                      # 配置 GetMaterialApp 与主题，响应式根布局
├── common/
│   ├── constants.dart            # 默认源地址、缓存时长、布局断点常量
│   ├── cache_keys.dart           # Hive 存储的 key 定义
│   └── logger.dart               # 日志工具封装
├── models/                       # 数据模型（JSON 序列化）
│   ├── package_search_result.dart
│   ├── package_detail.dart
│   └── package_version.dart
├── services/
│   ├── api_service.dart          # Dio 封装，支持动态 baseUrl、缓存拦截器
│   ├── cache_service.dart        # Hive 缓存读写逻辑（通用方法）
│   ├── favorites_service.dart    # 收藏数据的 Hive 操作
│   └── settings_service.dart     # 用户设置（源偏好）的存储与读取
├── controllers/                  # GetX 控制器
│   ├── layout_controller.dart    # 响应式布局控制器（监听窗口尺寸，提供布局类型）
│   ├── search_controller.dart    # 搜索状态、分页、缓存策略
│   ├── detail_controller.dart    # 详情页数据获取与缓存
│   ├── favorites_controller.dart # 收藏列表管理
│   └── settings_controller.dart  # 源切换、清除缓存
├── pages/
│   ├── home_page.dart            # 主页内容（独立于布局脚手架，供移动/桌面复用）
│   ├── detail_page.dart          # 包详情内容
│   ├── favorites_page.dart       # 收藏内容
│   └── settings_page.dart        # 设置内容
├── layouts/
│   ├── adaptive_builder.dart     # 根据 LayoutController 切换 MobileLayout / DesktopLayout
│   ├── mobile_layout.dart        # 移动端脚手架（底部导航栏 + 页面切换）
│   ├── desktop_layout.dart       # 桌面端脚手架（左侧固定侧边栏 + 右侧内容区）
│   └── widgets/
│       ├── mobile_bottom_nav.dart
│       ├── desktop_sidebar.dart
│       └── page_navigation.dart  # 统一页面内容切换（不依赖具体布局）
└── widgets/
├── package_card.dart         # 搜索结果卡片（移动端为全宽卡片，桌面端为网格卡片）
├── dependency_tree.dart      # 展示依赖关系的树形组件
├── version_selector.dart     # 版本选择下拉框
└── loading_widget.dart       # 加载动画组件
```

## UI/UX 设计指南（美观大方，适配双端）

### 全局主题
- 使用 TDesign 的 `TDTheme`，支持亮色/暗色模式自动适配（`TDThemeMode.system`）。
- 桌面端鼠标悬停效果：卡片 hover 时轻微上浮 + 阴影（使用 `MouseRegion` + `AnimatedContainer`）。

### 移动端 UI 细节
- **搜索栏**：固定在顶部，带圆角和背景模糊（`TDSearchBar`）。
- **结果列表**：`TDListView.separated`，卡片之间间距 8dp，卡片内边距 12dp。
- **详情页**：使用 `TDSliverAppBar` 展开后显示包名和操作按钮（收藏、分享）；内容区域可滚动。
- **空状态**：使用 `TDEmpty` 配合插画。

### 桌面端 UI 细节
- **侧边栏**：背景色略浅于主背景，选中的菜单项高亮显示（`TDNavigation` 的 `selectedIndex`）。
- **内容区**：右侧顶部显示当前页面标题（可选面包屑）。
- **搜索结果网格**：每个卡片固定宽度约 320px，卡片内包含包图标、名称、描述、评分和收藏按钮。
- **详情页布局**：右侧内容区分为两栏（如果宽度足够）：左栏为包信息和版本选择，右栏为依赖树和元数据。使用 `TDGrid` 实现自适应分栏。

### 布局切换时的用户体验
- 切换布局时保持当前页面（例如在移动端浏览首页，切换到桌面端后依然显示首页）。
- 搜索状态（关键词、结果列表）在布局切换后不丢失。
- 详情页的滚动位置在布局切换后尽量恢复（可选实现）。

## 关键实现细节

### 1. 响应式布局控制器
```dart
class LayoutController extends GetxController {
  var screenWidth = 0.0.obs;
  LayoutType get layoutType {
    if (screenWidth.value < 600) return LayoutType.mobile;
    if (screenWidth.value < 1200) return LayoutType.tablet;
    return LayoutType.desktop;
  }

  void updateWidth(double width) {
    screenWidth.value = width;
  }
}
```
在根 Widget 中使用 `LayoutBuilder` 监听宽度变化并传递给控制器。

### 2. 本地缓存机制（必须完整实现）
- **缓存流程**：
    1. 发起请求前，先检查 Hive 中是否有有效缓存（根据 `cacheKey` 和时间戳）。
    2. 如果有且未过期，直接返回缓存数据，不发起网络请求。
    3. 如果无缓存或已过期，发起网络请求，成功后存入 Hive 并更新时间戳。
    4. 如果网络请求失败，但存在过期缓存，则降级返回过期缓存（离线模式）。
- **缓存结构**（使用 Hive Box）：
    - `api_cache` 盒：存储 `{ data: Map, timestamp: int, ttl: int }`。
    - `favorites` 盒：存储收藏的包名列表（`List<String>`）。
    - `settings` 盒：存储 `source`（字符串）、`themeMode`（字符串）。
- **清理缓存**：删除 `api_cache` 盒中所有条目，保留 `favorites` 和 `settings`。

### 3. Dio 缓存拦截器
手动实现 `CacheInterceptor`，在 `onResponse` 中将响应存入 Hive，在 `onRequest` 中尝试读取缓存并直接返回（使用 `handler.resolve`）。

### 4. 源切换后刷新逻辑
- 当用户在设置页切换 `source` 后，`SettingsController` 更新 `PUB_HOSTED_URL`。
- 触发所有涉及 API 请求的控制器（`SearchController`、`DetailController`）清空其内存缓存并重新发起请求。
- 不清除 Hive 中的旧源缓存（保留作为备用），但下次请求会以新源 URL 作为 key 的一部分重新缓存。

### 5. 依赖树递归展示限制
- 由于依赖可能形成循环引用，最多递归深度限制为 3 层。
- 仅展示直接依赖，不展示间接依赖（避免复杂度过高）。

## 开发步骤（供 Claude 参考）
1. 初始化 Flutter 项目，在 `pubspec.yaml` 中添加依赖：`get`, `dio`, `hive_flutter`, `tdesign_flutter`, `json_serializable` 等，并确保桌面端支持（`flutter config --enable-<platform>-desktop`）。
2. 初始化 Hive（在 `main()` 中注册适配器，打开盒子）。
3. 创建数据模型并生成序列化代码（运行 `build_runner`）。
4. 实现 `CacheService` 和 `SettingsService`（基于 Hive）。
5. 实现 `ApiService`（Dio + 自定义缓存拦截器）。
6. 实现 `LayoutController` 和响应式根布局（`AdaptiveBuilder`）。
7. 创建 GetX 业务控制器（`SearchController`, `DetailController`, `FavoritesController`, `SettingsController`）。
8. 构建移动端布局（`MobileLayout`）和桌面端布局（`DesktopLayout`）。
9. 构建各个内容页面（`HomePage`, `DetailPage`, `FavoritesPage`, `SettingsPage`），保证它们不依赖具体布局组件。
10. 将页面挂载到两个布局中（通过 `GetView` 或 `Obx` 切换右侧内容）。
11. 实现收藏功能（在卡片和详情页添加收藏按钮）。
12. 测试响应式切换（在桌面端改变窗口大小，验证布局变化）。
13. 测试缓存机制（断网后是否能读取缓存，源切换后缓存隔离）。
14. 优化 UI 适配（确保桌面端鼠标交互正常，移动端触摸友好）。

## 交付标准
AI 应生成一个完整的 Flutter 项目，包含：
- 所有上述目录下的 Dart 文件（内容自洽，能通过 `flutter run -d windows` 或 `flutter run -d android` 运行）。
- 一个完整可用的 `pubspec.yaml`，包含所有依赖及版本号（使用最新稳定版本）。
- 必要的 `assets`（如应用图标、空状态插画，可选）或 `README.md` 包含运行说明。
- 代码必须通过 `dart analyze` 无严重错误，且注释清晰。

> **额外要求**：AI 在生成过程中可调用 MCP 工具获取最新的 TDesign 组件文档，或使用 Skill 从 Figma 设计稿生成样式代码，但最终输出必须符合本指令的所有约束，**并且确保移动端和桌面端布局都能正常工作**。

开始生成前，请确认已理解上述所有要求。
```