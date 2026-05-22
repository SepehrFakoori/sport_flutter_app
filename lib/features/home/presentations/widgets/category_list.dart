import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  final int itemCount;

  const CategoryList({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) => CategoryItem(
          title: 'تکواندو',
          imageUrl:
              'https://i1.delgarm.com/images/news/a750/1392/09/22/D1386955684.jpg',
        ),
        separatorBuilder: (context, index) => SizedBox(width: 16),
        itemCount: itemCount,
      ),
    );
  }
}
