import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class EditableAvatar extends StatelessWidget {
  final String fullName;
  final String? imageUrl;
  final VoidCallback? onTap;

  const EditableAvatar({
    super.key,
    required this.fullName,
    this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Badge(
        label: IconWidget(icon: AssetIcons.edit, height: 20, width: 20),
        padding: .all(4),
        backgroundColor: context.colors.tertiary,
        alignment: .bottomStart,
        offset: Offset(-16, -16),
        child: AppCircleAvatar(
          fullName: fullName,
          imageUrl: imageUrl,
          radius: 56,
        ),
      ),
    );
  }
}
