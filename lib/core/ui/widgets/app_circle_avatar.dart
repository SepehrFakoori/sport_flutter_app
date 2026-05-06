import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class AppCircleAvatar extends StatelessWidget {
  final String username;
  final String? imageUrl;

  const AppCircleAvatar({super.key, required this.username, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: context.colors.primary,
      // TODO: user backgroundImage: CachedNetworkImageProvider() for network images
      child: Text(
        username[0].toUpperCase(),
        style: context.textTheme.headlineLarge!.copyWith(
          color: context.colors.onPrimary,
        ),
      ),
    );
  }
}
