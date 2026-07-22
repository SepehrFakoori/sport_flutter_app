import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .start,
          children: [
            Text(
              'مرحله 1 از 2',
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colors.primary,
              ),
            ),
            Text('ثبت نام اولیه'),
          ],
        ),
        titleTextStyle: context.textTheme.headlineMedium?.copyWith(
          fontWeight: .w600,
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          itemBuilder: (context, index) => Container(
            height: double.infinity,
            width: double.infinity,
            color: context.colors.secondary,
            alignment: .center,
            padding: const .symmetric(horizontal: 16.0),
            child: Text(
              '${index + 1}',
              style: context.textTheme.headlineLarge?.copyWith(
                color: context.colors.onSecondary,
              ),
            ),
          ),
          itemCount: 4,
        ),
      ),
    );
  }
}
