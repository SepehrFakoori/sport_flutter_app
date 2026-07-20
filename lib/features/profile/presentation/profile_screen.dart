import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/services/image_cropper_service.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_modal_bottom_sheet.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_photo_bloc/profile_photo_state.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/bottom_sheet/profile_picture_selection_sheet.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/editable_avatar.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/info_tile.dart';
import 'package:sport_flutter_app/features/profile/profile_field_extensions.dart';

class ProfileScreen extends StatelessWidget {
  final Profile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProfilePhotoBloc>();

    final fields = ProfileField.values;

    List<String> subtitles = [
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
            BlocBuilder<ProfilePhotoBloc, ProfilePhotoState>(
              builder: (context, state) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: EditableAvatar(
                      fullName: subtitles[0],
                      imageUrl: profile.imageUrl,
                      onTap: () async {
                        final CropTheme theme = CropTheme(
                          background: context.colors.background,
                          surface: context.colors.surface,
                          primary: context.colors.primary,
                          onBackground: context.colors.onBackground,
                          title: 'ویرایش',
                        );

                        AppModalBottomSheet.show(
                          context,
                          child: ProfilePictureSelectionSheet(
                            onSourceSelected: (source) => switch (source) {
                              .gallery => bloc.add(
                                ProfileImageGalleryRequested(theme: theme),
                              ),
                              .camera => bloc.add(
                                ProfileImageCameraRequested(theme: theme),
                              ),
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            SliverList.separated(
              itemBuilder: (context, index) => InfoTile(
                title: fields[index].label(context),
                subtitle: subtitles[index],
                onTap: () {
                  context.pushNamed(
                    AppRoutes.editProfile.name!,
                    extra: {'field': fields[index], 'name': subtitles[index]},
                  );
                },
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
