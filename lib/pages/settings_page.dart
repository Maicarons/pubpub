import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../controllers/settings_controller.dart';
import 'about_page.dart';

/// Pub 镜像源列表
const List<_MirrorSource> _pubMirrorSources = [
  _MirrorSource(
    name: 'Flutter 中国 (flutter-io.cn)',
    url: 'https://pub.flutter-io.cn',
  ),
  _MirrorSource(
    name: 'Flutter 中国 (storage.flutter-io.cn)',
    url: 'https://storage.flutter-io.cn',
  ),
  _MirrorSource(
    name: '官方 (pub.dev)',
    url: 'https://pub.dev',
  ),
  _MirrorSource(
    name: '清华 TUNA',
    url: 'https://mirrors.tuna.tsinghua.edu.cn/dart-pub',
  ),
  _MirrorSource(
    name: '上海交大 SJTU',
    url: 'https://mirror.sjtu.edu.cn/dart-pub',
  ),
];

/// GitHub Raw 镜像源列表
const List<String> _githubRawMirrors = [
  'raw.githubusercontent.com',
  'raw.gitmirror.com',
  'raw.kkgithub.com',
];

class _MirrorSource {
  final String name;
  final String url;
  const _MirrorSource({required this.name, required this.url});
}

/// 设置内容
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCtrl = Get.find<SettingsController>();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(
          title: 'Pub 镜像源',
          children: [
            Obx(() => _buildPubSourceDropdown(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: 'GitHub 镜像源',
          children: [
            Obx(() => _buildGithubMirrorDropdown(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '自动翻译',
          children: [
            _buildTranslationSettings(context, settingsCtrl),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '外观',
          children: [
            _buildThemeTile(context, settingsCtrl),
            const Divider(height: 1),
            Obx(() => _buildColorSchemeSection(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '数据',
          children: [
            _buildCacheTile(context, settingsCtrl),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: '关于',
          children: [
            ListTile(
              leading: const Icon(TDIcons.info_circle),
              title: const Text('关于 PubPub'),
              subtitle: const Text('版本 1.0.0'),
              trailing: const Icon(TDIcons.chevron_right),
              onTap: () => Get.to(() => const AboutPage()),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
        ),
        Card(child: Column(children: children)),
      ],
    );
  }

  // ==================== Pub 镜像源下拉 ====================

  Widget _buildPubSourceDropdown(SettingsController ctrl) {
    final currentUrl = ctrl.currentSource.value;
    final selected = _pubMirrorSources.firstWhere(
      (s) => s.url == currentUrl,
      orElse: () => _pubMirrorSources.first,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(TDIcons.link, size: 20),
              const SizedBox(width: 12),
              const Text('Pub 镜像源', style: TextStyle(fontSize: 15)),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: selected.url,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: _pubMirrorSources.map((source) {
              return DropdownMenuItem(
                value: source.url,
                child: Text(source.name, style: const TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                ctrl.setSource(value);
              }
            },
          ),
          const SizedBox(height: 4),
          Text(
            '切换后将使用新的镜像源搜索和获取包信息',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  // ==================== GitHub 镜像源下拉 ====================

  Widget _buildGithubMirrorDropdown(SettingsController ctrl) {
    final currentMirror = ctrl.githubRawMirror.value;
    final selected = _githubRawMirrors.contains(currentMirror)
        ? currentMirror
        : _githubRawMirrors.first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(TDIcons.logo_github, size: 20),
              const SizedBox(width: 12),
              const Text('GitHub Raw 镜像', style: TextStyle(fontSize: 15)),
            ],
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            initialValue: selected,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: _githubRawMirrors.map((mirror) {
              return DropdownMenuItem(
                value: mirror,
                child: Text(mirror, style: const TextStyle(fontSize: 14)),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                ctrl.setGithubRawMirror(value);
              }
            },
          ),
          const SizedBox(height: 4),
          Text(
            '用于获取包的 README，国内推荐使用镜像',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  // ==================== 主题 ====================

  Widget _buildThemeTile(BuildContext context, SettingsController ctrl) {
    return Obx(() {
      String themeText;
      switch (ctrl.themeMode.value) {
        case ThemeMode.light:
          themeText = '浅色模式';
          break;
        case ThemeMode.dark:
          themeText = '深色模式';
          break;
        default:
          themeText = '跟随系统';
      }

      return ListTile(
        leading: const Icon(TDIcons.sunny),
        title: const Text('主题'),
        subtitle: Text(themeText),
        trailing: const Icon(TDIcons.chevron_right),
        onTap: () => _showThemeDialog(context, ctrl),
      );
    });
  }

  void _showThemeDialog(BuildContext context, SettingsController ctrl) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('选择主题'),
        children: [
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.system);
              Navigator.pop(context);
            },
            child: const Text('跟随系统'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: const Text('浅色模式'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: const Text('深色模式'),
          ),
        ],
      ),
    );
  }

  // ==================== 主题色 ====================

  Widget _buildColorSchemeSection(SettingsController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(TDIcons.palette, size: 20),
              SizedBox(width: 12),
              Text('主题色', style: TextStyle(fontSize: 15)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: colorSchemeOptions.map((option) {
              final isSelected = ctrl.colorSchemeKey.value == option.key;
              return GestureDetector(
                onTap: () => ctrl.setColorScheme(option.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: option.color,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.white : Colors.transparent,
                      width: 3,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: option.color.withValues(alpha: 0.4),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: isSelected
                      ? const Icon(Icons.check, color: Colors.white, size: 24)
                      : null,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // ==================== 翻译设置 ====================

  Widget _buildTranslationSettings(
      BuildContext context, SettingsController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(TDIcons.translate, size: 20),
              const SizedBox(width: 12),
              const Text('OpenAI 兼容 API', style: TextStyle(fontSize: 15)),
              const Spacer(),
              Obx(() {
                final configured = ctrl.isTranslationConfigured;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: configured
                        ? Colors.green.withValues(alpha: 0.1)
                        : Colors.grey.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    configured ? '已配置' : '未配置',
                    style: TextStyle(
                      fontSize: 11,
                      color: configured ? Colors.green : Colors.grey,
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 12),
          // Endpoint
          Obx(() => TextField(
                controller: TextEditingController(
                    text: ctrl.translationEndpoint.value),
                decoration: const InputDecoration(
                  labelText: 'API Endpoint',
                  hintText: 'https://api.openai.com',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                onSubmitted: (v) => ctrl.setTranslationEndpoint(v),
              )),
          const SizedBox(height: 8),
          // API Key
          Obx(() => TextField(
                controller:
                    TextEditingController(text: ctrl.translationApiKey.value),
                decoration: const InputDecoration(
                  labelText: 'API Key',
                  hintText: 'sk-...',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                obscureText: true,
                onSubmitted: (v) => ctrl.setTranslationApiKey(v),
              )),
          const SizedBox(height: 8),
          // Model
          Obx(() => TextField(
                controller:
                    TextEditingController(text: ctrl.translationModel.value),
                decoration: const InputDecoration(
                  labelText: '模型',
                  hintText: 'gpt-4o-mini',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                onSubmitted: (v) => ctrl.setTranslationModel(v),
              )),
          const SizedBox(height: 8),
          // 目标语言
          Obx(() => TextField(
                controller: TextEditingController(
                    text: ctrl.translationTargetLang.value),
                decoration: const InputDecoration(
                  labelText: '目标语言',
                  hintText: '简体中文 / English / 日本語',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                onSubmitted: (v) => ctrl.setTranslationTargetLang(v),
              )),
          const SizedBox(height: 8),
          Text(
            '支持所有 OpenAI 兼容 API（OpenAI、DeepSeek、Moonshot 等）',
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  // ==================== 缓存 ====================

  Widget _buildCacheTile(BuildContext context, SettingsController ctrl) {
    return ListTile(
      leading: const Icon(TDIcons.delete),
      title: const Text('清除缓存'),
      subtitle: const Text('清除所有 API 缓存数据'),
      onTap: () => _showClearCacheDialog(context, ctrl),
    );
  }

  void _showClearCacheDialog(
      BuildContext context, SettingsController ctrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('清除缓存'),
        content: const Text('确定清除所有 API 缓存吗？收藏和设置不会被清除。'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          TextButton(
            onPressed: () {
              ctrl.clearCache();
              Navigator.pop(context);
            },
            child: const Text('确定'),
          ),
        ],
      ),
    );
  }
}
