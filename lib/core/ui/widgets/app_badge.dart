import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class AppBadge extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Offset? offset;
  final String? labelText;
  final bool isLabelVisible;
  final Widget? child;

  const AppBadge({
    super.key,
    this.backgroundColor,
    this.padding,
    this.alignment,
    this.offset,
    this.labelText,
    this.isLabelVisible = true,
    this.child,
  });

  const AppBadge.count({
    super.key,
    this.backgroundColor,
    this.padding,
    this.alignment,
    this.offset,
    required int count,
    int maxCount = 999,
    this.isLabelVisible = true,
    this.child,
  }) : assert(count >= 0, 'count must be non-negative'),
       assert(maxCount > 0, 'maxCount must be positive'),
       labelText = count > maxCount ? '$maxCount+' : '$count';

  @override
  Widget build(BuildContext context) {
    return Badge(
      backgroundColor: backgroundColor,
      padding: padding,
      alignment: alignment,
      offset: offset,
      label: Text(labelText!),
      textStyle: context.textTheme.labelSmall,
      isLabelVisible: isLabelVisible,
      child: child,
    );
  }
}
