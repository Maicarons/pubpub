// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'PubPub';

  @override
  String get appDescription => '跨平台 Pub 镜像浏览器';

  @override
  String get navSearch => '搜索';

  @override
  String get navFavorites => '收藏';

  @override
  String get navSettings => '设置';

  @override
  String get searchHint => '搜索 Flutter/Dart 包...';

  @override
  String get searchFailed => '搜索失败，请检查网络连接';

  @override
  String get searchEmpty => '搜索你需要的 Flutter/Dart 包';

  @override
  String get searchNoResults => '未找到相关包';

  @override
  String get hotRecommend => '热门推荐';

  @override
  String get retry => '重试';

  @override
  String get install => '安装';

  @override
  String get terminal => '终端';

  @override
  String get readme => 'README';

  @override
  String get loadingReadme => '加载 README...';

  @override
  String get about => '关于';

  @override
  String get topics => '主题标签';

  @override
  String get details => '详情';

  @override
  String get language => '语言';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get languageSystem => '跟随系统';

  @override
  String get checkUpdate => '检查更新';

  @override
  String get autoTranslate => '自动翻译';

  @override
  String get autoTranslateDesc => 'OpenAI 兼容 API 翻译简介/README';

  @override
  String get latestVersion => '最新版本';

  @override
  String get publishDate => '发布时间';

  @override
  String get dartSdk => 'Dart SDK';

  @override
  String get flutterSdk => 'Flutter SDK';

  @override
  String get dependencyCount => '依赖数';

  @override
  String get links => '链接';

  @override
  String get homepage => '主页';

  @override
  String get repository => '仓库';

  @override
  String get dependencies => '依赖';

  @override
  String get noDependencies => '无直接依赖';

  @override
  String get versionHistory => '版本历史';

  @override
  String moreVersions(int count) {
    return '还有 $count 个历史版本...';
  }

  @override
  String get latest => '最新';

  @override
  String get copied => '已复制';

  @override
  String get copiedToClipboard => '代码已复制到剪贴板';

  @override
  String get favoritesFolders => '收藏夹';

  @override
  String get noFavorites => '还没有收藏任何包';

  @override
  String get noFavoritesHint => '在搜索结果中点击爱心图标收藏';

  @override
  String emptyFolder(String name) {
    return '\"$name\" 暂无收藏';
  }

  @override
  String get createFolder => '新建收藏夹';

  @override
  String get folderName => '收藏夹名称';

  @override
  String get create => '创建';

  @override
  String get rename => '重命名';

  @override
  String get delete => '删除';

  @override
  String get renameFolder => '重命名收藏夹';

  @override
  String get deleteFolder => '删除收藏夹';

  @override
  String deleteFolderConfirm(String name) {
    return '确定删除 \"$name\" 吗？其中的包将被移除。';
  }

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确定';

  @override
  String get folderExists => '收藏夹已存在';

  @override
  String removeFromFolder(String folder) {
    return '从 \"$folder\" 移除？';
  }

  @override
  String get removeFavorite => '取消收藏';

  @override
  String removeFavoriteConfirm(String name) {
    return '确定取消收藏 \"$name\" 吗？';
  }

  @override
  String get addToOtherFolders => '添加到其他收藏夹';

  @override
  String get selectFolder => '选择收藏夹';

  @override
  String get createAndAdd => '创建并收藏';

  @override
  String favoriteManaged(String folders) {
    return '已收藏到：$folders';
  }

  @override
  String get cancelAllFavorites => '取消所有收藏';

  @override
  String get pubMirror => 'Pub 镜像源';

  @override
  String get pubMirrorHint => '切换后将使用新的镜像源搜索和获取包信息';

  @override
  String get githubMirror => 'GitHub 镜像源';

  @override
  String get githubRawMirror => 'GitHub Raw 镜像';

  @override
  String get githubMirrorHint => '用于获取包的 README，国内推荐使用镜像';

  @override
  String get appearance => '外观';

  @override
  String get theme => '主题';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色模式';

  @override
  String get themeDark => '深色模式';

  @override
  String get selectTheme => '选择主题';

  @override
  String get themeColor => '主题色';

  @override
  String get data => '数据';

  @override
  String get clearCache => '清除缓存';

  @override
  String get clearCacheSubtitle => '清除所有 API 缓存数据';

  @override
  String get clearCacheTitle => '清除缓存';

  @override
  String get clearCacheConfirm => '确定清除所有 API 缓存吗？收藏和设置不会被清除。';

  @override
  String get cacheCleared => '缓存已清除';

  @override
  String get aboutPubPub => '关于 PubPub';

  @override
  String version(String version) {
    return '版本 $version';
  }

  @override
  String get aboutTitle => '关于';

  @override
  String get aboutDescription => '跨平台 Pub 镜像浏览器';

  @override
  String get features => '功能特性';

  @override
  String get featureSearch => '包搜索';

  @override
  String get featureSearchDesc => '支持多个 Pub 镜像源搜索';

  @override
  String get featureDetail => '包详情';

  @override
  String get featureDetailDesc => '版本、依赖、README 完整展示';

  @override
  String get featureFavorites => '自定义收藏夹';

  @override
  String get featureFavoritesDesc => '创建多个收藏夹分类管理';

  @override
  String get featureTheme => '主题定制';

  @override
  String get featureThemeDesc => '10 种主题色 + 深色模式';

  @override
  String get featureLayout => '响应式布局';

  @override
  String get featureLayoutDesc => '移动端/桌面端自适应';

  @override
  String get techStack => '技术栈';

  @override
  String get linksTitle => '链接';

  @override
  String get githubRepo => 'GitHub 仓库';

  @override
  String get pubDev => 'pub.dev';

  @override
  String get flutterOfficial => 'Flutter 官网';

  @override
  String get tdesign => 'TDesign Flutter';

  @override
  String get license => '开源许可';

  @override
  String get licenseApache => 'Apache License 2.0';

  @override
  String get copyright => 'Copyright © 2026 PubPub Contributors';

  @override
  String get madeWith => 'Made with ❤️ using Flutter';

  @override
  String get loading => '加载中...';

  @override
  String get error => '错误';

  @override
  String get success => '成功';

  @override
  String get ok => '确定';

  @override
  String get yes => '是';

  @override
  String get no => '否';

  @override
  String get defaultFolder => '默认收藏';

  @override
  String get detailFailed => '获取详情失败，请检查网络连接';

  @override
  String get tip => '提示';

  @override
  String get checkingUpdate => '正在检查更新...';

  @override
  String get alreadyLatest => '当前已是最新版本';

  @override
  String get close => '关闭';

  @override
  String get original => '原文';

  @override
  String get translated => '翻译';

  @override
  String get latestVersionLabel => '最新版本';

  @override
  String get publishTime => '发布时间';

  @override
  String get dependencyNum => '依赖数';

  @override
  String get colorBlue => '蓝色';

  @override
  String get colorIndigo => '靛蓝';

  @override
  String get colorPurple => '紫色';

  @override
  String get colorDeepPurple => '深紫';

  @override
  String get colorTeal => '青色';

  @override
  String get colorGreen => '绿色';

  @override
  String get colorOrange => '橙色';

  @override
  String get colorRed => '红色';

  @override
  String get colorPink => '粉色';

  @override
  String get colorBrown => '棕色';

  @override
  String get configured => '已配置';

  @override
  String get notConfigured => '未配置';

  @override
  String get modelLabel => '模型';

  @override
  String get targetLangLabel => '目标语言';

  @override
  String get targetLangHint => '简体中文 / English / 日本語';

  @override
  String get translateApiHint =>
      '支持所有 OpenAI 兼容 API（OpenAI、DeepSeek、Moonshot 等）';

  @override
  String get pubOfficial => '官方 (pub.dev)';

  @override
  String get tuna => '清华 TUNA';

  @override
  String get sjtu => '上海交大 SJTU';

  @override
  String get njtech => '南京工业 NJTech';

  @override
  String get cernet => '教育网 CERNET';

  @override
  String get flutterChina => 'Flutter 中国';

  @override
  String get mirrorNoSearch => '当前镜像源不支持搜索，请切换到支持搜索的源';

  @override
  String get mirrorSearchNotSupported => '不支持搜索';

  @override
  String get mirrorSearchSupported => '支持搜索';

  @override
  String get addCustomMirror => '添加自定义镜像';

  @override
  String get deleteMirror => '删除镜像源';

  @override
  String deleteMirrorConfirm(Object url) {
    return '确定删除 \"$url\" 吗？';
  }
}
