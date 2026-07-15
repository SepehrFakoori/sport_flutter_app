import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/class/presentation/widgets/summary_stat.dart';

class ClassOverview extends StatelessWidget {
  final String title;
  final String address;
  final int reviewCount;
  final double rating;

  const ClassOverview({
    super.key,
    required this.title,
    required this.address,
    required this.reviewCount,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 16.0),
      child: Column(
        spacing: 24,
        children: [
          Column(
            spacing: 4,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: .ellipsis,
                textAlign: .center,
                style: context.textTheme.headlineLarge,
              ),
              Text(
                address,
                maxLines: 2,
                overflow: .ellipsis,
                textAlign: .center,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.onBackgroundSecondary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .center,
            spacing: 16,
            children: [
              SummaryStat(
                value: reviewCount,
                label: context.l10n.class_review_title,
              ),
              SizedBox(height: 48, child: VerticalDivider()),
              Expanded(
                child: Text(
                  'ویژه آقایان',
                  maxLines: 2,
                  overflow: .ellipsis,
                  textAlign: .center,
                  style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: .w700,
                  ),
                ),
              ),
              SizedBox(height: 48, child: VerticalDivider()),
              SummaryStat(value: 4.1, label: 'امتیاز'),
            ],
          ),
        ],
      ),
    );
  }
}
