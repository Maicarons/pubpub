import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../common/logger.dart';
import '../models/package_search_result.dart';
import '../models/package_detail.dart';
import 'cache_service.dart';
import 'settings_service.dart';
import 'platform_adapter_web.dart' if (dart.library.io) 'platform_adapter_native.dart';

/// Dio 封装，支持动态 baseUrl、缓存拦截器
class ApiService {
  static const String _tag = 'ApiService';
  static Dio? _dio;

  /// 获取 Dio 实例
  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ));
      // 使用平台适配器（Web 端使用 BrowserHttpClientAdapter，Native 端使用 IOHttpClientAdapter）
      _dio!.httpClientAdapter = createHttpClientAdapter();
      _dio!.interceptors.add(_CacheInterceptor());
    }
    return _dio!;
  }

  /// 获取当前源地址
  static String get baseUrl => SettingsService.getSource();

  /// Web 端代理：仅对无 CORS 头的 API 走 Netlify 代理
  /// pub.dev 搜索 API 无 CORS 头需要代理；包详情和 GitHub Raw 有 CORS 头可直接访问
  static String _proxyUrl(String url) {
    if (!kIsWeb) return url;

    // pub.dev 包详情和 GitHub Raw 有 CORS 头，直接访问
    if (url.contains('pub.dev/api/packages/')) return url;
    if (url.contains('raw.githubusercontent.com')) return url;
    if (url.contains('raw.gitmirror.com')) return url;

    // 搜索 API 或非 pub.dev 镜像源走 Netlify 代理
    final uri = Uri.parse(url);
    return '/api/pubdev${uri.path}${uri.hasQuery ? '?${uri.query}' : ''}';
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
