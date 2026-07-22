import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/shared/rating_stars.dart';
import 'package:sport_flutter_app/features/review/domain/entity/review.dart';

class ReviewsSection extends StatelessWidget {
  final List<Review> reviews;
  final VoidCallback onPressed;

  const ReviewsSection({
    super.key,
    required this.reviews,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 16.0),
          child: Text(
            context.l10n.class_reviews,
            style: context.textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: 164,
          child: PageView.builder(
            scrollDirection: .horizontal,
            pageSnapping: true,
            itemBuilder: (context, index) {
              final Review review = reviews[index];

              return Card(
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const .symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    mainAxisAlignment: .center,
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          AppCircleAvatar(
                            fullName: review.author,
                            imageUrl: null,
                            radius: 20,
                          ),
                          Text(
                            review.author,
                            style: context.textTheme.titleLarge,
                          ),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          RatingStars(rating: review.rating),
                          Text(
                            review.createdAt.toString(),
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        review.comment,
                        maxLines: 3,
                        overflow: .ellipsis,
                        style: context.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: reviews.length,
          ),
        ),
        const SizedBox(height: 16),
        AppFilledButton.secondary(
          onPressed: onPressed,
          title: context.l10n.class_show_more_reviews_title,
          isWide: true,
        ),
      ],
    );
  }
}
