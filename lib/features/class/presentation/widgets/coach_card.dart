import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/info_item.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

class CoachCard extends StatelessWidget {
  final Coach coach;

  const CoachCard({super.key, required this.coach});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: .spaceBetween,
          spacing: 24,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .center,
                spacing: 4,
                children: [
                  AppCircleAvatar(
                    fullName: coach.fullName,
                    imageUrl: null,
                    radius: 50,
                  ),
                  Text(coach.fullName, style: context.textTheme.headlineMedium),
                  Text(
                    'والیبال',
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 16,
                children: [
                  InfoItem(
                    value: '324',
                    label: context.l10n.class_coach_reviews,
                  ),
                  AppDivider(indent: 0, endIndent: 0),
                  InfoItem(value: '4.1', label: context.l10n.class_coach_rate),
                  AppDivider(indent: 0, endIndent: 0),
                  InfoItem(
                    value: '15',
                    label: context.l10n.class_coach_experience,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
