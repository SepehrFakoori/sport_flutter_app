import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class FilterBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const FilterBar({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          crossAxisAlignment: .center,
          mainAxisSize: .max,
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: .w600),
            ),
            IconWidget(icon: AssetIcons.arrowLeft),
          ],
        ),
      ),
    );
  }
}
