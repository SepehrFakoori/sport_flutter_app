import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_bloc/profile_state.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/menu_tile.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/skeleton/menu_tile_skeleton.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/profile_card.dart';
import 'package:sport_flutter_app/features/profile/presentation/widgets/skeleton/profile_card_skeleton.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => context.read<ProfileBloc>().add(GetProfile()),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              AppSliverAppBar(
                title: context.l10n.account_appBarTitle,
                actions: [
                  AppIconButton(onPressed: () {}, icon: AssetIcons.bookmark),
                ],
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (BuildContext context, ProfileState state) {
                  if (state is SuccessState) {
                    return SliverList.list(
                      children: [
                        const SizedBox(height: 16),
                        ProfileCard(
                          imageUrl:
                              'https://2017.lutheranworld.org/sites/default/files/styles/large_updates_image/public/updates/1B_humans_not_for_sale.jpg?itok=IkUtnG_I&c=65435ce6d02504401a0b2ddbe3611983',
                          description:
                              state.profile.phoneNumber, //'قزوین، مهرگان'
                          username: state.profile.fullName,
                        ),
                        const SizedBox(height: 16),
                        MenuTile(
                          title: context.l10n.account_enrollments_button,
                          icon: AssetIcons.receiptItem,
                        ),
                        MenuTile(
                          title: context.l10n.account_view_profile,
                          icon: AssetIcons.profile,
                        ),
                        MenuTile(
                          title: context.l10n.account_settings_button,
                          icon: AssetIcons.setting,
                        ),
                        MenuTile(
                          title: context.l10n.account_giftcard_button,
                          icon: AssetIcons.money,
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
                        MenuTile(
                          title: context.l10n.account_logout,
                          icon: AssetIcons.logout,
                        ),
                      ],
                    );
                  } else {
                    return SliverList.list(
                      children: [
                        const SizedBox(height: 16),
                        const ProfileCardSkeleton(),
                        const SizedBox(height: 16),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                        const MenuTileSkeleton(),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
