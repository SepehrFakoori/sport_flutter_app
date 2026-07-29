import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

import '../../../../core/constant/constants.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWidget(icon: icon, size: 24),
      title: Text(title, maxLines: 1, overflow: .ellipsis),
      titleTextStyle: context.textTheme.titleMedium,
      titleAlignment: .center,
      contentPadding: const .symmetric(horizontal: AppSpacing.lg),
      minLeadingWidth: 20,
      minVerticalPadding: 8,
      minTileHeight: 48,
      horizontalTitleGap: 16,
      onTap: onTap,
    );
  }
}
