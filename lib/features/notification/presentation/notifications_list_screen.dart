import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_circle_avatar.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_refresh_indicator.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_sliver_app_bar.dart';

class NotificationsListScreen extends StatelessWidget {
  const NotificationsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppRefreshIndicator(
          onRefresh: () async {},
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              AppSliverAppBar(title: 'اعلانات', centerTitle: true),
              SliverList.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: AppCircleAvatar(fullName: 'fullName'),
                  title: Text('مربی علی نعمتی شما را دک کرد.'),
                  subtitle: Text(
                    'به دلیل اینکه خیلی کسخل هستید و نمیتونید از پس زندگی بربیایید.',
                  ),
                  onTap: () {},
                ),
                itemCount: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
