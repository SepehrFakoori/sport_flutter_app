import 'package:flutter/material.dart';

class AppTextTheme {
  AppTextTheme._();

  static final TextTheme _base = ThemeData.light().textTheme;

  static final TextTheme textTheme = _base.copyWith(
    displayLarge: const TextStyle(
      fontSize: 56,
      fontWeight: FontWeight.w500,
      height: 1.28,
    ),
    displayMedium: const TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w500,
      height: 1.33,
    ),
    displaySmall: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    headlineLarge: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.66,
    ),
    headlineMedium: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.8,
    ),
    headlineSmall: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.77,
    ),

    titleLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.75,
    ),
    titleMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 2,
    ),

    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.62,
    ),
    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.57,
    ),

    labelLarge: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.66,
    ),
    labelSmall: const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.8,
    ),
  );
}
