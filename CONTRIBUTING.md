# 贡献指南

感谢你对 PubPub 项目的关注！我们欢迎任何形式的贡献。

## 如何贡献

### 报告 Bug

1. 在 [Issues](https://github.com/your-username/pubpub/issues) 中搜索是否已有相同问题
2. 如果没有，创建一个新的 Issue，包含：
   - 清晰的标题和描述
   - 复现步骤
   - 预期行为与实际行为
   - 运行环境（Flutter 版本、操作系统等）

### 提交功能建议

1. 在 Issues 中创建 Feature Request
2. 描述你希望添加的功能和使用场景
3. 等待讨论和确认

### 提交代码

1. Fork 本仓库
2. 创建你的特性分支：`git checkout -b feature/amazing-feature`
3. 提交你的修改：`git commit -m 'feat: add amazing feature'`
4. 推送到分支：`git push origin feature/amazing-feature`
5. 创建一个 Pull Request

## 开发环境

```bash
# 克隆你的 Fork
git clone https://github.com/your-username/pubpub.git
cd pubpub

# 安装依赖
flutter pub get

# 生成代码
flutter pub run build_runner build

# 运行
flutter run -d windows
```

## 代码规范

- 遵循 [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- 运行 `flutter analyze` 确保无警告
- 每个 PR 只做一件事，保持简洁

### Commit 规范

使用 [Conventional Commits](https://www.conventionalcommits.org/zh-hans/)：

```
feat: 新功能
fix: 修复 Bug
docs: 文档更新
style: 代码格式（不影响功能）
refactor: 重构
test: 测试相关
chore: 构建/工具相关
```

## Pull Request 流程

1. 确保 `flutter analyze` 无错误
2. 确保现有测试通过：`flutter test`
3. 更新相关文档
4. PR 描述中说明修改内容和原因

## 行为准则

请阅读 [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md)，我们致力于为每个人提供友好的环境。

## 问题？

如有疑问，欢迎在 Issues 中提问。
