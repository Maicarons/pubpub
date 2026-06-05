import 'package:get/get.dart';
import '../common/logger.dart';
import '../models/package_detail.dart';
import '../services/api_service.dart';
import '../services/translation_service.dart';

/// 详情页数据控制器
class DetailController extends GetxController {
  static const String _tag = 'DetailController';

  var isLoading = false.obs;
  var hasError = false.obs;
  var errorMessage = ''.obs;
  var packageDetail = Rxn<PackageDetail>();
  var selectedVersion = ''.obs;
  var readmeContent = ''.obs;
  var isLoadingReadme = false.obs;

  // 翻译相关
  var translatedDescription = ''.obs;
  var translatedReadme = ''.obs;
  var isTranslatingDescription = false.obs;
  var isTranslatingReadme = false.obs;
  var showTranslatedDescription = false.obs;
  var showTranslatedReadme = false.obs;

  /// 获取包详情
  Future<void> fetchDetail(String packageName) async {
    isLoading.value = true;
    hasError.value = false;
    errorMessage.value = '';

    try {
      final detail = await ApiService.getPackageDetail(packageName);
      packageDetail.value = detail;
      selectedVersion.value = detail.latestVersion;
      AppLogger.d(_tag, 'Loaded detail for: $packageName');

      // 异步获取 README
      _fetchReadme(detail.repository);
    } catch (e) {
      hasError.value = true;
      errorMessage.value = '获取详情失败，请检查网络连接';
      AppLogger.e(_tag, 'Fetch detail error', e);
    } finally {
      isLoading.value = false;
    }
  }

  /// 获取 README
  Future<void> _fetchReadme(String repositoryUrl) async {
    if (repositoryUrl.isEmpty) return;
    isLoadingReadme.value = true;
    try {
      final content = await ApiService.fetchReadme(repositoryUrl);
      if (content != null) {
        readmeContent.value = content;
      }
    } catch (e) {
      AppLogger.e(_tag, 'Fetch README error', e);
    } finally {
      isLoadingReadme.value = false;
    }
  }

  /// 翻译简介
  Future<void> translateDescription() async {
    final detail = packageDetail.value;
    if (detail == null || detail.description.isEmpty) return;

    if (showTranslatedDescription.value) {
      showTranslatedDescription.value = false;
      return;
    }

    if (translatedDescription.isNotEmpty) {
      showTranslatedDescription.value = true;
      return;
    }

    isTranslatingDescription.value = true;
    try {
      final result = await TranslationService.translate(detail.description);
      if (result != null) {
        translatedDescription.value = result;
        showTranslatedDescription.value = true;
      }
    } catch (e) {
      AppLogger.e(_tag, 'Translate description error', e);
    } finally {
      isTranslatingDescription.value = false;
    }
  }

  /// 翻译 README
  Future<void> translateReadme() async {
    if (readmeContent.isEmpty) return;

    if (showTranslatedReadme.value) {
      showTranslatedReadme.value = false;
      return;
    }

    if (translatedReadme.isNotEmpty) {
      showTranslatedReadme.value = true;
      return;
    }

    isTranslatingReadme.value = true;
    try {
      final result = await TranslationService.translate(readmeContent.value);
      if (result != null) {
        translatedReadme.value = result;
        showTranslatedReadme.value = true;
      }
    } catch (e) {
      AppLogger.e(_tag, 'Translate README error', e);
    } finally {
      isTranslatingReadme.value = false;
    }
  }

  /// 切换版本
  void selectVersion(String version) {
    selectedVersion.value = version;
  }

  /// 清空数据
  void clear() {
    packageDetail.value = null;
    selectedVersion.value = '';
    hasError.value = false;
    translatedDescription.value = '';
    translatedReadme.value = '';
    showTranslatedDescription.value = false;
    showTranslatedReadme.value = false;
  }
}
