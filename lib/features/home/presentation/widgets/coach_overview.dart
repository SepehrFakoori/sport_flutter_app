import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_card.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';

class CoachOverview extends StatelessWidget {
  final String? imageUrl;
  final String coachName;
  final String coachSport;
  final double rate;
  final int coachComment;
  final VoidCallback? onTap;

  const CoachOverview({
    super.key,
    required this.imageUrl,
    required this.coachName,
    required this.rate,
    required this.coachComment,
    required this.coachSport, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 260,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: CustomCard(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ImageLoader(
                  imageUrl: imageUrl,
                  height: 260,
                  width: 180,
                  radius: 0,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xE6000000),
                        Color(0x99000000),
                        Color(0x33000000),
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.45, 0.72, 1.0],
                    ),
                  ),
                ),
                Padding(
                  padding: const .all(8.0),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisAlignment: .end,
                    spacing: 4,
                    children: [
                      Text(
                        coachName,
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.onSecondary,
                        ),
                      ),
                      Text(
                        'مربی $coachSport',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colors.onTertiary,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: .start,
                        crossAxisAlignment: .center,
                        spacing: 4,
                        children: [
                          IconWidget(
                            icon: AssetIcons.starFilled,
                            width: 14,
                            height: 14,
                            color: AppPalette.semantic3,
                          ),
                          Text(
                            rate.toString(),
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.colors.onSecondary,
                              fontWeight: .w600,
                            ),
                          ),
                          Text(
                            '($coachComment)',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: context.colors.onSecondary,
                              fontWeight: .w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
