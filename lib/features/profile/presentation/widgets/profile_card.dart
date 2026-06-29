import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class ProfileCard extends StatelessWidget {
  final String imageUrl;
  final String username;
  final String description;

  const ProfileCard({
    super.key,
    required this.imageUrl,
    required this.username,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const .all(28),
        child: Column(
          children: [
            ImageLoader(
              imageUrl: imageUrl,
              height: 110,
              width: 110,
              radius: 100,
            ),
            const SizedBox(height: 16),
            Text(username, style: context.textTheme.headlineLarge),
            Text(
              description,
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colors.onBackgroundSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
