import 'package:flutter/material.dart';

class AppModalBottomSheet {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    String? rootName,
    Object? arguments,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      useRootNavigator: true,
      routeSettings: RouteSettings(name: rootName, arguments: arguments),
      sheetAnimationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
        reverseCurve: Curves.easeInOut,
        reverseDuration: Duration(milliseconds: 500),
      ),
      constraints: BoxConstraints(minWidth: double.infinity),
      builder: (context) => child,
    );
  }
}
