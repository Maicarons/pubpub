# 更新日志

本项目遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。

## [0.2.0] - 2026-06-06

### 新增

- 🌍 新增 19 种语言支持：
  - 亚洲：日本語、한국어、简体中文、हिन्दी、বাংলা、ਪੰਜਾਬੀ、मराठी、తెలుగు、اردو、فارسی
  - 欧洲：English、Deutsch、Français、Italiano、Português、Español、Русский、Türkçe
  - 非洲：العربية、Kiswahili、Basa Jawa
- 🔄 RTL 布局支持：阿拉伯语、乌尔都语、波斯语从右到左显示

### 修复

- 🐛 恢复被误删的自动翻译设置功能
- 🐛 全面消除中文硬编码，所有界面文本使用 i18n 翻译

## [0.1.1] - 2026-06-06

### 新增

- 🌍 语言切换功能：支持跟随系统、简体中文、English
- 🖼️ 全平台应用图标：使用 flutter_launcher_icons 生成 Android/iOS/Web/Windows/macOS 图标

### 修复

- 🐛 修复 Android 无法联网问题：添加 INTERNET 权限到 release 版本
- 🐛 修复暗黑模式下底部导航栏颜色不正确
- 🐛 修复 Android 状态栏与应用内容重叠：添加 SafeArea
- 🐛 修复语言切换后不生效问题
- 🐛 修复依赖树组件暗黑模式下文本颜色不正确

### 优化

- ⚡ 界面文本全面使用 i18n 翻译（底部导航、设置页面、关于页面等）
- ⚡ 移除 Crowdin 集成，简化本地化流程
- ⚡ 应用图标替换为项目 Logo

## [0.1.0] - 2026-06-05

### 新增

- 🔍 包搜索功能，支持多个 Pub 镜像源
- 📦 包详情页：版本历史、依赖树、README 完整展示
- ❤️ 自定义收藏夹：创建/删除/重命名文件夹，分类管理收藏
- 🔄 响应式布局：移动端底部导航 / 桌面端侧边栏
- 💾 Hive 本地缓存 + 离线降级
- 🌐 Pub 镜像源切换（flutter-io.cn、pub.dev、清华、上交）
- 🌐 GitHub 镜像源切换（raw.githubusercontent.com、gitmirror、kkgithub）
- 🎨 10 种主题色 + 深色模式
- 🏠 主页默认展示热门推荐包
- 📱 桌面端卡片悬停动效
- 📋 旧版收藏数据自动迁移
- 🌍 i18n 国际化支持（中文/英文）
- 🤖 自动翻译功能（OpenAI 兼容 API）
- 🔄 应用内更新检查
- 📖 包 README 展示（支持 GitHub 镜像）
- 🔗 依赖包可点击跳转
- ℹ️ 关于页面
- 📝 完整 GitHub 项目配置（CI/CD、Issue 模板、PR 模板）
