import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/services/image_picker_service.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/domain/repository/profile_repository.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/editable_avatar.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/info_tile.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/menu_tile.dart';

class ProfileScreen extends StatelessWidget {
  final Profile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.l10n.profile_firstname_title,
      context.l10n.profile_lastname_title,
      context.l10n.profile_phone_number_title,
      context.l10n.profile_email_title,
    ];

    final List<String> subtitles = [
      profile.firstName,
      profile.lastName,
      profile.phone,
      profile.email ?? '',
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            AppSliverAppBar(
              title: context.l10n.profile_appbar_title,
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Center(
                child: EditableAvatar(
                  fullName: subtitles[0],
                  imageUrl: profile.imageUrl,
                  onTap: () async {
                    final file = await sl<ImagePickerService>()
                        .pickFromGallery();
                    await sl<ProfileRepository>().uploadProfilePhoto(
                      file: file!,
                      onProgress: (progress) {},
                    );
                  },
                ),
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) => InfoTile(
                title: titles[index],
                subtitle: subtitles[index],
                onTap: () => context.pushNamed(
                  AppRoutes.editProfile.name!,
                  extra: {'title': titles[index], 'name': subtitles[index]},
                ),
              ),
              separatorBuilder: (context, index) => AppDivider(endIndent: 0),
              itemCount: 4,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfilePictureSelectionSheet extends StatelessWidget {
  final VoidCallback onOpenGallery;
  final VoidCallback onTakePhoto;

  const ProfilePictureSelectionSheet({
    super.key,
    required this.onOpenGallery,
    required this.onTakePhoto,
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
          icon: AssetIcons.galleryAdd,
          onTap: onOpenGallery,
        ),
        MenuTile(
          title: context.l10n.take_photo_title,
          icon: AssetIcons.camera,
          onTap: onTakePhoto,
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
