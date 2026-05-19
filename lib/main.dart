import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/l10n/app_localizations.dart';
import 'package:sport_flutter_app/core/router/app_router.dart';
import 'package:sport_flutter_app/core/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('fa'),
      routerConfig: routerConfig,
    );
  }
}
