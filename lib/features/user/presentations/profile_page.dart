import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_divider.dart';
import 'package:sport_flutter_app/features/user/presentations/widgets/info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Hero(
                tag: 'profile',
                child: AppCircleAvatar(username: 'روشنا بابائی', radius: 30),
              ),
              SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => InfoTile(
                  title: titles[index],
                  subtitle: subtitles[index],
                  onTap: () {},
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
