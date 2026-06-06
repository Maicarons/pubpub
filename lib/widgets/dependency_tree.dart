import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import '../common/l10n_ext.dart';
import '../common/logger.dart';
import '../layouts/widgets/page_navigation.dart';

/// 展示依赖关系的树形组件
class DependencyTree extends StatelessWidget {
  final Map<String, String> dependencies;

  const DependencyTree({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    if (dependencies.isEmpty) {
      return Text(
        context.l10n.noDependencies,
        style: TextStyle(color: TDTheme.of(context).textColorPlaceholder),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dependencies.entries.map((entry) {
        return _DependencyNode(
          name: entry.key,
          version: entry.value,
        );
      }).toList(),
    );
  }
}

class _DependencyNode extends StatelessWidget {
  final String name;
  final String version;

  const _DependencyNode({
    required this.name,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    final tdTheme = TDTheme.of(context);

    return GestureDetector(
      onTap: () {
        AppLogger.d('DependencyTree', 'Tapped on: $name');
        PageNavigation.toDetail(context, name);
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: tdTheme.componentBorderColor,
          ),
        ),
        child: Row(
          children: [
            // 包图标
            Icon(
              TDIcons.link,
              size: 16,
              color: tdTheme.brandNormalColor,
            ),
            const SizedBox(width: 8),
            // 包名
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                  color: tdTheme.textColorLink,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // 版本约束
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tdTheme.bgColorSecondaryContainer,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  version,
                  style: TextStyle(
                    fontSize: 12,
                    color: tdTheme.textColorSecondary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              TDIcons.chevron_right,
              size: 14,
              color: tdTheme.textColorPlaceholder,
            ),
          ],
        ),
      ),
    );
  }
}
