import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class AppChip extends StatelessWidget {
  final String labelText;
  final Color? backgroundColor;
  final BorderSide? side;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? labelPadding;
  final MaterialTapTargetSize? materialTapTargetSize;
  final OutlinedBorder? shape;

  const AppChip({
    super.key,
    required this.labelText,
    this.backgroundColor,
    this.side,
    this.textStyle,
    this.labelPadding,
    this.materialTapTargetSize = .shrinkWrap,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: side,
      labelPadding:
          labelPadding ?? EdgeInsets.symmetric(horizontal: 4, vertical: -4),
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      materialTapTargetSize: materialTapTargetSize,
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      label: Text(labelText, textAlign: .center),
      labelStyle: context.textTheme.labelLarge
          ?.copyWith(color: side?.color)
          .merge(textStyle),
    );
  }
}
