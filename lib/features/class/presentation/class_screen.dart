import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_bloc.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_event.dart';
import 'package:sport_flutter_app/features/class/presentation/bloc/class_bloc/class_state.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_comments.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_description.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_features.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_images.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_overview.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/coach_card.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/coach_tile.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/class_enrollment_card.dart';

class ClassScreen extends StatefulWidget {
  final int classId;

  const ClassScreen({super.key, required this.classId});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final images = [
    'https://saeidhamidzade.com/wp-content/uploads/2025/05/%DA%86%DA%A9-%D9%84%DB%8C%D8%B3%D8%AA-%D8%AD%D8%B1%D9%81%D9%87-%D8%A7%DB%8C-%D9%82%D8%A8%D9%84-%D8%A7%D8%B2-%D9%85%D8%B3%D8%A7%D8%A8%D9%82%D9%87-%D9%81%D9%88%D8%AA%D8%A8%D8%A7%D9%84.jpg',
    'https://api2.zoomg.ir/media/2024-7-top-soccer-games-android-ios-update-66cc7d122b5676090d02f5fa?w=1200&q=80',
    'https://cdn.tabnak.ir/files/fa/news/1397/11/29/997217_691.jpg',
  ];

  @override
  void initState() {
    super.initState();
    context.read<ClassBloc>().add(GetClass(widget.classId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassBloc, ClassState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    elevation: 0,
                    expandedHeight: 350,
                    actionsPadding: EdgeInsets.symmetric(horizontal: 24),
                    actions: [
                      AppIconButton(
                        onPressed: () {},
                        icon: AssetIcons.bookmark,
                      ),
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
                      ClassOverview(
                        title: state.classItem.title,
                        address: 'محل برگزاری سالن تختی، مهرگان',
                        reviewCount: 54,
                        rating: 4.1,
                      ),
                      const SizedBox(height: 12),
                      AppDivider(indent: 24, endIndent: 24),
                      CoachTile(
                        fullName: state.classItem.coach.fullName,
                        imageUrl:
                            'https://www.lovepanky.com/wp-content/uploads/2012/03/How-to-Be-a-Man.jpg',
                        credentials: 'مربی رسمی فدراسیون، 14 سال تجربه',
                        onTap: () => context.pushNamed(
                          AppRoutes.coach.name!,
                          pathParameters: {'id': '${state.classItem.coach.id}'},
                        ),
                      ),
                      AppDivider(indent: 24, endIndent: 24),
                      const SizedBox(height: 12),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 12,
                          children: [
                            Text(
                              'سانس ها',
                              style: context.textTheme.headlineSmall,
                            ),
                            Column(
                              spacing: 8,
                              children: [
                                Row(
                                  spacing: 8,
                                  children: [
                                    Container(
                                      width: 26,
                                      height: 26,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: context
                                            .colors
                                            .onBackgroundSecondary
                                            .withValues(alpha: 0.1),
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconWidget(
                                        icon: AssetIcons.notification,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    Text(
                                      'دوشنبه',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: context
                                            .colors
                                            .onBackgroundSecondary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Text(
                                      '20 تا 21:45',
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                            color: context
                                                .colors
                                                .onBackgroundSecondary,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
                        description: state.classItem.description,
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
                        coachName: state.classItem.coach.fullName,
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
            bottomNavigationBar: ClassEnrollmentCard(price: state.classItem.fee),
          );
        } else {
          return Scaffold(
            body: Center(
              child: AppLoadingIndicator(color: context.colors.primary),
            ),
          );
        }
      },
    );
  }
}
