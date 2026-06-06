import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/l10n_ext.dart';
import '../controllers/detail_controller.dart';
import '../controllers/favorites_controller.dart';
import '../controllers/layout_controller.dart';
import '../models/package_detail.dart';
import '../services/translation_service.dart';
import '../widgets/dependency_tree.dart';
import '../widgets/loading_widget.dart';

/// 包详情内容
class DetailPage extends StatefulWidget {
  final String packageName;

  const DetailPage({super.key, required this.packageName});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailController detailCtrl;

  @override
  void initState() {
    super.initState();
    detailCtrl = Get.put(DetailController(), tag: widget.packageName);
    detailCtrl.fetchDetail(widget.packageName);
  }

  @override
  void dispose() {
    Get.delete<DetailController>(tag: widget.packageName);
    super.dispose();
  }

  TDThemeData get tdTheme => TDTheme.of(context);

  @override
  Widget build(BuildContext context) {
    final layoutCtrl = Get.find<LayoutController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.packageName),
        actions: [
          Obx(() {
            final favCtrl = Get.find<FavoritesController>();
            final isFav = favCtrl.isFavorite(widget.packageName);
            return IconButton(
              icon: Icon(
                isFav ? TDIcons.heart_filled : TDIcons.heart,
                color: isFav ? Colors.red : null,
              ),
              onPressed: () => _showFavoriteDialog(
                context,
                favCtrl,
                widget.packageName,
                isFav,
              ),
            );
          }),
        ],
      ),
      body: Obx(() {
        if (detailCtrl.isLoading.value) {
          return const LoadingWidget();
        }
        if (detailCtrl.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(TDIcons.error_circle,
                    size: 48, color: tdTheme.textColorPlaceholder),
                const SizedBox(height: 16),
                Text(detailCtrl.errorMessage.value),
                const SizedBox(height: 16),
                TDButton(
                  text: context.l10n.retry,
                  theme: TDButtonTheme.primary,
                  onTap: () => detailCtrl.fetchDetail(widget.packageName),
                ),
              ],
            ),
          );
        }
        final detail = detailCtrl.packageDetail.value;
        if (detail == null) {
          return const Center(child: Text('暂无数据'));
        }
        if (layoutCtrl.isDesktop) {
          return _buildDesktopLayout(detail);
        }
        return _buildMobileLayout(detail);
      }),
    );
  }

  // ==================== 布局 ====================

  Widget _buildMobileLayout(PackageDetail detail) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(detail),
          const SizedBox(height: 20),
          _buildInstallSection(detail),
          const SizedBox(height: 20),
          _buildReadmeSection(),
          const SizedBox(height: 20),
          _buildDescriptionSection(detail),
          if (detail.topics.isNotEmpty) ...[
            const SizedBox(height: 20),
            _buildTopicsSection(detail),
          ],
          const SizedBox(height: 20),
          _buildMetadataSection(detail),
          const SizedBox(height: 20),
          _buildLinksSection(detail),
          const SizedBox(height: 20),
          _buildDependenciesSection(detail),
          const SizedBox(height: 20),
          _buildVersionHistorySection(detail),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(PackageDetail detail) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 如果宽度不够，使用单列布局
        if (constraints.maxWidth < 700) {
          return _buildMobileLayout(detail);
        }
        final sidebarWidth = (constraints.maxWidth * 0.25).clamp(250.0, 350.0);
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(detail),
                    const SizedBox(height: 24),
                    _buildInstallSection(detail),
                    const SizedBox(height: 24),
                    _buildReadmeSection(),
                    const SizedBox(height: 24),
                    _buildDescriptionSection(detail),
                    if (detail.topics.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      _buildTopicsSection(detail),
                    ],
                    const SizedBox(height: 24),
                    _buildDependenciesSection(detail),
                    const SizedBox(height: 24),
                    _buildVersionHistorySection(detail),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              SizedBox(
                width: sidebarWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMetadataSection(detail),
                    const SizedBox(height: 20),
                    _buildLinksSection(detail),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==================== 头部 ====================

  Widget _buildHeader(PackageDetail detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                detail.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'v${detail.latestVersion}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (detail.description.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text(
            detail.description,
            style: TextStyle(
              fontSize: 15,
              color: tdTheme.textColorSecondary,
            ),
          ),
        ],
      ],
    );
  }

  // ==================== 安装方式 ====================

  Widget _buildInstallSection(PackageDetail detail) {
    final depCode = '${detail.name}: ^${detail.latestVersion}';
    final yamlCode = 'dependencies:\n  $depCode';
    final pubAddCode = 'flutter pub add ${detail.name}';

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.install,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildCodeBlock(context.l10n.terminal, pubAddCode),
            const SizedBox(height: 12),
            _buildCodeBlock('pubspec.yaml', yamlCode),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String label, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: tdTheme.textColorPlaceholder,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: code));
                Get.snackbar(context.l10n.copied, context.l10n.copiedToClipboard,
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 1));
              },
              child: Icon(TDIcons.copy,
                  size: 16,
                  color: tdTheme.textColorPlaceholder),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: tdTheme.bgColorSecondaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              color: tdTheme.textColorPrimary,
            ),
          ),
        ),
      ],
    );
  }

  // ==================== README ====================

  Widget _buildReadmeSection() {
    return Obx(() {
      final readme = detailCtrl.readmeContent.value;
      if (readme.isEmpty) {
        if (detailCtrl.isLoadingReadme.value) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    context.l10n.loadingReadme,
                    style: TextStyle(
                        color: tdTheme.textColorPlaceholder),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      }

      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'README',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Obx(() {
                    if (detailCtrl.isTranslatingReadme.value) {
                      return const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    }
                    if (!TranslationService.isConfigured()) {
                      return const SizedBox.shrink();
                    }
                    return TextButton.icon(
                      onPressed: () => detailCtrl.translateReadme(),
                      icon: Icon(
                        TDIcons.translate,
                        size: 16,
                        color: tdTheme.textColorLink,
                      ),
                      label: Text(
                        detailCtrl.showTranslatedReadme.value ? context.l10n.original : context.l10n.translated,
                        style: TextStyle(
                          fontSize: 13,
                          color: tdTheme.textColorLink,
                        ),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 12),
              Obx(() {
                final content =
                    detailCtrl.showTranslatedReadme.value &&
                            detailCtrl.translatedReadme.isNotEmpty
                        ? detailCtrl.translatedReadme.value
                        : readme;
                return MarkdownBody(
                  data: content,
                onTapLink: (text, href, title) {
                  if (href != null) launchUrl(Uri.parse(href));
                },
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: tdTheme.textColorPrimary,
                  ),
                  h1: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: tdTheme.textColorPrimary,
                  ),
                  h2: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: tdTheme.textColorPrimary,
                  ),
                  h3: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: tdTheme.textColorPrimary,
                  ),
                  code: TextStyle(
                    fontSize: 13,
                    backgroundColor:
                        tdTheme.bgColorSecondaryContainer,
                    fontFamily: 'monospace',
                    color: tdTheme.textColorPrimary,
                  ),
                  codeblockDecoration: BoxDecoration(
                    color: tdTheme.bgColorSecondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  blockquoteDecoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: tdTheme.componentBorderColor,
                        width: 3,
                      ),
                    ),
                  ),
                  blockquote: TextStyle(
                    color: tdTheme.textColorSecondary,
                  ),
                  a: TextStyle(
                    color: tdTheme.textColorLink,
                  ),
                ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }

  // ==================== 描述 ====================

  Widget _buildDescriptionSection(PackageDetail detail) {
    if (detail.description.isEmpty) return const SizedBox.shrink();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.l10n.about,
                  style:
                      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Obx(() {
                  if (detailCtrl.isTranslatingDescription.value) {
                    return const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  if (!TranslationService.isConfigured()) {
                    return const SizedBox.shrink();
                  }
                  return TextButton.icon(
                    onPressed: () => detailCtrl.translateDescription(),
                    icon: Icon(
                      TDIcons.translate,
                      size: 16,
                      color: tdTheme.textColorLink,
                    ),
                    label: Text(
                      detailCtrl.showTranslatedDescription.value
                          ? context.l10n.original
                          : context.l10n.translated,
                      style: TextStyle(
                        fontSize: 13,
                        color: tdTheme.textColorLink,
                      ),
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(height: 8),
            Obx(() {
              final text =
                  detailCtrl.showTranslatedDescription.value &&
                          detailCtrl.translatedDescription.isNotEmpty
                      ? detailCtrl.translatedDescription.value
                      : detail.description;
              return Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.6,
                  color: tdTheme.textColorPrimary,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  // ==================== 主题标签 ====================

  Widget _buildTopicsSection(PackageDetail detail) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: detail.topics.map((topic) {
        return Chip(
          label: Text(topic, style: const TextStyle(fontSize: 12)),
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      }).toList(),
    );
  }

  // ==================== 元数据 ====================

  Widget _buildMetadataSection(PackageDetail detail) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.details,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            _buildMetaRow(context.l10n.latestVersionLabel, detail.latestVersion),
            if (detail.published.isNotEmpty)
              _buildMetaRow(context.l10n.publishTime, _formatDate(detail.published)),
            if (detail.dartSdkConstraint.isNotEmpty)
              _buildMetaRow('Dart SDK', detail.dartSdkConstraint),
            if (detail.flutterSdkConstraint != null)
              _buildMetaRow('Flutter SDK', detail.flutterSdkConstraint!),
            _buildMetaRow(context.l10n.dependencyNum, '${detail.dependencies.length}'),
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: TextStyle(
                  color: tdTheme.textColorPlaceholder),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: tdTheme.textColorPrimary),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String iso) {
    try {
      final dt = DateTime.parse(iso);
      return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    } catch (_) {
      return iso;
    }
  }

  // ==================== 链接 ====================

  Widget _buildLinksSection(PackageDetail detail) {
    final links = <_LinkItem>[];
    if (detail.homepage.isNotEmpty) {
      links.add(_LinkItem(context.l10n.homepage, TDIcons.link, detail.homepage));
    }
    if (detail.repository.isNotEmpty) {
      links.add(_LinkItem(context.l10n.repository, TDIcons.logo_github, detail.repository));
    }
    links.add(_LinkItem(
      'pub.dev',
      TDIcons.link,
      'https://pub.dev/packages/${detail.name}',
    ));

    if (links.isEmpty) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.links,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            ...links.map((link) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: InkWell(
                    onTap: () => launchUrl(Uri.parse(link.url)),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 4),
                      child: Row(
                        children: [
                          Icon(link.icon,
                              size: 16,
                              color: tdTheme.textColorPlaceholder),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              link.label,
                              style: TextStyle(
                                color: tdTheme.textColorLink,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // ==================== 依赖 ====================

  Widget _buildDependenciesSection(PackageDetail detail) {
    final deps = detail.dependencies;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.l10n.dependencies} (${deps.length})',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            if (deps.isEmpty)
              Text(context.l10n.noDependencies,
                  style: TextStyle(
                      color: tdTheme.textColorPlaceholder))
            else
              DependencyTree(dependencies: deps),
          ],
        ),
      ),
    );
  }

  // ==================== 版本历史 ====================

  Widget _buildVersionHistorySection(PackageDetail detail) {
    final versions = detail.versions ?? [];
    if (versions.isEmpty) return const SizedBox.shrink();

    final recent = versions.reversed.take(20).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.l10n.versionHistory} (${versions.length})',
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...recent.map((v) => _buildVersionTile(v)),
            if (versions.length > 20)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  context.l10n.moreVersions(versions.length - 20),
                  style: TextStyle(
                      color: tdTheme.textColorPlaceholder,
                      fontSize: 13),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVersionTile(PackageVersionEntry v) {
    final isLatest =
        v.version == detailCtrl.packageDetail.value?.latestVersion;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Flexible(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isLatest
                    ? Colors.green.withValues(alpha: 0.15)
                    : tdTheme.bgColorSecondaryContainer,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                v.version ?? '',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isLatest ? FontWeight.w600 : FontWeight.normal,
                  color: isLatest
                      ? Colors.green
                      : (tdTheme.textColorPrimary),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (isLatest) ...[
            const SizedBox(width: 8),
            Text(context.l10n.latest,
                style: const TextStyle(fontSize: 11, color: Colors.green)),
          ],
          const Spacer(),
          if (v.published != null)
            Text(
              _formatDate(v.published!),
              style: TextStyle(
                  fontSize: 12,
                  color: tdTheme.textColorPlaceholder),
            ),
        ],
      ),
    );
  }

  // ==================== 收藏弹窗 ====================

  void _showFavoriteDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
    bool isFav,
  ) {
    if (isFav) {
      final folders = ctrl.getFoldersContaining(packageName);
      showModalBottomSheet(
        context: context,
        builder: (_) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  context.l10n.favoriteManaged(folders.join(", ")),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                leading:
                    const Icon(TDIcons.heart_filled, color: Colors.red),
                title: Text(context.l10n.cancelAllFavorites),
                onTap: () {
                  ctrl.removeFromAll(packageName);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(TDIcons.add),
                title: Text(context.l10n.addToOtherFolders),
                onTap: () {
                  Navigator.pop(context);
                  _showAddToFolderDialog(context, ctrl, packageName);
                },
              ),
            ],
          ),
        ),
      );
    } else {
      _showAddToFolderDialog(context, ctrl, packageName);
    }
  }

  void _showAddToFolderDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(context.l10n.selectFolder,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            ),
            const Divider(height: 1),
            ...ctrl.folders.keys.map((folderName) {
              final contains =
                  ctrl.folders[folderName]?.contains(packageName) ??
                      false;
              return ListTile(
                leading: Icon(
                  contains ? TDIcons.check : TDIcons.folder,
                  color: contains ? Colors.green : null,
                ),
                title: Text(folderName),
                onTap: () {
                  if (!contains) {
                    ctrl.addToFolder(folderName, packageName);
                  }
                  Navigator.pop(context);
                },
              );
            }),
            ListTile(
              leading: const Icon(TDIcons.add),
              title: Text(context.l10n.createFolder),
              onTap: () {
                Navigator.pop(context);
                _showCreateAndAddDialog(context, ctrl, packageName);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showCreateAndAddDialog(
    BuildContext context,
    FavoritesController ctrl,
    String packageName,
  ) {
    final textCtrl = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.createFolder),
        content: TextField(
          controller: textCtrl,
          autofocus: true,
          decoration: InputDecoration(
            hintText: context.l10n.folderName,
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () async {
              final name = textCtrl.text.trim();
              if (name.isNotEmpty) {
                await ctrl.createFolder(name);
                await ctrl.addToFolder(name, packageName);
              }
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: Text(context.l10n.createAndAdd),
          ),
        ],
      ),
    );
  }
}

class _LinkItem {
  final String label;
  final IconData icon;
  final String url;
  _LinkItem(this.label, this.icon, this.url);
}
