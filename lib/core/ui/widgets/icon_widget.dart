import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  final double? height;
  final double? width;
  final Color? color;

  const IconWidget({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.cover,
      height: height,
      width: width,
      colorFilter: ColorFilter.mode(
        color ?? context.colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}
