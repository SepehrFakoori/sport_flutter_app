import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

import '../../../../core/constant/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final GestureTapCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: .circular(AppRadius.sm),
      child: Card(
        margin: const .all(4),
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: SizedBox(
          width: 76,
          child: Column(
            spacing: 4,
            children: [
              ImageLoader(
                imageUrl: imageUrl,
                width: 76,
                height: 76,
                radius: 16,
              ),
              Text(
                title,
                style: context.textTheme.bodyMedium,
                maxLines: 2,
                overflow: .ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
