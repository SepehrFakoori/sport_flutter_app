import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';

class ProfileCard extends StatelessWidget {
  final String? imageUrl;
  final String fullName;
  final String description;
  final GestureTapCallback? onTap;

  const ProfileCard({
    super.key,
    required this.imageUrl,
    required this.fullName,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: CustomCard(
          child: Padding(
            padding: const .all(28),
            child: Column(
              spacing: 4,
              children: [
                AppCircleAvatar(
                  fullName: fullName,
                  imageUrl: imageUrl,
                  radius: 56,
                ),
                const SizedBox(height: 4),
                Text(
                  fullName,
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
      ),
    );
  }
}
