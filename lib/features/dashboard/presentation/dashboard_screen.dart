import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_icon_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            AppSliverAppBar(
              title: context.l10n.dashboard_appbar_title,
              actions: [
                AppIconButton(onPressed: () {}, icon: AssetIcons.calendar),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
