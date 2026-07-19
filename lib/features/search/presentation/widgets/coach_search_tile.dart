import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/search/presentation/widgets/location_info.dart';

class CoachSearchTile extends StatelessWidget {
  final String image;
  final String coachName;
  final String coachSport;
  final String coachRate;
  final String address;
  final VoidCallback? onTap;


  const CoachSearchTile({
    super.key,
    required this.image,
    required this.coachName,
    required this.coachSport,
    required this.coachRate,
    required this.address,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const .symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: .center,
          mainAxisSize: .max,
          spacing: 12,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: context.colors.secondary.withValues(alpha: 0.12),
                    offset: const Offset(0, 1),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: ImageLoader(
                imageUrl: image,
                height: 80,
                width: 80,
                radius: 100,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(
                    coachName,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: context.textTheme.titleMedium,
                  ),

                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        'مربی $coachSport',
                        maxLines: 1,
                        overflow: .ellipsis,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      Text(
                        '\u2022',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      IconWidget(
                        icon: AssetIcons.starFilled,
                        size: 12,
                        color: context.colors.onBackgroundSecondary,
                      ),
                      Text(
                        coachRate,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  LocationInfo(location: address,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
