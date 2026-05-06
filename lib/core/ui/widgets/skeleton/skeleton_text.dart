import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/base_skeleton.dart';

class SkeletonText extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets? margin;

  const SkeletonText({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSkeleton(
      width: width,
      height: height,
      radius: BorderRadius.circular(4),
      margin: margin ?? EdgeInsets.symmetric(vertical: 4),
    );
  }
}
