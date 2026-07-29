import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/coach_overview.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class HorizontalCoachCardList extends StatelessWidget {
  const HorizontalCoachCardList({super.key, required this.coaches});

  final List<Coach> coaches;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: AppSpacing.lg),
      itemBuilder: (context, index) => CoachOverview(coach: coaches[index]),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: coaches.length < 8 ? coaches.length : 8,
    );
  }
}
