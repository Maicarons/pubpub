import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../common/l10n_ext.dart';
import '../controllers/settings_controller.dart';
import '../services/settings_service.dart';
import '../services/update_service.dart';
import 'about_page.dart';

/// Pub 镜像源列表
const List<_MirrorSource> _pubMirrorSources = [
  _MirrorSource(
    nameKey: 'flutterChina',
    name: 'Flutter China (flutter-io.cn)',
    url: 'https://pub.flutter-io.cn',
    supportsSearch: true,
  ),
  _MirrorSource(
    nameKey: 'flutterChina',
    name: 'Flutter China (storage.flutter-io.cn)',
    url: 'https://storage.flutter-io.cn',
    supportsSearch: false,
  ),
  _MirrorSource(
    nameKey: 'pubOfficial',
    name: 'Official (pub.dev)',
    url: 'https://pub.dev',
    supportsSearch: true,
  ),
  _MirrorSource(
    nameKey: 'tuna',
    name: 'Tsinghua TUNA',
    url: 'https://mirrors.tuna.tsinghua.edu.cn/dart-pub',
    supportsSearch: false,
  ),
  _MirrorSource(
    nameKey: 'sjtu',
    name: 'SJTU',
    url: 'https://mirror.sjtu.edu.cn/dart-pub',
    supportsSearch: false,
  ),
];

/// GitHub Raw 镜像源列表
const List<String> _githubRawMirrors = [
  'raw.githubusercontent.com',
  'raw.gitmirror.com',
  'raw.kkgithub.com',
];

class _MirrorSource {
  final String nameKey; // i18n key
  final String name; // fallback name
  final String url;
  final bool supportsSearch; // 是否支持搜索 API
  const _MirrorSource({
    required this.nameKey,
    required this.name,
    required this.url,
    this.supportsSearch = true,
  });
}

/// 检查当前镜像源是否支持搜索
bool isCurrentMirrorSearchSupported() {
  final currentUrl = SettingsService.getSource();
  final source = _pubMirrorSources.firstWhere(
    (s) => s.url == currentUrl,
    orElse: () => _pubMirrorSources.first,
  );
  return source.supportsSearch;
}

/// 获取镜像源的本地化名称
String _getMirrorName(BuildContext context, _MirrorSource source) {
  switch (source.nameKey) {
    case 'flutterChina':
      return context.l10n.flutterChina;
    case 'pubOfficial':
      return context.l10n.pubOfficial;
    case 'tuna':
      return context.l10n.tuna;
    case 'sjtu':
      return context.l10n.sjtu;
    default:
      return source.name;
  }
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
            Obx(() => _buildPubSourceDropdown(context, settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.githubRawMirror,
          children: [
            Obx(() => _buildGithubMirrorDropdown(context, settingsCtrl)),
          ],
        ),
        const SizedBox(height: 16),
        _buildSection(
          title: context.l10n.autoTranslate,
          children: [
            _buildTranslationSettings(context, settingsCtrl),
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
            Obx(() => _buildColorSchemeSection(context, settingsCtrl)),
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

  Widget _buildPubSourceDropdown(BuildContext context, SettingsController ctrl) {
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
              Text(context.l10n.pubMirror, style: const TextStyle(fontSize: 15)),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Text(_getMirrorName(context, source), style: const TextStyle(fontSize: 14)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: source.supportsSearch
                            ? Colors.green.withValues(alpha: 0.1)
                            : Colors.orange.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        source.supportsSearch
                            ? context.l10n.mirrorSearchSupported
                            : context.l10n.mirrorSearchNotSupported,
                        style: TextStyle(
                          fontSize: 10,
                          color: source.supportsSearch ? Colors.green : Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
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
            context.l10n.pubMirrorHint,
            style: TextStyle(fontSize: 12, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  // ==================== GitHub 镜像源下拉 ====================

  Widget _buildGithubMirrorDropdown(BuildContext context, SettingsController ctrl) {
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
              Text(context.l10n.githubRawMirror, style: const TextStyle(fontSize: 15)),
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
            context.l10n.githubMirrorHint,
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

  // 语言配置
  static const Map<String, String> _languageNames = {
    'system': '', // 使用翻译
    'ar': 'العربية',
    'bn': 'বাংলা',
    'de': 'Deutsch',
    'en': 'English',
    'es': 'Español',
    'fa': 'فارسی',
    'fr': 'Français',
    'hi': 'हिन्दी',
    'it': 'Italiano',
    'ja': '日本語',
    'jv': 'Basa Jawa',
    'ko': '한국어',
    'mr': 'मराठी',
    'pa': 'ਪੰਜਾਬੀ',
    'pt': 'Português',
    'ru': 'Русский',
    'sw': 'Kiswahili',
    'te': 'తెలుగు',
    'tr': 'Türkçe',
    'ur': 'اردو',
    'zh': '简体中文',
  };

  Widget _buildLanguageTile(BuildContext context, SettingsController ctrl) {
    return Obx(() {
      String langText;
      if (ctrl.localeKey.value == 'system') {
        langText = context.l10n.languageSystem;
      } else {
        langText = _languageNames[ctrl.localeKey.value] ?? context.l10n.languageSystem;
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
          ..._languageNames.entries
              .where((e) => e.key != 'system')
              .map((e) => SimpleDialogOption(
                    onPressed: () {
                      ctrl.setLocale(e.key);
                      Navigator.pop(context);
                    },
                    child: Text(e.value),
                  )),
        ],
      ),
    );
  }

  // ==================== 主题色 ====================

  Widget _buildColorSchemeSection(BuildContext context, SettingsController ctrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(TDIcons.palette, size: 20),
              const SizedBox(width: 12),
              Text(context.l10n.themeColor, style: const TextStyle(fontSize: 15)),
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
              Text(context.l10n.autoTranslateDesc, style: const TextStyle(fontSize: 15)),
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
                    configured ? context.l10n.configured : context.l10n.notConfigured,
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
                decoration: InputDecoration(
                  labelText: context.l10n.modelLabel,
                  hintText: 'gpt-4o-mini',
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                onSubmitted: (v) => ctrl.setTranslationModel(v),
              )),
          const SizedBox(height: 8),
          // 目标语言
          Obx(() => TextField(
                controller: TextEditingController(
                    text: ctrl.translationTargetLang.value),
                decoration: InputDecoration(
                  labelText: context.l10n.targetLangLabel,
                  hintText: context.l10n.targetLangHint,
                  border: const OutlineInputBorder(),
                  isDense: true,
                ),
                onSubmitted: (v) => ctrl.setTranslationTargetLang(v),
              )),
          const SizedBox(height: 8),
          Text(
            context.l10n.translateApiHint,
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
