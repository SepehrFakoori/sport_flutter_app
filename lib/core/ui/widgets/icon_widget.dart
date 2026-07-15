import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class IconWidget extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;

  const IconWidget({super.key, required this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      fit: BoxFit.cover,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? context.colorScheme.onSurface,
        BlendMode.srcIn,
      ),
    );
  }
}
