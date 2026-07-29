import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

import '../../../../core/constant/constants.dart';

class CityTile extends StatelessWidget {
  final Location city;

  const CityTile({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: const .symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      minLeadingWidth: 20,
      minVerticalPadding: AppSpacing.sm,
      minTileHeight: 48,
      horizontalTitleGap: AppSpacing.lg,
      title: Text(city.city),
      titleTextStyle: context.textTheme.titleLarge,
      subtitle: Padding(
        padding: const .only(top: 4.0),
        child: Text(city.province),
      ),
      subtitleTextStyle: context.textTheme.labelLarge?.copyWith(
        color: context.colors.onBackgroundSecondary,
      ),
    );
  }
}
