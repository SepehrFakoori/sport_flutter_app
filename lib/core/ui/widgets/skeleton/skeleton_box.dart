import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/skeleton/base_skeleton.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? radius;
  final BoxShape? shape;

  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.radius,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSkeleton(
      width: width,
      height: height,
      radius: radius,
      shape: shape,
    );
  }
}
