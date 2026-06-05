import 'package:get/get.dart';
import '../common/constants.dart';

/// 布局类型枚举
enum LayoutType { mobile, tablet, desktop }

/// 响应式布局控制器
class LayoutController extends GetxController {
  var screenWidth = 0.0.obs;

  LayoutType get layoutType {
    if (screenWidth.value < AppConstants.mobileBreakpoint) {
      return LayoutType.mobile;
    }
    if (screenWidth.value < AppConstants.tabletBreakpoint) {
      return LayoutType.tablet;
    }
    return LayoutType.desktop;
  }

  bool get isMobile => layoutType == LayoutType.mobile;
  bool get isDesktop => layoutType == LayoutType.desktop;

  void updateWidth(double width) {
    screenWidth.value = width;
  }
}
