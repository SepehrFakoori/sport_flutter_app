import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';

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
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Text(
            context.l10n.class_coach_title,
            style: context.textTheme.headlineSmall,
          ),
          Container(
            decoration: BoxDecoration(
              color: context.colors.onSecondary,
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
            child: Padding(
              padding: const EdgeInsets.all(24.0),
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
                        label: 'Years experience',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: .center,
                    children: [
                      AppCircleAvatar(
                        username: coachName,
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

class InfoItem extends StatelessWidget {
  final String value;
  final String label;

  const InfoItem({super.key, this.value = '0', required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 2,
      children: [
        Text(
          value,
          style: context.textTheme.headlineLarge?.copyWith(fontWeight: .w800),
        ),
        Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(fontWeight: .w600),
        ),
      ],
    );
  }
}
