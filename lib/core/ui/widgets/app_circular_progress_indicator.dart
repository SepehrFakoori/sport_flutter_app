import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final double? value;

  const AppCircularProgressIndicator({super.key, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      padding: const .all(8),
      constraints: BoxConstraints.expand(width: 24, height: 24),
      strokeCap: StrokeCap.round,
      value: value,
    );
  }
}
