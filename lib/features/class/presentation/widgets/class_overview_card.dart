import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class ClassOverviewCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String coachName;
  final String rate;
  final String address;
  final String day;
  final String price;

  const ClassOverviewCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.coachName,
    required this.rate,
    required this.address,
    required this.day,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const .symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          spacing: 4,
          children: [
            AspectRatio(
              aspectRatio: 4 / 3,
              child: ImageLoader(imageUrl: imageUrl, radius: 24),
            ),
            Padding(
              padding: const .all(8.0),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: context.textTheme.titleLarge,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          coachName,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
                        ),
                      ),
                      Text(
                        '\u2022',
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
                        rate,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      IconWidget(
                        icon: AssetIcons.location,
                        size: 16,
                        color: context.colors.onBackgroundSecondary,
                      ),
                      Flexible(
                        child: Text(
                          address,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      IconWidget(
                        icon: AssetIcons.notification,
                        size: 16,
                        color: context.colors.onBackgroundSecondary,
                      ),
                      Text(
                        day,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: .centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: price,
                        children: [
                          WidgetSpan(child: SizedBox(width: 4)),
                          TextSpan(
                            text: 'تومان',
                            style: context.textTheme.titleMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                        style: context.textTheme.headlineMedium,
                      ),
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
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
