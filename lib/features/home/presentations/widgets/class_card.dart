import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/image_loader.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/capacity_info.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/coach_info.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/cost_info.dart';
import 'package:sport_flutter_app/features/home/presentations/widgets/location_info.dart';

class ClassCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String coachName;
  final String location;
  final int capacity;
  final int remaining;
  final String cost;

  const ClassCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.coachName,
    required this.location,
    required this.capacity,
    required this.remaining,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(16),
          side: BorderSide(color: context.colors.divider),
        ),
        child: SizedBox(
          width: 220,
          child: Column(
            crossAxisAlignment: .start,
            spacing: 8,
            children: [
              ImageLoader(
                imageUrl: imageUrl,
                height: 140,
                width: 220,
                radius: 16,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsGeometry.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: .ellipsis,
                        style: context.textTheme.titleLarge?.copyWith(
                          height: 1.2,
                        ),
                      ),
                      Spacer(),
                      CoachInfo(coachName: coachName),
                      LocationInfo(location: location),
                      CapacityInfo(capacity: capacity, remaining: remaining),
                      CostInfo(cost: cost),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
