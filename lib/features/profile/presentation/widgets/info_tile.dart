import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;

  const InfoTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      horizontalTitleGap: 12,
      title: Text(title),
      titleTextStyle: context.textTheme.bodyMedium?.copyWith(
        fontWeight: .w500,
        color: context.colors.onBackgroundSecondary,
      ),
      titleAlignment: ListTileTitleAlignment.center,
      subtitle: Text(subtitle, maxLines: 1, overflow: .ellipsis),
      subtitleTextStyle: context.textTheme.titleLarge?.copyWith(
        fontWeight: .w600,
      ),
      trailing: IconWidget(icon: AssetIcons.arrowLeft, size: 16),
    );
  }
}
