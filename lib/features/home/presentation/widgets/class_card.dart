import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class ClassCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String coachName;
  final String rate;
  final String address;
  final String cost;

  const ClassCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.coachName,
    required this.rate,
    required this.address,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.classInfo.name!,
          pathParameters: {'id': '25'},
        );
      },
      borderRadius: BorderRadius.circular(12),
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
                    title,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          coachName,
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
                      Text(
                        rate,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      IconWidget(
                        icon: AssetIcons.starFilled,
                        height: 12,
                        width: 12,
                        color: context.colors.onBackgroundSecondary,
                      ),
                    ],
                  ),
                  Text(
                    address,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'قیمت',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      Text(cost, style: context.textTheme.titleMedium),
                    ],
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
