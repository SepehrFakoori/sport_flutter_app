import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/coach_overview.dart';

class HorizontalCoachCardList extends StatelessWidget {
  const HorizontalCoachCardList({super.key, required this.coaches});

  final List<Coach> coaches;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: 16),
      itemBuilder: (context, index) => CoachOverview(coach: coaches[index]),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: 8,
    );
  }
}
