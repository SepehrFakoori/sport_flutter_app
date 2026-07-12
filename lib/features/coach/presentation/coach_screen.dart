import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_chip.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_loading_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_bloc.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_event.dart';
import 'package:sport_flutter_app/features/coach/presentation/bloc/coach_bloc/coach_state.dart';

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
            appBar: CustomAppBar(
              title: Text(context.l10n.coach_appbar_title),
              titleTextStyle: context.textTheme.headlineMedium?.copyWith(
                color: context.colors.primary,
                fontWeight: .w700,
              ),
              actions: [
                AppIconButton(
                  icon: AssetIcons.share,
                  onPressed: () {},
                  tooltip: context.l10n.home_search_icon_tooltip,
                ),
              ],
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: context.colors.surface,
                      padding: EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          AppCircleAvatar(
                            fullName: state.coach.fullName,
                            imageUrl:
                                'https://cdn.entekhab.ir/files/fa/news/1401/4/20/1291768_193.jpg',
                            radius: 56,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            state.coach.fullName,
                            textAlign: .center,
                            maxLines: 2,
                            overflow: .ellipsis,
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontWeight: .w700,
                            ),
                          ),
                          Text(
                            'مربی بدنسازی و مربی پیلاتس',
                            textAlign: .center,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              Text(
                                '${state.coach.id} • ',
                                textAlign: .center,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.onBackgroundSecondary,
                                ),
                              ),
                              Text(
                                context.l10n.coach_reviews_label(10),
                                textAlign: .center,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.onBackgroundSecondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              ShortDetail(title: '۳۳۳', subtitle: 'شاگرد'),
                              SizedBox(
                                height: 38,
                                child: VerticalDivider(
                                  color: context.colors.divider,
                                  width: 36,
                                ),
                              ),
                              ShortDetail(title: '۳۳', subtitle: 'کلاس'),
                              SizedBox(
                                height: 38,
                                child: VerticalDivider(
                                  color: context.colors.divider,
                                  width: 36,
                                ),
                              ),
                              ShortDetail(title: '۳', subtitle: 'سال تجربه'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppDivider(endIndent: 0, indent: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        spacing: 16,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 8,
                            runSpacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                              chips.length,
                              (index) => AppChip(
                                labelText: chips[index],
                                backgroundColor: context.colors.surface,
                                textStyle: TextStyle(
                                  color: context.colors.primary,
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          Text(
                            'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                                3,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDivider(endIndent: 0, indent: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        spacing: 16,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 8,
                            runSpacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                              chips.length,
                              (index) => AppChip(
                                labelText: chips[index],
                                backgroundColor: context.colors.surface,
                                textStyle: TextStyle(
                                  color: context.colors.primary,
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          Text(
                            'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                                3,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDivider(endIndent: 0, indent: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        spacing: 16,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 8,
                            runSpacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                              chips.length,
                              (index) => AppChip(
                                labelText: chips[index],
                                backgroundColor: context.colors.surface,
                                textStyle: TextStyle(
                                  color: context.colors.primary,
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          Text(
                            'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                                3,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDivider(endIndent: 0, indent: 0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Column(
                        spacing: 16,
                        children: [
                          Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 8,
                            runSpacing: 8,
                            direction: Axis.horizontal,
                            children: List.generate(
                              chips.length,
                              (index) => AppChip(
                                labelText: chips[index],
                                backgroundColor: context.colors.surface,
                                textStyle: TextStyle(
                                  color: context.colors.primary,
                                ),
                                side: BorderSide.none,
                              ),
                            ),
                          ),
                          Text(
                            'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                                3,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppDivider(endIndent: 0, indent: 0),
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
