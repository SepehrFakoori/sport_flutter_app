import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sport_flutter_app/core/constant/assets_lotties.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppLoadingIndicator extends StatelessWidget {
  final Color? color;

  const AppLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AssetsLotties.loading,
      fit: .fill,
      height: 32,
      addRepaintBoundary: true,
      alignment: .center,
      delegates: _delegates(color ?? context.colors.onPrimary),
    );
  }

  LottieDelegates _delegates(Color color) {
    // keyPath order: ['layer name', 'group name', 'shape name']
    // lottie group names are Dot1..Dot4:
    final List<String> dotNames = List.generate(4, (i) => 'Dot${i + 1}');

    return LottieDelegates(
      values: [
        for (final dot in dotNames)
          ValueDelegate.color(['**', dot, '**'], value: color),
      ],
    );
  }
}
