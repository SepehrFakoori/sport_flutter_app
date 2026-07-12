import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_refresh_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/logout_bloc/logout_event.dart';
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
        child: AppRefreshIndicator(
          onRefresh: () async => context.read<ProfileBloc>().add(GetProfile()),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              AppSliverAppBar(title: context.l10n.account_appBarTitle),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (BuildContext context, ProfileState state) {
                  if (state is SuccessState) {
                    return SliverList.list(
                      children: [
                        const SizedBox(height: 16),
                        ProfileCard(
                          imageUrl: state.profile.imageUrl,
                          description: state.profile.phone,
                          fullName: state.profile.fullName,
                          onTap: () => context.pushNamed(
                            AppRoutes.profile.name!,
                            extra: state.profile,
                          ),
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
                          onTap: () {
                            context.read<LogoutBloc>().add(Logout());
                          },
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
