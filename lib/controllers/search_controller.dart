import 'package:get/get.dart';
import '../common/logger.dart';
import '../models/package_search_result.dart';
import '../services/api_service.dart';

/// 推荐包列表（写死）
const List<String> _recommendedPackages = [
  'dio',
  'get',
  'provider',
  'flutter_bloc',
  'riverpod',
  'http',
  'shared_preferences',
  'hive',
  'cached_network_image',
  'go_router',
  'freezed',
  'json_serializable',
  'flutter_local_notifications',
  'url_launcher',
  'path_provider',
];

/// 搜索状态控制器
class AppSearchController extends GetxController {
  static const String _tag = 'SearchController';

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var searchResults = <PackageItem>[].obs;
  var currentQuery = ''.obs;
  var currentPage = 1.obs;
  var hasNextPage = false.obs;
  var isLoadingMore = false.obs;
  var isRecommended = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadRecommended();
  }

  /// 加载推荐包
  void _loadRecommended() {
    isRecommended.value = true;
    currentQuery.value = '';
    searchResults.value =
        _recommendedPackages.map((name) => PackageItem(package: name)).toList();
    hasNextPage.value = false;
    AppLogger.d(_tag, 'Loaded ${_recommendedPackages.length} recommended');
  }

  /// 执行搜索
  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;

    currentQuery.value = query.trim();
    currentPage.value = 1;
    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';
    isRecommended.value = false;

    try {
      final result = await ApiService.searchPackages(
        currentQuery.value,
        page: 1,
      );
      searchResults.value = result.packages;
      hasNextPage.value = result.next != null;
      AppLogger.d(_tag, 'Search found ${result.packages.length} results');
    } catch (e) {
      hasError.value = true;
      errorMessage.value = '搜索失败，请检查网络连接';
      AppLogger.e(_tag, 'Search error', e);
    } finally {
      isLoading.value = false;
    }
  }

  /// 加载下一页
  Future<void> loadMore() async {
    if (isLoadingMore.value || !hasNextPage.value) return;

    isLoadingMore.value = true;
    try {
      final nextPage = currentPage.value + 1;
      final result = await ApiService.searchPackages(
        currentQuery.value,
        page: nextPage,
      );
      searchResults.addAll(result.packages);
      currentPage.value = nextPage;
      hasNextPage.value = result.next != null;
    } catch (e) {
      AppLogger.e(_tag, 'Load more error', e);
    } finally {
      isLoadingMore.value = false;
    }
  }

  /// 清空搜索结果，恢复推荐
  void clearResults() {
    _loadRecommended();
  }
}
