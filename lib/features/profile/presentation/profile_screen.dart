import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_badge.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/info_tile.dart';

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
      profile.fullName,
      profile.fullName,
      profile.phoneNumber,
      profile.email ?? '',
    ];

    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            spacing: 24,
            children: [
              Column(
                crossAxisAlignment: .center,
                mainAxisSize: .max,
                children: [
                  Padding(
                    padding: const .only(top: 12.0, bottom: 24.0),
                    child: Text(
                      context.l10n.profile_appbar_title,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: .w600,
                      ),
                    ),
                  ),
                  EditableAvatar(
                    fullName: subtitles[0],
                    onTap: () {},
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
      ),
    );
  }
}

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
