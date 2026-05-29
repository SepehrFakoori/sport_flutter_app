import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class CapacityInfo extends StatelessWidget {
  final int capacity;
  final int remaining;

  const CapacityInfo({
    super.key,
    required this.capacity,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      crossAxisAlignment: .center,
      spacing: 4,
      children: [
        IconWidget(
          icon: AssetIcons.profile2User,
          height: 16,
          width: 16,
          color: context.colors.textSecondary,
        ),
        Text(
          '$remaining/$capacity',
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
