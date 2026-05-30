import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/category_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // TODO: If one line should be 106 -> 114, two line should be 124 -> 132
      height: 132,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => CategoryCard(
          title: categories[index],
          imageUrl:
              'https://i1.delgarm.com/images/news/a750/1392/09/22/D1386955684.jpg',
          onTap: () {},
        ),
        itemCount: categories.length,
      ),
    );
  }
}

final List<String> categories = [
  'یوگا و مدیتیشن',
  'بدنسازی و فیتنس',
  'ورزش های رزمی',
  'توپی و تیمی',
  'ورزش های آبی',
  'رقص و حرکات موزون',
  'هوازی و کاردیو',
  'ماجراجویی و طبیعت',
];
