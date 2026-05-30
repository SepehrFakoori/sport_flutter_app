import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color background;
  final Color surface;
  final Color onPrimary;
  final Color onSecondary;
  final Color onTertiary;
  final Color onBackground;
  final Color onBackgroundSecondary;
  final Color onSurface;
  final Color divider;
  final Color error;

  const AppColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.background,
    required this.surface,
    required this.onPrimary,
    required this.onSecondary,
    required this.onTertiary,
    required this.onBackground,
    required this.onBackgroundSecondary,
    required this.onSurface,
    required this.divider,
    required this.error,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? background,
    Color? surface,
    Color? onPrimary,
    Color? onSecondary,
    Color? onTertiary,
    Color? onBackground,
    Color? onBackgroundSecondary,
    Color? onSurface,
    Color? divider,
    Color? error,
  }) {
    return AppColors(
      primary: primary ?? this.primary,
      secondary: primary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onPrimary: onPrimary ?? this.onPrimary,
      onSecondary: onSecondary ?? this.onSecondary,
      onTertiary: onTertiary ?? this.onTertiary,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundSecondary:
          onBackgroundSecondary ?? this.onBackgroundSecondary,
      onSurface: onSurface ?? this.onSurface,
      divider: divider ?? this.divider,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
    covariant ThemeExtension<AppColors>? other,
    double t,
  ) {
    if (other is! AppColors) return this;

    return AppColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundSecondary: Color.lerp(
        onBackgroundSecondary,
        other.onBackgroundSecondary,
        t,
      )!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      error: Color.lerp(error, other.error, t)!,
    );
  }
}
