import 'package:flutter/material.dart';

class AppDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    String? rootName,
    Object? arguments,
  }) {
    return showDialog(
      context: context,
      useSafeArea: true,
      useRootNavigator: true,
      fullscreenDialog: false,
      requestFocus: true,
      barrierDismissible: true,
      routeSettings: RouteSettings(name: rootName, arguments: arguments),
      animationStyle: AnimationStyle(
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 500),
        reverseCurve: Curves.easeInOut,
        reverseDuration: Duration(milliseconds: 500),
      ),
      builder: (context) => child,
    );
  }
}
