import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/update_service.dart';

/// 关于页面
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('关于')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // Logo 和名称
          Center(
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    TDIcons.logo_github,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'PubPub',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '跨平台 Pub 镜像浏览器',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'v${UpdateService.currentVersion}',
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          isDark ? Colors.grey[300] : Colors.grey[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // 检查更新按钮
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _checkForUpdate(context),
              icon: const Icon(Icons.system_update),
              label: const Text('检查更新'),
            ),
          ),
          const SizedBox(height: 32),

          // 功能介绍
          _buildSection(
            context,
            title: '功能特性',
            children: [
              _buildFeatureItem(
                  TDIcons.search, '包搜索', '支持多个 Pub 镜像源搜索'),
              _buildFeatureItem(
                  TDIcons.info_circle, '包详情', '版本、依赖、README 完整展示'),
              _buildFeatureItem(
                  TDIcons.heart, '自定义收藏夹', '创建多个收藏夹分类管理'),
              _buildFeatureItem(
                  TDIcons.sunny, '主题定制', '10 种主题色 + 深色模式'),
              _buildFeatureItem(
                  TDIcons.translate, '自动翻译', 'OpenAI 兼容 API 翻译简介/README'),
              _buildFeatureItem(
                  TDIcons.refresh, '响应式布局', '移动端/桌面端自适应'),
            ],
          ),
          const SizedBox(height: 16),

          // 技术栈
          _buildSection(
            context,
            title: '技术栈',
            children: [
              _buildTechItem('Flutter', '3.41+'),
              _buildTechItem('Dart', '3.11+'),
              _buildTechItem('GetX', '状态管理'),
              _buildTechItem('Dio', '网络请求'),
              _buildTechItem('Hive', '本地存储'),
              _buildTechItem('TDesign', 'UI 组件'),
            ],
          ),
          const SizedBox(height: 16),

          // 链接
          _buildSection(
            context,
            title: '链接',
            children: [
              _buildLinkItem(
                context,
                icon: TDIcons.logo_github,
                title: 'GitHub 仓库',
                subtitle: 'github.com/Maicarons/pubpub',
                url: 'https://github.com/Maicarons/pubpub',
              ),
              _buildLinkItem(
                context,
                icon: TDIcons.link,
                title: 'pub.dev',
                subtitle: 'pub.dev',
                url: 'https://pub.dev',
              ),
              _buildLinkItem(
                context,
                icon: TDIcons.link,
                title: 'Flutter 官网',
                subtitle: 'flutter.dev',
                url: 'https://flutter.dev',
              ),
              _buildLinkItem(
                context,
                icon: TDIcons.link,
                title: 'TDesign Flutter',
                subtitle: 'github.com/Tencent/tdesign-flutter',
                url: 'https://github.com/Tencent/tdesign-flutter',
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 开源许可
          _buildSection(
            context,
            title: '开源许可',
            children: [
              ListTile(
                leading: const Icon(TDIcons.file),
                title: const Text('Apache License 2.0'),
                subtitle: const Text('Copyright © 2026 PubPub Contributors'),
                trailing: const Icon(TDIcons.chevron_right),
                onTap: () => _showLicenseDialog(context),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // 底部
          Center(
            child: Text(
              'Made with ❤️ using Flutter',
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.grey[500] : Colors.grey[400],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Future<void> _checkForUpdate(BuildContext context) async {
    // 显示加载中
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('正在检查更新...'),
              ],
            ),
          ),
        ),
      ),
    );

    final info = await UpdateService.checkForUpdate();

    if (context.mounted) {
      Navigator.pop(context); // 关闭加载对话框

      if (info != null) {
        UpdateService.showUpdateDialog(info);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('当前已是最新版本'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[500],
          ),
        ),
        const SizedBox(height: 8),
        Card(child: Column(children: children)),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  Widget _buildTechItem(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildLinkItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(TDIcons.chevron_right),
      onTap: () => launchUrl(Uri.parse(url)),
    );
  }

  void _showLicenseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Apache License 2.0'),
        content: const SingleChildScrollView(
          child: Text(
            'Licensed under the Apache License, Version 2.0 '
            '(the "License"); you may not use this file except '
            'in compliance with the License.\n\n'
            'You may obtain a copy of the License at\n\n'
            '    http://www.apache.org/licenses/LICENSE-2.0\n\n'
            'Unless required by applicable law or agreed to in '
            'writing, software distributed under the License is '
            'distributed on an "AS IS" BASIS, WITHOUT WARRANTIES '
            'OR CONDITIONS OF ANY KIND, either express or implied.\n\n'
            'See the License for the specific language governing '
            'permissions and limitations under the License.',
            style: TextStyle(fontSize: 13, height: 1.5),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('关闭'),
          ),
        ],
      ),
    );
  }
}
