import 'package:flutter/material.dart';

class AppPressableScale extends StatefulWidget {
  const AppPressableScale({
    super.key,
    required this.child,
    this.isActive = true,
    this.scale = 0.96,
    this.duration = const Duration(milliseconds: 100),
  });

  final Widget child;
  final bool isActive;
  final double scale;
  final Duration duration;

  @override
  State<AppPressableScale> createState() => _AppPressableScaleState();
}

class _AppPressableScaleState extends State<AppPressableScale> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed != value) setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _setPressed(true),
      onPointerUp: (_) => _setPressed(false),
      onPointerCancel: (_) => _setPressed(false),
      behavior: .opaque,
      child: AnimatedScale(
        scale: widget.isActive ? (_pressed ? widget.scale : 1.0) : 1.0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}
