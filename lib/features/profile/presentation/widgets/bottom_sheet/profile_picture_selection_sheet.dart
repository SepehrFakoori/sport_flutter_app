import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/menu_tile.dart';

enum ProfilePictureSource { gallery, camera }

class ProfilePictureSelectionSheet extends StatelessWidget {
  final ValueChanged<ProfilePictureSource> onSourceSelected;

  const ProfilePictureSelectionSheet({
    super.key,
    required this.onSourceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        Padding(
          padding: const .directional(start: 16.0, end: 16.0, bottom: 16.0),
          child: Text(
            context.l10n.choose_profile_photo_sheet_title,
            style: context.textTheme.headlineSmall,
          ),
        ),
        MenuTile(
          title: context.l10n.choose_from_gallery_title,
          icon: AppIcons.galleryAdd,
          onTap: () => onSourceSelected(.gallery),
        ),
        MenuTile(
          title: context.l10n.take_photo_title,
          icon: AppIcons.camera,
          onTap: () => onSourceSelected(.camera),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
