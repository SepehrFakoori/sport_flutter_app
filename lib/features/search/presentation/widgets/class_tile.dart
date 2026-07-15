import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/search/presentation/widgets/class_location.dart';

class ClassTile extends StatelessWidget {
  final String image;
  final String title;
  final String coachName;
  final String coachRate;
  final String address;
  final String price;
  final VoidCallback? onTap;

  const ClassTile({
    super.key,
    required this.image,
    required this.title,
    required this.coachName,
    required this.coachRate,
    required this.address,
    required this.price,
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
                imageUrl: image,
                height: 150,
                width: 150,
                radius: 18,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: .ellipsis,
                    style: context.textTheme.titleMedium,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Flexible(
                        child: Text(
                          coachName,
                          maxLines: 1,
                          overflow: .ellipsis,
                          style: context.textTheme.labelLarge?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
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
                  ClassLocation(location: address),
                  RichText(
                    text: TextSpan(
                      text: price,
                      children: [
                        WidgetSpan(child: SizedBox(width: 4)),
                        TextSpan(
                          text: 'تومان',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                      style: context.textTheme.titleLarge?.copyWith(
                        fontWeight: .w600,
                      ),
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
