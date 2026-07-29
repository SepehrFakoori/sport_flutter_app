import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? elevation;
  final List<Widget>? actions;
  final bool cancelLeading;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final Color? shadowColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.elevation = 0.2,
    this.actions,
    this.cancelLeading = false,
    this.backgroundColor,
    this.titleTextStyle,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: title,
      titleTextStyle: titleTextStyle,
      // TODO: can use titleSpacing: NavigationToolbar.kMiddleSpacing, for space between icon and title
      actions: actions,
      actionsPadding: EdgeInsetsDirectional.only(end: 16),
      elevation: elevation,
      shadowColor: shadowColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
