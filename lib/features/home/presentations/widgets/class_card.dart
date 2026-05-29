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
  final String firstname;
  final String lastname;
  final String location;
  final int capacity;
  final int remaining;
  final String cost;

  const ClassCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.location,
    required this.capacity,
    required this.remaining,
    required this.cost,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(16),
          side: BorderSide(color: context.colors.divider),
        ),
        child: SizedBox(
          width: 224,
          child: Column(
            crossAxisAlignment: .start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ImageLoader(imageUrl: imageUrl, radius: 16),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          maxLines: 2,
                          overflow: .ellipsis,
                          style: context.textTheme.titleLarge?.copyWith(
                            height: 1.4,
                          ),
                        ),
                      ),
                      CoachInfo(firstname: firstname, lastname: lastname),
                      LocationInfo(location: location),
                      CapacityInfo(remaining: remaining),
                      SizedBox(height: 12),
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
