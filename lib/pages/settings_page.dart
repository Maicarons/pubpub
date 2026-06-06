import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../common/l10n_ext.dart';
import '../controllers/settings_controller.dart';
import '../services/update_service.dart';
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
          title: context.l10n.pubMirror,
          children: [
            Obx(() => _buildPubSourceDropdown(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.githubRawMirror,
          children: [
            Obx(() => _buildGithubMirrorDropdown(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.appearance,
          children: [
            _buildThemeTile(context, settingsCtrl),
            const Divider(height: 1),
            _buildLanguageTile(context, settingsCtrl),
            const Divider(height: 1),
            Obx(() => _buildColorSchemeSection(settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.data,
          children: [
            _buildCacheTile(context, settingsCtrl),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.about,
          children: [
            ListTile(
              leading: const Icon(TDIcons.info_circle),
              title: Text(context.l10n.aboutPubPub),
              subtitle: Text(context.l10n.version(UpdateService.currentVersion)),
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
          themeText = context.l10n.themeLight;
          break;
        case ThemeMode.dark:
          themeText = context.l10n.themeDark;
          break;
        default:
          themeText = context.l10n.themeSystem;
      }

      return ListTile(
        leading: const Icon(TDIcons.sunny),
        title: Text(context.l10n.theme),
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
        title: Text(context.l10n.selectTheme),
        children: [
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.system);
              Navigator.pop(context);
            },
            child: Text(context.l10n.themeSystem),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Text(context.l10n.themeLight),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Text(context.l10n.themeDark),
          ),
        ],
      ),
    );
  }

  // ==================== 语言 ====================

  Widget _buildLanguageTile(BuildContext context, SettingsController ctrl) {
    return Obx(() {
      String langText;
      switch (ctrl.localeKey.value) {
        case 'system':
          langText = context.l10n.languageSystem;
          break;
        case 'en':
          langText = 'English';
          break;
        case 'zh':
          langText = '简体中文';
          break;
        default:
          langText = context.l10n.languageSystem;
      }

      return ListTile(
        leading: const Icon(TDIcons.translate),
        title: Text(context.l10n.language),
        subtitle: Text(langText),
        trailing: const Icon(TDIcons.chevron_right),
        onTap: () => _showLanguageDialog(context, ctrl),
      );
    });
  }

  void _showLanguageDialog(BuildContext context, SettingsController ctrl) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(context.l10n.selectLanguage),
        children: [
          SimpleDialogOption(
            onPressed: () {
              ctrl.setLocale('system');
              Navigator.pop(context);
            },
            child: Text(context.l10n.languageSystem),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setLocale('zh');
              Navigator.pop(context);
            },
            child: const Text('简体中文'),
          ),
          SimpleDialogOption(
            onPressed: () {
              ctrl.setLocale('en');
              Navigator.pop(context);
            },
            child: const Text('English'),
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

  // ==================== 缓存 ====================

  Widget _buildCacheTile(BuildContext context, SettingsController ctrl) {
    return ListTile(
      leading: const Icon(TDIcons.delete),
      title: Text(context.l10n.clearCache),
      subtitle: Text(context.l10n.clearCacheSubtitle),
      onTap: () => _showClearCacheDialog(context, ctrl),
    );
  }

  void _showClearCacheDialog(
      BuildContext context, SettingsController ctrl) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.clearCacheTitle),
        content: Text(context.l10n.clearCacheConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              ctrl.clearCache();
              Navigator.pop(context);
            },
            child: Text(context.l10n.confirm),
          ),
        ],
      ),
    );
  }
}
