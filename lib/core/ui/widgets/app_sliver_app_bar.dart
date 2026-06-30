import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? child;

  const AppSliverAppBar({
    super.key,
    required this.title,
    this.actions,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actionsPadding: const .symmetric(horizontal: 16),
      actions: actions,
      floating: false,
      pinned: true,
      expandedHeight: 112 + (child?.preferredSize.height ?? 0),
      elevation: 0.1,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(fontWeight: .w600),
        ),
        titlePadding: .only(
          left: 24,
          right: 24,
          bottom: 12 + (child?.preferredSize.height ?? 0),
        ),
        collapseMode: .parallax,
      ),
      bottom: child,
    );
  }
}
