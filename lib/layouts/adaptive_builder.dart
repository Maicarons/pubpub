import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/layout_controller.dart';
import 'mobile_layout.dart';
import 'desktop_layout.dart';

/// 根据 LayoutController 切换 MobileLayout / DesktopLayout
class AdaptiveBuilder extends GetView<LayoutController> {
  const AdaptiveBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isMobile) {
        return const MobileLayout();
      }
      return const DesktopLayout();
    });
  }
}
