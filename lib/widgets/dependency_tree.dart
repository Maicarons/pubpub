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
        style: const TextStyle(color: Colors.grey),
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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

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
            color: isDark
                ? Colors.grey.withValues(alpha: 0.4)
                : Colors.grey.withValues(alpha: 0.2),
          ),
        ),
        child: Row(
          children: [
            // 包图标
            Icon(
              TDIcons.link,
              size: 16,
              color: theme.primaryColor,
            ),
            const SizedBox(width: 8),
            // 包名
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 13,
                  color: theme.primaryColor,
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
                  color: isDark
                      ? Colors.grey.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  version,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey[400] : Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              TDIcons.chevron_right,
              size: 14,
              color: isDark ? Colors.grey[500] : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
