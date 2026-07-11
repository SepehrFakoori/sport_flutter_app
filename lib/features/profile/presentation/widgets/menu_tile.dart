import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final String icon;
  final GestureTapCallback? onTap;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWidget(icon: icon, height: 24, width: 24),
      title: Text(title, maxLines: 1, overflow: .ellipsis),
      titleTextStyle: context.textTheme.titleMedium,
      titleAlignment: .center,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 20,
      minVerticalPadding: 8,
      minTileHeight: 48,
      horizontalTitleGap: 16,
      onTap: onTap,
    );
  }
}
