import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class AppSliverAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;

  const AppSliverAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actionsPadding: const .symmetric(horizontal: 16),
      actions: actions,
      floating: false,
      pinned: true,
      expandedHeight: 112,
      elevation: 0.1,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        systemStatusBarContrastEnforced: true,
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: context.textTheme.headlineMedium?.copyWith(fontWeight: .w600),
        ),
        titlePadding: const .symmetric(horizontal: 24, vertical: 12),
        collapseMode: .parallax,
      ),
    );
  }
}
