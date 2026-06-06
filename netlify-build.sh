#!/bin/bash
set -e

# 安装 Flutter SDK
FLUTTER_CHANNEL="stable"
FLUTTER_VERSION="${FLUTTER_VERSION:-3.41.9}"

echo "==> Installing Flutter $FLUTTER_VERSION ..."
git clone --depth 1 --branch $FLUTTER_VERSION https://github.com/flutter/flutter.git /opt/flutter
export PATH="/opt/flutter/bin:$PATH"

# 配置 Flutter
flutter config --no-analytics
flutter doctor --verbose

# 安装依赖
echo "==> Installing dependencies ..."
flutter pub get

# 生成代码
echo "==> Running build_runner ..."
dart run build_runner build --delete-conflicting-outputs

# 构建 Web
echo "==> Building web ..."
flutter build web --release

echo "==> Build complete!"
