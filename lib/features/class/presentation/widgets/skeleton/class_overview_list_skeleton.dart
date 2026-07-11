import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/skeleton/class_overview_card_skeleton.dart';

class ClassOverviewListSkeleton extends StatelessWidget {
  const ClassOverviewListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      itemBuilder: (context, index) => ClassOverviewCardSkeleton(),
    );
  }
}
