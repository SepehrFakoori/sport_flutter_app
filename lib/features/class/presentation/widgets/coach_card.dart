import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/info_item.dart';

class CoachCard extends StatelessWidget {
  final String coachName;
  final String imageUrl;
  final String coachSport;
  final int experience;
  final int review;
  final double rate;

  const CoachCard({
    super.key,
    required this.coachName,
    required this.imageUrl,
    required this.coachSport,
    required this.experience,
    required this.review,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Text(
            context.l10n.class_coach_title,
            style: context.textTheme.headlineSmall,
          ),

          CustomCard(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: .start,
                    spacing: 16,
                    children: [
                      InfoItem(
                        value: review.toString(),
                        label: context.l10n.class_coach_reviews,
                      ),
                      const SizedBox(
                        width: 120,
                        child: AppDivider(indent: 0, endIndent: 0),
                      ),
                      InfoItem(
                        value: rate.toString(),
                        label: context.l10n.class_coach_rate,
                      ),
                      const SizedBox(
                        width: 120,
                        child: AppDivider(indent: 0, endIndent: 0),
                      ),
                      InfoItem(
                        value: experience.toString(),
                        label: context.l10n.class_coach_experience,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: .center,
                    children: [
                      AppCircleAvatar(
                        fullName: coachName,
                        imageUrl: imageUrl,
                        radius: 50,
                      ),
                      Text(coachName, style: context.textTheme.headlineMedium),
                      Text(
                        'مربی $coachSport',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
