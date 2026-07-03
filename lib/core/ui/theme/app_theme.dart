import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/theme/app_colors.dart';
import 'package:sport_flutter_app/core/ui/theme/app_text_theme.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
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

      fontFamily: AppTextTheme.fontFamily,
      textTheme: AppTextTheme.textTheme,

      colorScheme: colorScheme,
      extensions: [colors],

      // Uses Material 3 Design
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
          fixedSize: WidgetStatePropertyAll<Size>(.fromHeight(48)),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 24),
          ),
          backgroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppPalette.primary70;
            } else if (states.contains(WidgetState.focused)) {
              return AppPalette.primary60;
            } else if (states.contains(WidgetState.pressed)) {
              return AppPalette.primary80;
            } else if (states.contains(WidgetState.disabled)) {
              return colors.tertiary;
            } else {
              return colors.primary;
            }
          }),
          foregroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onTertiary;
            }
            return colors.onPrimary;
          }),
          textStyle: WidgetStateTextStyle.resolveWith((states) {
            return TextStyle(
              fontFamily: AppTextTheme.fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
          }),
          side: WidgetStateBorderSide.resolveWith((states) {
            return .none;
          }),
          alignment: .center,
          iconColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colors.onTertiary;
            }
            return colors.onPrimary;
          }),
          iconSize: WidgetStatePropertyAll(16),
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
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
          side: WidgetStateBorderSide.resolveWith((states) {
            final color = switch (states) {
              _ when states.contains(WidgetState.hovered) =>
                AppPalette.primary70,
              _ when states.contains(WidgetState.focused) =>
                AppPalette.primary60,
              _ when states.contains(WidgetState.pressed) =>
                AppPalette.primary80,
              _ when states.contains(WidgetState.disabled) => colors.onTertiary,
              _ => colors.primary,
            };
            return BorderSide(color: color, width: 1, style: .solid);
          }),
          textStyle: WidgetStateTextStyle.resolveWith((states) {
            return TextStyle(
              fontFamily: AppTextTheme.fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
          }),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          ),
          backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
          foregroundColor: WidgetStateColor.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return AppPalette.primary70;
            } else if (states.contains(WidgetState.focused)) {
              return AppPalette.primary60;
            } else if (states.contains(WidgetState.pressed)) {
              return AppPalette.primary80;
            } else if (states.contains(WidgetState.disabled)) {
              return colors.onTertiary;
            } else {
              return colors.primary;
            }
          }),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: .circular(8)),
          ),
          padding: WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          ),
          foregroundColor: WidgetStatePropertyAll<Color>(colors.primary),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(CircleBorder()),
          backgroundColor: WidgetStateColor.resolveWith((states) {
            final color = switch (states) {
              _ when states.contains(WidgetState.hovered) =>
                AppPalette.primary10,
              _ when states.contains(WidgetState.focused) =>
                AppPalette.primary60,
              _ when states.contains(WidgetState.pressed) =>
                AppPalette.neutral20,
              _ when states.contains(WidgetState.disabled) =>
                AppPalette.neutral50,
              _ => AppPalette.neutral30,
            };
            return color;
          }),
          tapTargetSize: .shrinkWrap,
          alignment: .center,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
      ),

      inputDecorationTheme: InputDecorationThemeData(
        border: OutlineInputBorder(),
      ),

      appBarTheme: AppBarThemeData(
        backgroundColor: colors.background,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black45,
      ),

      navigationBarTheme: NavigationBarThemeData(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        elevation: 1.5,
        indicatorColor: AppPalette.primary10,
        backgroundColor: colors.background,
        shadowColor: colors.onBackground,
        labelPadding: EdgeInsetsGeometry.zero,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppTextTheme.textTheme.labelLarge!.copyWith(
              color: colors.primary,
              fontWeight: .w600,
            );
          }
          return AppTextTheme.textTheme.labelLarge!.copyWith(
            color: colors.onBackgroundSecondary,
            fontWeight: .w600,
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
        iconColor: colors.onBackground,
      ),

      cardTheme: CardThemeData(color: colors.background),

      badgeTheme: BadgeThemeData(
        backgroundColor: colors.primary,
        textStyle: AppTextTheme.textTheme.labelSmall,
        alignment: AlignmentDirectional.topEnd,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
      ),

      chipTheme: ChipThemeData(labelStyle: AppTextTheme.textTheme.labelLarge),

      tabBarTheme: TabBarThemeData(
        dividerColor: colors.surface,
        indicatorAnimation: .elastic,
        indicatorColor: colors.secondary,
        indicatorSize: .tab,
        tabAlignment: .start,
        unselectedLabelColor: colors.onTertiary,
        labelColor: colors.secondary,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: colors.secondary,
            width: 2,
            style: .solid,
          ),
          borderRadius: .circular(1),
        ),
        labelPadding: .symmetric(horizontal: 12),
      ),
    );
  }
}
