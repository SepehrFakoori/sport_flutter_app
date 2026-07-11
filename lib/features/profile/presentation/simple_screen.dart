import 'package:flutter/material.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_overview_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/skeleton/class_overview_card_skeleton.dart';

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrl = [
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
      'https://bstf.org.uk/wp-content/uploads/2016/09/About-Taekwondo-1-2-1.png',
    ];

    final List<String> title = [
      'کلاس بسکتبال ایران زمین',
      'آکادمی بسکتبال ستارگان',
      'کلاس حرفه‌ای پرشین',
      'باشگاه بسکتبال آینده',
      'مدرسه بسکتبال قهرمانان',
      'آکادمی پرواز',
      'باشگاه المپیک',
      'کلاس بسکتبال آریا',
    ];

    final List<String> coachName = [
      'محمد فلاح',
      'علی رضایی',
      'مهدی کریمی',
      'حسین اکبری',
      'امیر سلیمانی',
      'رضا نادری',
      'سعید محمدی',
      'نیما شریفی',
    ];

    final List<String> rate = [
      '4.0',
      '4.8',
      '4.5',
      '4.3',
      '4.9',
      '4.2',
      '4.6',
      '4.7',
    ];

    final List<String> address = [
      'قزوین، شهرک مهرگان',
      'تهران، سعادت‌آباد',
      'اصفهان، خیابان چهارباغ',
      'شیراز، معالی‌آباد',
      'تبریز، ولیعصر',
      'مشهد، احمدآباد',
      'کرج، عظیمیه',
      'رشت، گلسار',
    ];

    final List<String> day = [
      'دوشنبه 14:00 تا 15:30',
      'شنبه 16:00 تا 17:30',
      'یکشنبه 18:00 تا 19:30',
      'سه‌شنبه 17:00 تا 18:30',
      'چهارشنبه 15:00 تا 16:30',
      'پنجشنبه 18:00 تا 19:30',
      'جمعه 09:00 تا 10:30',
      'شنبه 10:00 تا 11:30',
    ];

    final List<String> price = [
      '800,000',
      '1,200,000',
      '950,000',
      '850,000',
      '1,100,000',
      '900,000',
      '750,000',
      '980,000',
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? ClassOverviewCard(
                          imageUrl: imageUrl[index],
                          title: title[index],
                          coachName: coachName[index],
                          rate: rate[index],
                          address: address[index],
                          day: day[index],
                          price: price[index],
                        )
                      : const ClassOverviewCardSkeleton();
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemCount: 8,
                padding: const .symmetric(vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
