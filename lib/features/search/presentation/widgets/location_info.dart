import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class LocationInfo extends StatelessWidget {
  final String location;

  const LocationInfo({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        IconWidget(
          icon: AssetIcons.location,
          size: 16,
          color: context.colors.onBackgroundSecondary,
        ),
        Flexible(
          child: Text(
            location,
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.labelLarge?.copyWith(
              color: context.colors.onBackgroundSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
