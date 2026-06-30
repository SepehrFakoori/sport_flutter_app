import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppCircleAvatar extends StatelessWidget {
  final String username;
  final String? imageUrl;
  final double? radius;

  const AppCircleAvatar({
    super.key,
    required this.username,
    this.imageUrl,
    this.radius = 30,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colors.primary,
      backgroundImage: hasImage ? CachedNetworkImageProvider(imageUrl!) : null,
      child: !hasImage
          ? Text(
              username[0].toUpperCase(),
              style: context.textTheme.headlineLarge!.copyWith(
                color: context.colors.onPrimary,
              ),
            )
          : null,
    );
  }
}
