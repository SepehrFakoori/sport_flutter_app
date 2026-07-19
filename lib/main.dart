import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:sport_flutter_app/core/bloc/app_bloc_observer.dart';
import 'package:sport_flutter_app/core/deep_link/deep_link_service.dart';
import 'package:sport_flutter_app/core/di/injection.dart';
import 'package:sport_flutter_app/core/l10n/app_localizations.dart';
import 'package:sport_flutter_app/core/router/app_router.dart';
import 'package:sport_flutter_app/core/ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  await sl<DeepLinkService>().init();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sport Flutter App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: .light,
      localizationsDelegates: const [
        // Delegates for calendar date picker (Persian Date Picker)
        PersianMaterialLocalizations.delegate,
        PersianCupertinoLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      // AppLocalizations.supportedLocales does not have countryCode in it.
      supportedLocales: [Locale('fa', 'IR')],
      locale: Locale('fa', 'IR'),
      routerConfig: routerConfig,
    );
  }
}
