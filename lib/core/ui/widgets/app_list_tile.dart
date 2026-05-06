import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class AppListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? leadingIcon;
  final bool showTrailing;
  final Widget? trailing;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? titleAlign;

  const AppListTile({
    super.key,
    this.onTap,
    required this.title,
    this.leadingIcon,
    this.showTrailing = true,
    this.trailing,
    this.enabled = true,
    this.contentPadding,
    this.titleAlign,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: titleAlign,
      ),
      titleTextStyle: context.textTheme.titleMedium?.copyWith(
        fontWeight: .w600,
      ),
      titleAlignment: titleAlign == TextAlign.center
          ? ListTileTitleAlignment.center
          : null,
      leading: leadingIcon != null ? IconWidget(icon: leadingIcon!) : null,
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 16),
      dense: false,
      enabled: enabled,
      horizontalTitleGap: 16,
      isThreeLine: false,
      trailing: showTrailing
          ? trailing ?? Icon(Icons.chevron_right_rounded)
          : null,
      leadingAndTrailingTextStyle: context.textTheme.titleLarge?.copyWith(
        color: context.colors.textSecondary,
      ),
      style: ListTileStyle.list,
    );
  }
}
