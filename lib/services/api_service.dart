import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:dio_web_adapter/dio_web_adapter.dart';
import '../common/logger.dart';
import '../models/package_search_result.dart';
import '../models/package_detail.dart';
import 'cache_service.dart';
import 'settings_service.dart';

/// Dio 封装，支持动态 baseUrl、缓存拦截器
class ApiService {
  static const String _tag = 'ApiService';
  static Dio? _dio;

  /// CORS 代理地址（Web 端使用，将请求通过代理转发以绕过 CORS 限制）
  static const String _corsProxy = 'https://corsproxy.io/?';

  /// 获取 Dio 实例
  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));
      // Web 端使用 BrowserHttpClientAdapter 解决 CORS 问题
      if (kIsWeb) {
        _dio!.httpClientAdapter = BrowserHttpClientAdapter();
      }
      _dio!.interceptors.add(_CacheInterceptor());
    }
    return _dio!;
  }

  /// 获取当前源地址
  static String get baseUrl => SettingsService.getSource();

  /// Web 端通过 CORS 代理包装 URL
  static String _proxyUrl(String url) {
    if (kIsWeb) return '$_corsProxy${Uri.encodeComponent(url)}';
    return url;
  }

  /// 搜索包
  static Future<PackageSearchResult> searchPackages(
    String query, {
    int page = 1,
  }) async {
    final url = '$baseUrl/api/search?q=${Uri.encodeComponent(query)}&page=$page';
    final cacheKey = 'search_${query}_$page';

    try {
      final response = await getDio().get(
        _proxyUrl(url),
        options: Options(extra: {'cacheKey': cacheKey}),
      );
      return PackageSearchResult.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      AppLogger.e(_tag, 'Search failed', e);
      // 尝试离线降级
      final stale = await CacheService.getStaleApiCache(cacheKey);
      if (stale != null) {
        return PackageSearchResult.fromJson(stale);
      }
      rethrow;
    }
  }

  /// 获取包详情
  static Future<PackageDetail> getPackageDetail(String packageName) async {
    final url = '$baseUrl/api/packages/$packageName';
    final cacheKey = 'detail_$packageName';

    try {
      final response = await getDio().get(
        _proxyUrl(url),
        options: Options(extra: {'cacheKey': cacheKey}),
      );
      return PackageDetail.fromJson(
        Map<String, dynamic>.from(response.data as Map),
      );
    } on DioException catch (e) {
      AppLogger.e(_tag, 'Get detail failed', e);
      final stale = await CacheService.getStaleApiCache(cacheKey);
      if (stale != null) {
        return PackageDetail.fromJson(stale);
      }
      rethrow;
    }
  }

  /// 从 GitHub 仓库获取 README 内容
  static Future<String?> fetchReadme(String repositoryUrl) async {
    if (repositoryUrl.isEmpty) return null;

    try {
      // 解析 GitHub URL: https://github.com/owner/repo
      final uri = Uri.parse(repositoryUrl);
      if (uri.host != 'github.com') return null;

      final segments = uri.pathSegments;
      if (segments.length < 2) return null;

      final owner = segments[0];
      final repo = segments[1].replaceAll('.git', '');
      final cacheKey = 'readme_${owner}_$repo';

      // 检查缓存
      final cached = await CacheService.getApiCache(cacheKey);
      if (cached != null) return cached['content'] as String?;

      // 获取用户选择的 GitHub Raw 镜像
      final rawMirror = SettingsService.getGithubRawMirror();

      // 构建候选 URL（用户选择的镜像优先）
      final hosts = [
        rawMirror,
        'raw.githubusercontent.com',
      ];

      // 尝试 main 和 master 分支
      for (final branch in ['main', 'master']) {
        final rawPath = '$owner/$repo/$branch/README.md';

        for (final host in hosts) {
          try {
            final url = 'https://$host/$rawPath';
            final response = await getDio().get(_proxyUrl(url));
            if (response.statusCode == 200) {
              final content = response.data as String;
              await CacheService.setApiCache(
                cacheKey,
                {'content': content},
                ttlMs: 24 * 60 * 60 * 1000,
              );
              AppLogger.d(_tag, 'README fetched from $url');
              return content;
            }
          } catch (_) {
            continue;
          }
        }
      }
      return null;
    } catch (e) {
      AppLogger.e(_tag, 'Fetch README failed', e);
      return null;
    }
  }
}

/// 缓存拦截器：onRequest 读缓存，onResponse 写缓存
class _CacheInterceptor extends Interceptor {
  static const String _tag = 'CacheInterceptor';

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final cacheKey = options.extra['cacheKey'] as String?;
    if (cacheKey != null) {
      final cached = await CacheService.getApiCache(cacheKey);
      if (cached != null) {
        // 直接返回缓存响应
        handler.resolve(Response(
          requestOptions: options,
          statusCode: 200,
          data: cached,
        ));
        return;
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final cacheKey = response.requestOptions.extra['cacheKey'] as String?;
    if (cacheKey != null && response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        await CacheService.setApiCache(cacheKey, data);
      }
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.e(_tag, 'Request error: ${err.message}', err);
    handler.next(err);
  }
}
