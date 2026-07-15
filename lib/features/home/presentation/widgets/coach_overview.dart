import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class CoachOverview extends StatelessWidget {
  final String? imageUrl;
  final String coachName;
  final String coachSport;
  final double rate;
  final int coachComment;
  final VoidCallback? onTap;

  const CoachOverview({
    super.key,
    required this.imageUrl,
    required this.coachName,
    required this.rate,
    required this.coachComment,
    required this.coachSport,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.background,
                borderRadius: BorderRadius.circular(24),
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
                imageUrl: imageUrl,
                height: 180,
                width: 180,
                radius: 24,
              ),
            ),
            Padding(
              padding: const .all(8.0),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 2,
                children: [
                  Text(
                    coachName,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          coachSport,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
                          maxLines: 1,
                          overflow: .ellipsis,
                        ),
                      ),
                      Text(
                        '⋅',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      IconWidget(
                        icon: AssetIcons.starFilled,
                        height: 12,
                        width: 12,
                        color: AppPalette.semantic3,
                      ),
                      Text(
                        '4.1',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      Text(
                        '($coachComment)',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'قزوین، زیباشهر',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
