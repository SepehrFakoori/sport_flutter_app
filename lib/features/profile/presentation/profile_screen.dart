import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/info_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      context.l10n.profile_firstname_title,
      context.l10n.profile_lastname_title,
      context.l10n.profile_phone_number_title,
      context.l10n.profile_email_title,
    ];

    final List<String> subtitles = [
      'روشنا',
      'بابائی',
      '۰۹۳۰۱۹۱۴۳۲۱',
      'sepehrfakoori@gmail.com',
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
                  AppCircleAvatar(
                    username: 'روشنا بابائی',
                    imageUrl:
                        'https://cdn.tabnak.ir/files/fa/news/1404/9/6/2168532_979.jpg',
                    radius: 56,
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
