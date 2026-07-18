import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({super.key});

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      avatar: IconWidget(icon: AssetIcons.camera, size: 20),
      label: Text('توپی'),
      tooltip: '',
      labelStyle: context.textTheme.labelLarge,
      selected: false,
      onSelected: (bool value) {},
    );
  }
}
