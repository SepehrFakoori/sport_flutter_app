import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CustomCard(
        child: Padding(
          padding: const .all(28),
          child: Column(
            spacing: 4,
            children: [
              ImageLoader(
                imageUrl: imageUrl,
                height: 112,
                width: 112,
                radius: 56,
              ),
              const SizedBox(height: 4),
              Text(
                username,
                style: context.textTheme.headlineLarge,
                maxLines: 1,
                overflow: .ellipsis,
              ),
              Text(
                description,
                style: context.textTheme.labelLarge?.copyWith(
                  color: context.colors.onBackgroundSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
