import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class ClassSummaryDetail extends StatelessWidget {
  final String title;
  final String address;
  final int comments;
  final double rate;

  const ClassSummaryDetail({
    super.key,
    required this.title,
    required this.address,
    required this.comments,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text(title, style: context.textTheme.headlineLarge),
                Text(
                  address,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onBackgroundSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: .center,
                children: [
                  Text(comments.toString(), style: context.textTheme.bodyLarge),
                  Text(
                    context.l10n.class_review_title,
                    style: context.textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                child: VerticalDivider(thickness: 1, width: 32),
              ),
              IconWidget(icon: AssetIcons.medal, height: 24, width: 24),
              Text(
                'محبوب بین ورزشکاران',
                maxLines: 1,
                overflow: .ellipsis,
                style: context.textTheme.titleLarge,
              ),
              IconWidget(icon: AssetIcons.medal, height: 24, width: 24),
              const SizedBox(
                height: 30,
                child: VerticalDivider(thickness: 1, width: 32),
              ),
              Column(
                crossAxisAlignment: .center,
                children: [
                  Text(rate.toString(), style: context.textTheme.bodyLarge),
                  Wrap(
                    spacing: 1,
                    children: List.generate(
                      5,
                      (_) => IconWidget(
                        icon: AssetIcons.starFilled,
                        height: 10,
                        width: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
