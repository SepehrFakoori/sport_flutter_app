import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/shared/rating_stars.dart';

enum ReviewType { coachReviews, classReviews }

class ReviewsScreen extends StatelessWidget {
  final int id;
  final ReviewType type;

  const ReviewsScreen({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(context.l10n.class_reviews),
        titleTextStyle: context.textTheme.headlineMedium?.copyWith(
          fontWeight: .w600,
        ),
      ),
      body: SafeArea(
        child: ListView.separated(
          scrollDirection: .vertical,
          itemBuilder: (context, index) => Padding(
            padding: const .symmetric(horizontal: 16.0),
            child: Card(
              shadowColor: Colors.transparent,
              child: Padding(
                padding: const .all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        AppCircleAvatar(
                          fullName: 'سپهر فکوری',
                          imageUrl: null,
                          radius: 18,
                        ),
                        Text('سپهر فکوری', style: context.textTheme.titleLarge),
                      ],
                    ),
                    Row(
                      spacing: 4,
                      children: [
                        RatingStars(rating: index > 5 ? 5 : index + 1),
                        Text(
                          DateTime.now().toString(),
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colors.onBackgroundSecondary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'من سهند فکوری هستم میخوام از این کلاس براتون تعریف کنم کلاس نسبتا خوبیه استادش هم خوبه ولی در کل تهران خیلی بهتره تا قزوین ببینیم خدا چی میخواد.',
                      style: context.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) =>
              const AppDivider(indent: 0, endIndent: 0),
          itemCount: 6,
        ),
      ),
    );
  }
}
