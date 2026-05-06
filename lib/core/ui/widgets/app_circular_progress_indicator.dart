import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      padding: EdgeInsets.all(8),
      constraints: BoxConstraints.expand(width: 24, height: 24),
      strokeCap: StrokeCap.round,
    );
  }
}
