import 'package:dio/dio.dart';
import '../common/logger.dart';
import 'settings_service.dart';
import 'cache_service.dart';

/// 翻译服务：使用 OpenAI 兼容 API 翻译文本
class TranslationService {
  static const String _tag = 'TranslationService';
  static Dio? _dio;

  static Dio _getDio() {
    _dio ??= Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
    ));
    return _dio!;
  }

  /// 获取 API Endpoint
  static String getEndpoint() => SettingsService.getTranslationEndpoint();

  /// 获取 API Key
  static String getApiKey() => SettingsService.getTranslationApiKey();

  /// 获取模型
  static String getModel() => SettingsService.getTranslationModel();

  /// 获取目标语言
  static String getTargetLanguage() => SettingsService.getTranslationTargetLang();

  /// 检查翻译是否已配置
  static bool isConfigured() {
    return getEndpoint().isNotEmpty && getApiKey().isNotEmpty;
  }

  /// 翻译文本
  static Future<String?> translate(String text, {String? targetLang}) async {
    if (!isConfigured()) {
      AppLogger.w(_tag, 'Translation not configured');
      return null;
    }
    if (text.trim().isEmpty) return null;

    final lang = targetLang ?? getTargetLanguage();
    final cacheKey = 'translate_${lang}_${text.hashCode.toRadixString(16)}';

    // 检查缓存
    final cached = await CacheService.getApiCache(cacheKey);
    if (cached != null) return cached['text'] as String?;

    try {
      final endpoint = getEndpoint();
      final apiKey = getApiKey();
      final model = getModel();

      // 确保 endpoint 以 /v1/chat/completions 结尾
      final url = endpoint.endsWith('/chat/completions')
          ? endpoint
          : '${endpoint.replaceAll(RegExp(r'/+$'), '')}/v1/chat/completions';

      final response = await _getDio().post(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $apiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': model,
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a professional translator. Translate the following text to $lang. '
                      'Only return the translated text, no explanations or notes. '
                      'Preserve all formatting, links, and code blocks.',
            },
            {
              'role': 'user',
              'content': text,
            },
          ],
          'temperature': 0.3,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final choices = data['choices'] as List?;
        if (choices != null && choices.isNotEmpty) {
          final content =
              choices[0]['message']['content'] as String?;
          if (content != null) {
            // 缓存翻译结果（7 天）
            await CacheService.setApiCache(
              cacheKey,
              {'text': content},
              ttlMs: 7 * 24 * 60 * 60 * 1000,
            );
            AppLogger.d(_tag, 'Translation cached: $cacheKey');
            return content;
          }
        }
      }
      return null;
    } catch (e) {
      AppLogger.e(_tag, 'Translation failed', e);
      return null;
    }
  }
}
