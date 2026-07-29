import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class EditPhoneActionChip extends StatelessWidget {
  final String phone;

  const EditPhoneActionChip({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Row(
        mainAxisSize: .min,
        spacing: AppSpacing.xs,
        children: [
          Text(phone, style: context.textTheme.titleMedium),
          IconWidget(icon: AppIcons.edit, size: 14),
        ],
      ),
      onPressed: () {
        context.pop();
      },
      backgroundColor: context.colors.tertiary,
      side: .none,
      shape: RoundedRectangleBorder(borderRadius: .circular(64)),
      padding: const .symmetric(horizontal: AppSpacing.sm),
    );
  }
}
