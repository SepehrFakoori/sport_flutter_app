import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryItem({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        ImageLoader(imageUrl: imageUrl, width: 77, height: 77, radius: 8),
        Text(title, style: context.textTheme.bodyMedium),
      ],
    );
  }
}
