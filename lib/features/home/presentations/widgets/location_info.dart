import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class LocationInfo extends StatelessWidget {
  final String location;

  const LocationInfo({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .start,
      spacing: 4,
      children: [
        IconWidget(
          icon: AssetIcons.location,
          height: 16,
          width: 16,
          color: context.colors.textSecondary,
        ),
        Flexible(
          child: Text(
            location,
            maxLines: 1,
            overflow: .ellipsis,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
