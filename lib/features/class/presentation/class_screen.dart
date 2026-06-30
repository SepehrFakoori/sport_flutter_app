import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_comments.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_description.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_features.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_images.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_summary_detail.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/coach_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/coach_tile.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/enrollment_card.dart';

class ClassPage extends StatefulWidget {
  final int classId;

  const ClassPage({super.key, required this.classId});

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final images = [
    'https://saeidhamidzade.com/wp-content/uploads/2025/05/%DA%86%DA%A9-%D9%84%DB%8C%D8%B3%D8%AA-%D8%AD%D8%B1%D9%81%D9%87-%D8%A7%DB%8C-%D9%82%D8%A8%D9%84-%D8%A7%D8%B2-%D9%85%D8%B3%D8%A7%D8%A8%D9%82%D9%87-%D9%81%D9%88%D8%AA%D8%A8%D8%A7%D9%84.jpg',
    'https://api2.zoomg.ir/media/2024-7-top-soccer-games-android-ios-update-66cc7d122b5676090d02f5fa?w=1200&q=80',
    'https://cdn.tabnak.ir/files/fa/news/1397/11/29/997217_691.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: EnrollmentCard(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // AppBar
            SliverAppBar(
              pinned: true,
              elevation: 0,
              expandedHeight: 350,
              actionsPadding: EdgeInsets.symmetric(horizontal: 24),
              actions: [
                AppIconButton(onPressed: () {}, icon: AssetIcons.bookmark),
                const SizedBox(width: 8),
                AppIconButton(onPressed: () {}, icon: AssetIcons.share),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: ClassImages(images: images),
              ),
            ),

            SliverList.list(
              children: [
                const SizedBox(height: 12),
                ClassSummaryDetail(
                  title: 'تکواندو فرکانس',
                  address: 'محل برگزاری سالن تختی، مهرگان',
                  comments: 54,
                  rate: 4.1,
                ),

                const SizedBox(height: 12),
                AppDivider(indent: 24, endIndent: 24),

                const SizedBox(height: 12),

                CoachTile(
                  imageUrl:
                      'https://www.lovepanky.com/wp-content/uploads/2012/03/How-to-Be-a-Man.jpg',
                  coachName: 'میعاد جاوید',
                  subtilte: 'مربی رسمی فدراسیون، 14 سال تجربه',
                ),

                const SizedBox(height: 12),
                AppDivider(indent: 24, endIndent: 24),
                const SizedBox(height: 12),

                ClassFeatures(
                  feature: [
                    'متناسب مبتدی ها',
                    'افزایش انعطاف پذیری',
                    'مربی تایید شده',
                  ],
                ),

                const SizedBox(height: 12),
                AppDivider(indent: 24, endIndent: 24),
                const SizedBox(height: 12),

                ClassDescription(
                  description:
                      'این یک متن است که خودم با دست های خودم نوشتم و میخوام تست کنم ایا کار میکند یا نه امروز شاید برم بیرون یکم والیبال بازی کنم باید زنگ بزنم به امیر محمد ببینم میاد یا نه یا حتی راستین شاید کیف داد بازی کردیم باید حال بده چون هوا هم عالیه و خیلی خوبه.',
                ),

                const SizedBox(height: 8),
                AppDivider(indent: 24, endIndent: 24),
                const SizedBox(height: 12),

                ClassComments(
                  username: 'سهند فکوری',
                  time: '2 ماه پیش',
                  comment:
                      'من سهند فکوری هستم میخوام از این کلاس براتون تعریف کنم کلاس نسبتا خوبیه استادش هم خوبه ولی در کل تهران خیلی بهتره تا قزوین ببینیم خدا چی میخواد.',
                ),

                const SizedBox(height: 8),
                Divider(indent: 24, endIndent: 24),
                const SizedBox(height: 12),

                CoachCard(
                  coachName: 'میعاد جاوید',
                  imageUrl:
                      'https://www.lovepanky.com/wp-content/uploads/2012/03/How-to-Be-a-Man.jpg',
                  coachSport: 'تکواندو',
                  experience: 5,
                  review: 319,
                  rate: 4.4,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
