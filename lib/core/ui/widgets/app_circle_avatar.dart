import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class AppCircleAvatar extends StatelessWidget {
  final String fullName;
  final String? imageUrl;
  final double radius;

  const AppCircleAvatar({
    super.key,
    required this.fullName,
    this.imageUrl,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colors.primary,
      child: !hasImage
          ? Text(
              fullName[0].toUpperCase(),
              textScaler: .linear(radius / 30),
              style: context.textTheme.headlineLarge!.copyWith(
                color: context.colors.onPrimary,
              ),
            )
          : ImageLoader(imageUrl: imageUrl, radius: radius),
    );
  }
}
