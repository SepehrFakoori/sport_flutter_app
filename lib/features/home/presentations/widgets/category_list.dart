import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  final int itemCount;

  const CategoryListView({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // TODO: If one line should be 106 -> 114, two line should be 124 -> 132
      height: 132,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => CategoryCard(
          title: 'تکواندو',
          imageUrl:
              'https://i1.delgarm.com/images/news/a750/1392/09/22/D1386955684.jpg',
          onTap: () {},
        ),
        itemCount: itemCount,
      ),
    );
  }
}
