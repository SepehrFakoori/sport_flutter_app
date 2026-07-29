import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class FilterTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FilterTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: context.textTheme.titleLarge?.copyWith(fontWeight: .w600),
      titleAlignment: .center,
      contentPadding: const .symmetric(horizontal: 16),
      minVerticalPadding: 4,
      minTileHeight: 48,
      trailing: IconWidget(icon: AppIcons.arrowLeft, size: 20),
      onTap: onTap,
    );
  }
}
