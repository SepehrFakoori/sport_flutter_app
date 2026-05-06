import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BaseSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? radius;
  final EdgeInsets? margin;
  final BoxShape? shape;

  const BaseSkeleton({
    super.key,
    required this.width,
    required this.height,
    this.radius,
    this.margin,
    this.shape = BoxShape.rectangle,
  }) : assert(
         shape != BoxShape.circle || radius == null,
         'radius must be null when shape is BoxShape.circle',
       );

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Color(0xffeaeaea),
      highlightColor: Color(0xffFFFFFF),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffeaeaea),
          shape: shape ?? BoxShape.rectangle,
          borderRadius: shape == BoxShape.rectangle
              ? (radius ?? BorderRadius.circular(8))
              : null,
        ),
      ),
    );
  }
}
