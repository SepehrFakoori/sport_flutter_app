import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/extension/int_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

class ClassCard extends StatelessWidget {
  final Class classItem;

  const ClassCard({super.key, required this.classItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          AppRoutes.classDetail.name!,
          pathParameters: {'id': '${classItem.id}'},
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomCard(
              child: ImageLoader(
                imageUrl:
                    'https://kavaalya.com/wp-content/uploads/2021/05/sukhasana-kavaalya.jpeg',
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
                    classItem.title,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: .ellipsis,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          classItem.coach.fullName,
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
                        color: context.colors.onBackgroundSecondary,
                      ),
                      Text(
                        '4.1',
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
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text(
                        'قیمت',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                      Text(
                        classItem.fee.toFormattedFee(),
                        style: context.textTheme.titleMedium,
                      ),
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
