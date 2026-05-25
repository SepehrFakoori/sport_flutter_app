import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constants/assets_icons.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/menu_tile.dart';
import 'package:sport_flutter_app/features/user/presentations/widgets/profile_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileTile(
                username: 'روشنا بابائی',
                phoneNumber: '۰۹۳۰۱۹۱۴۳۲۱',
                onTap: () {
                  context.push(AppRoutes.profile.path);
                },
              ),
              MenuTile(
                title: context.l10n.account_enrollments_button,
                icon: AssetIcons.receiptItem,
              ),
              MenuTile(
                title: context.l10n.account_settings_button,
                icon: AssetIcons.setting,
              ),
              MenuTile(
                title: context.l10n.account_support_button,
                icon: AssetIcons.headphone,
              ),
              MenuTile(
                title: context.l10n.account_invite_friends_button,
                icon: AssetIcons.profileAdd,
              ),
              MenuTile(
                title: context.l10n.account_policy_button,
                icon: AssetIcons.taskSquare,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
