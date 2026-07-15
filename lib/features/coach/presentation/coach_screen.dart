import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/shared/reviews_section.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/coach_card.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_bloc.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_event.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_state.dart';
import 'package:sport_flutter_app/features/home/presentation/widgets/horizontal_class_card_list.dart';
import 'package:sport_flutter_app/features/review/domain/entity/review.dart';

class CoachScreen extends StatefulWidget {
  final int coachId;

  const CoachScreen({super.key, required this.coachId});

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CoachBloc>().add(GetCoach(widget.coachId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoachBloc, CoachState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
            appBar: CustomAppBar(),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .stretch,
                  spacing: 24,
                  children: [
                    const SizedBox(height: 24),
                    Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: CoachCard(coach: state.coach),
                    ),
                    Padding(
                      padding: const .symmetric(horizontal: 16.0),
                      child: Text(
                        context.l10n.coach_class,
                        style: context.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(
                      height: 293,
                      child: HorizontalClassCardList(
                        classes: [
                          Class(
                            id: 1,
                            title: 'تکواندو',
                            description: 'یک باشگاه دوست داشتنی',
                            fee: 250000,
                            capacity: 20,
                            remainingCapacity: 5,
                            isFull: false,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 2,
                            title: 'بدنسازی',
                            description: 'تمرینات قدرتی و افزایش حجم عضلات',
                            fee: 450000,
                            capacity: 25,
                            remainingCapacity: 8,
                            isFull: false,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 3,
                            title: 'پیلاتس',
                            description:
                                'افزایش انعطاف و تقویت عضلات مرکزی بدن',
                            fee: 380000,
                            capacity: 18,
                            remainingCapacity: 0,
                            isFull: true,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 4,
                            title: 'تی آر ایکس',
                            description: 'تمرینات تعلیقی برای کل بدن',
                            fee: 420000,
                            capacity: 15,
                            remainingCapacity: 3,
                            isFull: false,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 5,
                            title: 'فیتنس',
                            description: 'برنامه جامع تناسب اندام',
                            fee: 300000,
                            capacity: 30,
                            remainingCapacity: 12,
                            isFull: false,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 6,
                            title: 'کراس فیت',
                            description: 'تمرینات هوازی و قدرتی با شدت بالا',
                            fee: 550000,
                            capacity: 16,
                            remainingCapacity: 0,
                            isFull: true,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 3,
                            title: 'پیلاتس',
                            description:
                                'افزایش انعطاف و تقویت عضلات مرکزی بدن',
                            fee: 380000,
                            capacity: 18,
                            remainingCapacity: 0,
                            isFull: true,
                            coach: state.coach,
                            isActive: true,
                          ),
                          Class(
                            id: 4,
                            title: 'تی آر ایکس',
                            description: 'تمرینات تعلیقی برای کل بدن',
                            fee: 420000,
                            capacity: 15,
                            remainingCapacity: 3,
                            isFull: false,
                            coach: state.coach,
                            isActive: true,
                          ),
                        ],
                      ),
                    ),
                    AppDivider(),
                    ReviewsSection(
                      reviews: List.generate(
                        8,
                        (index) => Review(
                          id: index,
                          author: 'سهند فکوری',
                          rating: index > 5 ? 5 : index,
                          comment:
                              'من سهند فکوری هستم میخوام از این کلاس براتون تعریف کنم کلاس نسبتا خوبیه استادش هم خوبه ولی در کل تهران خیلی بهتره تا قزوین ببینیم خدا چی میخواد.',
                          createdAt: DateTime.now(),
                        ),
                      ),
                      onPressed: () => context.pushNamed(
                        AppRoutes.coachReviews.name!,
                        pathParameters: {'id': '${state.coach.id}'},
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
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

class ShortDetail extends StatelessWidget {
  final String title;
  final String subtitle;

  const ShortDetail({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title\n',
            style: context.textTheme.titleLarge?.copyWith(
              color: context.colors.primary,
            ),
          ),
          TextSpan(
            text: subtitle,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.onBackgroundSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

final List<String> chips = [
  'بدنسازی',
  'پیلاتس',
  'تی آر ایکس',
  'فیتنس',
  'بدنسازی',
  'پیلاتس',
  'تی آر ایکس',
  'فیتنس',
];
