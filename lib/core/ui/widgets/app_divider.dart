import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double? height;
  final double? indent;
  final double? endIndent;

  const AppDivider({
    super.key,
    this.height = 0,
    this.indent = 16,
    this.endIndent = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: height, indent: indent, endIndent: endIndent);
  }
}
