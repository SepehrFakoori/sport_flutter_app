import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppModalBottomSheet {
  const AppModalBottomSheet._();

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    bool showDragHandle = true,
    String? rootName,
    Object? arguments,
    BorderRadius borderRadius = const .vertical(top: .circular(20)),
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      useSafeArea: true,
      useRootNavigator: true,
      showDragHandle: showDragHandle,
      backgroundColor: context.colors.background,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      routeSettings: RouteSettings(name: rootName, arguments: arguments),
      sheetAnimationStyle: const AnimationStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
        reverseCurve: Curves.easeInOut,
        reverseDuration: Duration(milliseconds: 500),
      ),
      builder: (context) => child,
    );
  }
}
