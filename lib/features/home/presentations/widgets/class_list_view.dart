import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/class_card.dart';

class ClassListView extends StatelessWidget {
  const ClassListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) => ClassCard(
          imageUrl:
              'https://teempo.ir/wp-content/uploads/2025/04/167027126-H-1024x700-copy.webp',
          title: 'یوگا صبحگاهی',
          firstname: 'فاطمه',
          lastname: 'اکبری',
          location: 'تهران، سعادت آباد',
          capacity: 20,
          remaining: 16,
          cost: '1,800,000',
        ),
      ),
    );
  }
}
