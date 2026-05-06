import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/l10n/app_localizations.dart';
import 'package:sport_flutter_app/core/ui/theme/app_colors.dart';

extension BuildContextExtensions on BuildContext {
  /// Returns the [MediaQuery.sizeOf(context)].
  Size get size => MediaQuery.sizeOf(this);

  /// Returns the [MediaQuery.sizeOf(context).height].
  double get deviceHeight => size.height;

  /// Returns the [MediaQuery.sizeOf(context).width].
  double get deviceWidth => size.width;

  /// Returns the current [TextTheme] instance.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current [ColorScheme] instance.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns the current [AppColors] instance.
  AppColors get colors => Theme.of(this).extension<AppColors>()!;

  /// Returns the current [ScaffoldMessengerState] instance.
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  /// Returns the localization [AppLocalization] instance.
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
