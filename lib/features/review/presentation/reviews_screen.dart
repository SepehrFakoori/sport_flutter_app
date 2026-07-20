import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

enum ReviewType { coachReviews, classReviews }

class ReviewsScreen extends StatelessWidget {
  final int id;
  final ReviewType type;

  const ReviewsScreen({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          scrollDirection: .vertical,
          padding: const .symmetric(horizontal: 16.0),
          itemBuilder: (context, index) => Card(
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
                        fullName: 'username',
                        imageUrl:
                            'https://www.gfxdownload.ir/uploads/posts/2023-02/thumbs/menfigure.jpg',
                        radius: 18,
                      ),
                      Text('username', style: context.textTheme.titleLarge),
                    ],
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Wrap(
                        // spacing: 1,
                        children: List.generate(
                          5,
                          (_) =>
                              IconWidget(icon: AssetIcons.starFilled, size: 10),
                        ),
                      ),
                      const Text('∙'),
                      Text(
                        'time',
                        style: context.textTheme.bodyMedium?.copyWith(
                          color: context.colors.onBackgroundSecondary,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'comment',
                    style: context.textTheme.titleMedium,
                    textAlign: .justify,
                    maxLines: 3,
                    overflow: .ellipsis,
                  ),
                ],
              ),
            ),
          ),
          separatorBuilder: (context, index) => const VerticalDivider(
            thickness: 1,
            endIndent: 32,
            indent: 32,
            width: 5,
          ),
          itemCount: 3,
        ),
      ),
    );
  }
}
