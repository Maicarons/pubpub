import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../common/logger.dart';

/// 应用更新服务
class UpdateService {
  static const String _tag = 'UpdateService';
  static const String _owner = 'Maicarons';
  static const String _repo = 'pubpub';
  static const String currentVersion = '0.1.0';

  /// 检查是否有新版本
  static Future<UpdateInfo?> checkForUpdate() async {
    try {
      final dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));

      final response = await dio.get(
        'https://api.github.com/repos/$_owner/$_repo/releases/latest',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final tagName = data['tag_name'] as String? ?? '';
        final latestVersion = tagName.replaceFirst('v', '');
        final releaseNotes = data['body'] as String? ?? '';
        final htmlUrl = data['html_url'] as String? ?? '';
        final publishedAt = data['published_at'] as String? ?? '';

        if (_isNewerVersion(latestVersion, currentVersion)) {
          return UpdateInfo(
            currentVersion: currentVersion,
            latestVersion: latestVersion,
            releaseNotes: releaseNotes,
            downloadUrl: htmlUrl,
            publishedAt: publishedAt,
          );
        }
      }
      return null;
    } catch (e) {
      AppLogger.e(_tag, 'Check update failed', e);
      return null;
    }
  }

  /// 比较版本号
  static bool _isNewerVersion(String latest, String current) {
    final latestParts = latest.split('.').map(int.tryParse).toList();
    final currentParts = current.split('.').map(int.tryParse).toList();

    for (var i = 0; i < 3; i++) {
      final l = (i < latestParts.length) ? (latestParts[i] ?? 0) : 0;
      final c = (i < currentParts.length) ? (currentParts[i] ?? 0) : 0;
      if (l > c) return true;
      if (l < c) return false;
    }
    return false;
  }

  /// 打开下载页面
  static Future<void> openDownloadPage(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  /// 显示更新对话框
  static void showUpdateDialog(UpdateInfo info) {
    Get.dialog(
      AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.system_update, color: Colors.blue),
            const SizedBox(width: 8),
            const Text('发现新版本'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'v${info.currentVersion} → v${info.latestVersion}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '发布于 ${info.publishedAt.split('T').first}',
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              if (info.releaseNotes.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text(
                  '更新日志',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    info.releaseNotes,
                    style: const TextStyle(fontSize: 13, height: 1.5),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('稍后再说'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
              openDownloadPage(info.downloadUrl);
            },
            icon: const Icon(Icons.download),
            label: const Text('前往下载'),
          ),
        ],
      ),
    );
  }
}

/// 更新信息
class UpdateInfo {
  final String currentVersion;
  final String latestVersion;
  final String releaseNotes;
  final String downloadUrl;
  final String publishedAt;

  UpdateInfo({
    required this.currentVersion,
    required this.latestVersion,
    required this.releaseNotes,
    required this.downloadUrl,
    required this.publishedAt,
  });
}
