import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/theme/app_colors.dart';
import 'package:sport_flutter_app/core/ui/theme/app_text_theme.dart';
import 'package:sport_flutter_app/core/ui/theme/palette.dart';
import 'package:sport_flutter_app/core/ui/theme/theme_colors.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

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
            RoundedRectangleBorder(borderRadius: .circular(AppRadius.sm)),
          ),
          fixedSize: WidgetStatePropertyAll<Size>(.fromHeight(48)),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            .symmetric(horizontal: AppSpacing.xxl),
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
            RoundedRectangleBorder(borderRadius: .circular(AppRadius.sm)),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            .symmetric(horizontal: AppSpacing.sm),
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
            RoundedRectangleBorder(borderRadius: .circular(AppRadius.sm)),
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
          fixedSize: WidgetStatePropertyAll<Size>(.fromHeight(48)),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            .symmetric(horizontal: AppSpacing.xxl),
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
            RoundedRectangleBorder(borderRadius: .circular(AppRadius.sm)),
          ),
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            .symmetric(horizontal: AppSpacing.md, vertical: 0),
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

      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          alignment: .center,
          shape: WidgetStateOutlinedBorder.resolveWith((states) {
            return RoundedRectangleBorder(
              borderRadius: .circular(AppRadius.md),
            );
          }),
          side: WidgetStateBorderSide.resolveWith((states) {
            final color = switch (states) {
              _ when states.contains(WidgetState.hovered) =>
                AppPalette.primary10,
              _ when states.contains(WidgetState.pressed) => colors.secondary,
              _ => AppPalette.neutral30,
            };
            return BorderSide(color: color);
          }),
          backgroundColor: WidgetStateColor.resolveWith((states) {
            final color = switch (states) {
              _ when states.contains(WidgetState.selected) => colors.secondary,
              _ => colors.surface,
            };
            return color;
          }),
          foregroundColor: WidgetStateColor.resolveWith((states) {
            final color = switch (states) {
              _ when states.contains(WidgetState.selected) =>
                colors.onSecondary,
              _ => colors.onBackground,
            };
            return color;
          }),
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primary,
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
          borderRadius: .vertical(top: .circular(AppRadius.xxxl)),
        ),
      ),

      dialogTheme: DialogThemeData(
        backgroundColor: colors.background,
        barrierColor: colors.background,
        iconColor: colors.primary,
        alignment: AlignmentDirectional.center,
        elevation: 0.5,
        insetPadding: const .all(AppSpacing.lg),
        constraints: BoxConstraints(minHeight: 174, maxWidth: 640),
        shape: RoundedRectangleBorder(
          borderRadius: const .all(.circular(AppRadius.xxxl)),
        ),
      ),

      dividerTheme: DividerThemeData(color: colors.divider),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        refreshBackgroundColor: colors.background,
        color: colors.primary,
        circularTrackColor: colors.surface,
        linearTrackColor: colors.surface,
        stopIndicatorColor: colors.surface,
      ),

      expansionTileTheme: ExpansionTileThemeData(
        tilePadding: .zero,
        childrenPadding: .zero,
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

      chipTheme: ChipThemeData(
        checkmarkColor: colors.primary,
        padding: const .symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        color: WidgetStateColor.resolveWith((states) {
          final color = switch (states) {
            _ when states.contains(WidgetState.selected) =>
              colors.primary.withValues(alpha: 0.05),
            _ => colors.background,
          };
          return color;
        }),
        shape: RoundedRectangleBorder(borderRadius: .circular(AppRadius.xxl)),
      ),

      badgeTheme: BadgeThemeData(
        backgroundColor: colors.primary,
        textStyle: AppTextTheme.textTheme.labelSmall,
        alignment: AlignmentDirectional.topEnd,
        padding: const .symmetric(vertical: 0, horizontal: 2),
      ),

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
        labelPadding: const .symmetric(vertical: AppSpacing.md),
      ),

      datePickerTheme: DatePickerThemeData(dividerColor: colors.divider),

      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          .android: FadeForwardsPageTransitionsBuilder(),
          .iOS: FadeForwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
