import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/class_card.dart';

class HorizontalClassCardList extends StatelessWidget {
  final List<Class> classes;

  const HorizontalClassCardList({super.key, required this.classes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: .horizontal,
      padding: const .symmetric(horizontal: 16),
      itemBuilder: (context, index) => ClassCard(classItem: classes[index]),
      separatorBuilder: (context, index) => const SizedBox(width: 12),
      itemCount: classes.length < 8 ? classes.length : 8,
    );
  }
}
