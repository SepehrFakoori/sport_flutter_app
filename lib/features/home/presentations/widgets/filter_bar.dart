import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';

class FilterBar extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const FilterBar({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      crossAxisAlignment: .center,
      mainAxisSize: .max,
      children: [
        Text(
          title,
          style: context.textTheme.titleLarge?.copyWith(fontWeight: .w600),
        ),
        AppIconButton(onPressed: onPressed, icon: AssetIcons.arrowLeft),
      ],
    );
  }
}
