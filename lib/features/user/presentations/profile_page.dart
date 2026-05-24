import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/menu_tile.dart';
import 'package:sport_flutter_app/features/user/presentations/widgets/profile_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileTile(
                username: 'سپهر فکوری',
                phoneNumber: '۰۹۳۰۱۹۱۴۳۲۱',
                onTap: () {},
              ),
              MenuTile(
                title: context.l10n.profile_enrollments_button,
                icon: AssetIcons.receiptItem,
              ),
              MenuTile(
                title: context.l10n.profile_settings_button,
                icon: AssetIcons.setting,
              ),
              MenuTile(
                title: context.l10n.profile_support_button,
                icon: AssetIcons.headphone,
              ),
              MenuTile(
                title: context.l10n.profile_invite_friends_button,
                icon: AssetIcons.profileAdd,
              ),
              MenuTile(
                title: context.l10n.profile_policy_button,
                icon: AssetIcons.taskSquare,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
