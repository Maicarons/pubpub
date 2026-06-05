import 'package:flutter/material.dart';
import '../../pages/detail_page.dart';

/// 页面导航工具
class PageNavigation {
  /// 导航到详情页
  static void toDetail(BuildContext context, String packageName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailPage(packageName: packageName),
      ),
    );
  }
}
