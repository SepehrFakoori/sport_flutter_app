import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class ClassComments extends StatelessWidget {
  final String username;
  final String time;
  final String comment;

  const ClassComments({
    super.key,
    required this.username,
    required this.time,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const .symmetric(horizontal: 24.0),
          child: Text(
            context.l10n.class_reviews,
            style: context.textTheme.headlineSmall,
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const .symmetric(horizontal: 24.0),
            itemBuilder: (context, index) => SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.8,
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
                            fullName: username,
                            imageUrl:
                                'https://www.gfxdownload.ir/uploads/posts/2023-02/thumbs/menfigure.jpg',
                            radius: 18,
                          ),
                          Text(username, style: context.textTheme.titleLarge),
                        ],
                      ),
                      Row(
                        spacing: 4,
                        children: [
                          Wrap(
                            // spacing: 1,
                            children: List.generate(
                              5,
                              (_) => IconWidget(
                                icon: AssetIcons.starFilled,
                                height: 10,
                                width: 10,
                              ),
                            ),
                          ),
                          const Text('∙'),
                          Text(
                            time,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onBackgroundSecondary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        comment.toString(),
                        style: context.textTheme.titleMedium,
                        textAlign: .justify,
                        maxLines: 3,
                        overflow: .ellipsis,
                      ),
                    ],
                  ),
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
        Padding(
          padding: const .symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Expanded(
                child: AppFilledButton.secondary(
                  onPressed: () {},
                  title: context.l10n.class_show_more_reviews_title,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
