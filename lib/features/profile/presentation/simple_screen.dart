import 'package:flutter/material.dart';

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: .center, spacing: 16, children: []),
      ),
    );
  }
}
