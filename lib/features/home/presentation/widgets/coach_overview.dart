import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

class CoachOverview extends StatelessWidget {
  final Coach coach;

  const CoachOverview({super.key, required this.coach});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(
        AppRoutes.coach.name!,
        pathParameters: {'id': '${coach.id}'},
      ),
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
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjIjnCa4QxghR2hY_2NGc_y5xN7ZT_aXe__g4r4natMHrosGqVhTzKkSzK&s=10',
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
                    coach.fullName,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          'وزنه برداری',
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
                        size: 12,
                        color: AppPalette.semantic3,
                      ),
                      Text(
                        '4.1',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      Text(
                        '(126)',
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
