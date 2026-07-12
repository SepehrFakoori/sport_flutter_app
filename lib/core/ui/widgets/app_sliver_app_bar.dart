import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppSliverAppBar extends StatelessWidget {
  final String? title;
  final bool centerTitle;
  final List<Widget>? actions;
  final PreferredSizeWidget? child;
  final double? expandedHeight;

  const AppSliverAppBar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.actions,
    this.child,
    this.expandedHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actionsPadding: const .symmetric(horizontal: 16),
      actions: actions,
      floating: false,
      pinned: true,
      expandedHeight:
          expandedHeight ?? 112 + (child?.preferredSize.height ?? 0),
      elevation: 0.1,
      flexibleSpace: title != null
          ? FlexibleSpaceBar(
              title: Text(
                title!,
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: .w600,
                ),
              ),
              centerTitle: centerTitle,
              titlePadding: !centerTitle
                  ? .directional(
                      end: 24,
                      start: 24,
                      bottom: 12 + (child?.preferredSize.height ?? 0),
                    )
                  : null,
              collapseMode: .parallax,
            )
          : null,
      bottom: child,
    );
  }
}
