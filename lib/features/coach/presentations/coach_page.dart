import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_chip.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';

class CoachPage extends StatelessWidget {
  final int coachId;

  const CoachPage({super.key, required this.coachId});

  @override
  Widget build(BuildContext context) {
    final String coachFullName = 'میعاد جاوید';
    final String rate = '۴.۳';

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.coach_appbar_title),
        titleTextStyle: context.textTheme.headlineMedium?.copyWith(
          color: context.colors.primary,
          fontWeight: .w700,
        ),
        centerTitle: true,
        actions: [
          AppIconButton(
            icon: AssetIcons.share,
            onPressed: () {},
            tooltip: context.l10n.home_search_icon_tooltip,
          ),
        ],
        actionsPadding: .symmetric(horizontal: 16),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: context.colors.surface,
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                child: Column(
                  children: [
                    AppCircleAvatar(
                      username: coachFullName,
                      imageUrl:
                          'https://cdn.entekhab.ir/files/fa/news/1401/4/20/1291768_193.jpg',
                      radius: 56,
                    ),
                    SizedBox(height: 16),
                    Text(
                      coachFullName,
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
                        color: context.colors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          '$rate • ',
                          textAlign: .center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                        Text(
                          context.l10n.coach_reviews_label(10),
                          textAlign: .center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
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
                          textStyle: TextStyle(color: context.colors.primary),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    Text(
                      'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                          3,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.textSecondary,
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
                          textStyle: TextStyle(color: context.colors.primary),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    Text(
                      'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                          3,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.textSecondary,
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
                          textStyle: TextStyle(color: context.colors.primary),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    Text(
                      'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                          3,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.textSecondary,
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
                          textStyle: TextStyle(color: context.colors.primary),
                          side: BorderSide.none,
                        ),
                      ),
                    ),
                    Text(
                      'مربی حرفه‌ای بدنسازی و فیتنس. برنامه‌های شخصی‌سازی شده برای هر نفر. از امروز شروع کن، نتیجه رو میبینی.' *
                          3,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.textSecondary,
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
              height: 1.5,
            ),
          ),
          TextSpan(
            text: subtitle,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colors.textSecondary,
              height: 1,
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
