import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circular_progress_indicator.dart';

class LoadingBottomSheet extends StatelessWidget {
  const LoadingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        spacing: 8,
        children: [
          AppCircularProgressIndicator(),
          Expanded(
            child: Text(
              'context.l10n.loading',
              style: context.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
