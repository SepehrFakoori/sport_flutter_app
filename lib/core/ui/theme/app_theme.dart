import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/theme/app_colors.dart';
import 'package:sport_flutter_app/core/ui/theme/app_text_theme.dart';
import 'package:sport_flutter_app/core/ui/theme/theme_colors.dart';

/// Easy access to application theme using `AppTheme.light()`
class AppTheme {
  static ThemeData light() => _buildTheme(lightAppColors, Brightness.light);

  static ThemeData dark() => _buildTheme(darkAppColors, Brightness.dark);

  /// Returns the [ThemeData] for light theme using `AppTheme.light()`
  static ThemeData _buildTheme(AppColors colors, Brightness brightness) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: colors.primary,
      brightness: brightness,
    );

    return ThemeData(
      scaffoldBackgroundColor: colors.background,
      useMaterial3: true,

      fontFamily: "Ravi",
      textTheme: AppTextTheme.textTheme,

      colorScheme: colorScheme,
      extensions: [colors],

      // Uses Material 3 Design
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
          minimumSize: WidgetStatePropertyAll<Size>(Size(96, 48)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.red;
            } else if (states.contains(WidgetState.hovered)) {
              return Colors.blue;
            } else {
              return colors.primary;
            }
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.green;
            } else if (states.contains(WidgetState.hovered)) {
              return Colors.red;
            } else {
              return colors.onPrimary;
            }
          }),
        ),
      ),

      // Uses Material 2 Design
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
          minimumSize: WidgetStatePropertyAll<Size>(Size(96, 48)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.red;
            } else if (states.contains(WidgetState.hovered)) {
              return Colors.blue;
            } else {
              return colors.primary;
            }
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.green;
            } else if (states.contains(WidgetState.hovered)) {
              return Colors.red;
            } else {
              return colors.onPrimary;
            }
          }),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(48)),
          minimumSize: WidgetStatePropertyAll<Size>(Size(96, 48)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          side: WidgetStatePropertyAll<BorderSide>(
            BorderSide(color: colors.primary),
          ),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
          foregroundColor: WidgetStatePropertyAll<Color>(colors.primary),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll<Size>(Size.fromHeight(40)),
          minimumSize: WidgetStatePropertyAll<Size>(Size(96, 40)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),

      // inputDecorationTheme: InputDecorationThemeData(
      //   constraints: BoxConstraints(maxHeight: 48),
      //   isDense: true,
      //   border: OutlineInputBorder(),
      // ),
      appBarTheme: AppBarThemeData(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black45,
      ),

      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 1.5,
        indicatorColor: colors.surface,
        backgroundColor: colors.background,
        shadowColor: colors.textPrimary,
        labelPadding: EdgeInsetsGeometry.zero,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextTheme.textTheme.labelLarge!.copyWith(
              color: colors.primary,
              fontWeight: .w600,
              height: 1,
            );
          }
          return AppTextTheme.textTheme.labelLarge!.copyWith(
            color: colors.textSecondary,
            fontWeight: .w600,
            height: 1,
          );
        }),
        height: 72,
      ),

      bottomSheetTheme: BottomSheetThemeData(
        showDragHandle: true,
        modalBackgroundColor: colors.background,
        backgroundColor: colors.background,
        modalElevation: 0.5,
        elevation: 0.5,
        constraints: BoxConstraints(minHeight: 174, maxWidth: 640),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.background,
        barrierColor: colors.background,
        iconColor: colors.primary,
        alignment: AlignmentDirectional.center,
        elevation: 0.5,
        insetPadding: EdgeInsets.all(16),
        constraints: BoxConstraints(minHeight: 174, maxWidth: 640),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
      ),

      dividerTheme: DividerThemeData(color: colors.divider),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        refreshBackgroundColor: colors.background,
      ),

      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: RoundedRectangleBorder(side: BorderSide.none),
        expansionAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 500),
          reverseCurve: Curves.easeInOut,
          reverseDuration: Duration(milliseconds: 500),
        ),
      ),

      listTileTheme: ListTileThemeData(
        tileColor: colors.background,
        iconColor: colors.textPrimary,
      ),

      cardTheme: CardThemeData(color: colors.background),

      badgeTheme: BadgeThemeData(
        backgroundColor: colors.primary,
        textStyle: AppTextTheme.textTheme.labelSmall,
        alignment: AlignmentDirectional.topEnd,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      ),
    );
  }
}
