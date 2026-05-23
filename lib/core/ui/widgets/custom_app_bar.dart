import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? elevation;
  final List<Widget>? actions;
  final bool cancelLeading;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.elevation = 0.2,
    this.actions,
    this.cancelLeading = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: context.canPop()
          ? IconButton(
              onPressed: context.pop,
              icon: Icon(
                cancelLeading
                    ? Icons.close_rounded
                    : Icons.arrow_back_ios_rounded,
              ),
            )
          : null,
      title: title,
      // TODO: can use titleSpacing: NavigationToolbar.kMiddleSpacing, for space between icon and title
      actions: actions,
      actionsPadding: EdgeInsetsDirectional.only(end: 16),
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
