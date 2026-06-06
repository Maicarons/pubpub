import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../common/l10n_ext.dart';
import '../controllers/search_controller.dart';
import '../controllers/layout_controller.dart';
import '../layouts/widgets/page_navigation.dart';
import '../widgets/package_card.dart';
import '../widgets/loading_widget.dart';

/// 主页内容（独立于布局脚手架，供移动/桌面复用）
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchCtrl = Get.find<AppSearchController>();
    final layoutCtrl = Get.find<LayoutController>();
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // 搜索栏
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: InputDecoration(
              hintText: context.l10n.searchHint,
              prefixIcon: const Icon(TDIcons.search, size: 20),
              filled: true,
              fillColor: isDark
                  ? Colors.grey[800]
                  : Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onSubmitted: (value) {
              searchCtrl.search(value);
            },
          ),
        ),
        // 搜索结果
        Expanded(
          child: Obx(() {
            if (searchCtrl.isLoading.value) {
              return const LoadingWidget();
            }

            if (searchCtrl.hasError.value) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      searchCtrl.errorMessage.value == 'mirrorNoSearch'
                          ? TDIcons.info_circle
                          : TDIcons.error_circle,
                      size: 48,
                      color: searchCtrl.errorMessage.value == 'mirrorNoSearch'
                          ? Colors.orange
                          : Colors.grey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getErrorMessage(context, searchCtrl.errorMessage.value),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    if (searchCtrl.errorMessage.value != 'mirrorNoSearch')
                      TDButton(
                        text: context.l10n.retry,
                        theme: TDButtonTheme.primary,
                        onTap: () {
                          if (searchCtrl.currentQuery.value.isNotEmpty) {
                            searchCtrl.search(searchCtrl.currentQuery.value);
                          }
                        },
                      ),
                  ],
                ),
              );
            }

            if (searchCtrl.searchResults.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(TDIcons.search, size: 48, color: Colors.grey[300]),
                    const SizedBox(height: 16),
                    Text(
                      searchCtrl.currentQuery.value.isEmpty
                          ? context.l10n.searchEmpty
                          : context.l10n.searchNoResults,
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                // 推荐标签
                if (searchCtrl.isRecommended.value)
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      context.l10n.hotRecommend,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                Expanded(
                  child: _buildResultList(searchCtrl, layoutCtrl),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }

  String _getErrorMessage(BuildContext context, String errorKey) {
    switch (errorKey) {
      case 'searchFailed':
        return context.l10n.searchFailed;
      case 'mirrorNoSearch':
        return context.l10n.mirrorNoSearch;
      default:
        return errorKey;
    }
  }

  Widget _buildResultList(
    AppSearchController searchCtrl,
    LayoutController layoutCtrl,
  ) {
    final isDesktop = layoutCtrl.isDesktop;

    if (isDesktop) {
      // 桌面端网格布局
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 360,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.8,
        ),
        itemCount: searchCtrl.searchResults.length +
            (searchCtrl.hasNextPage.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == searchCtrl.searchResults.length) {
            searchCtrl.loadMore();
            return const Center(child: CircularProgressIndicator());
          }
          final item = searchCtrl.searchResults[index];
          return PackageCard(
            item: item,
            onTap: () => PageNavigation.toDetail(context, item.package),
          );
        },
      );
    }

    // 移动端列表布局
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: searchCtrl.searchResults.length +
          (searchCtrl.hasNextPage.value ? 1 : 0),
      separatorBuilder: (ctx, idx) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        if (index == searchCtrl.searchResults.length) {
          searchCtrl.loadMore();
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final item = searchCtrl.searchResults[index];
        return PackageCard(
          item: item,
          onTap: () => PageNavigation.toDetail(context, item.package),
        );
      },
    );
  }
}
