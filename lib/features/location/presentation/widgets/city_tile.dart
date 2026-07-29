import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

class CityTile extends StatelessWidget {
  final Location city;

  const CityTile({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      minLeadingWidth: 20,
      minVerticalPadding: 8,
      minTileHeight: 48,
      horizontalTitleGap: 16,
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
