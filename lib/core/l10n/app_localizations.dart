import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_fa.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('fa')];

  /// No description provided for @bottom_navigation_home.
  ///
  /// In fa, this message translates to:
  /// **'خانه'**
  String get bottom_navigation_home;

  /// No description provided for @bottom_navigation_bookmark.
  ///
  /// In fa, this message translates to:
  /// **'مورد علاقه‌ها'**
  String get bottom_navigation_bookmark;

  /// No description provided for @bottom_navigation_profile.
  ///
  /// In fa, this message translates to:
  /// **'پروفایل'**
  String get bottom_navigation_profile;

  /// No description provided for @profile_appBarTitle.
  ///
  /// In fa, this message translates to:
  /// **'پروفایل'**
  String get profile_appBarTitle;

  /// No description provided for @profile_button_edit.
  ///
  /// In fa, this message translates to:
  /// **'ویرایش پروفایل'**
  String get profile_button_edit;

  /// No description provided for @home_categories_title.
  ///
  /// In fa, this message translates to:
  /// **'دسته‌بندی'**
  String get home_categories_title;

  /// No description provided for @home_popular_title.
  ///
  /// In fa, this message translates to:
  /// **'پرطرفدارترین‌ها'**
  String get home_popular_title;

  /// No description provided for @home_nearby_popular_title.
  ///
  /// In fa, this message translates to:
  /// **'پرطرفدارترین‌های اطراف'**
  String get home_nearby_popular_title;

  /// No description provided for @settings_button_logout.
  ///
  /// In fa, this message translates to:
  /// **'خروج'**
  String get settings_button_logout;

  /// No description provided for @global_button_cancel.
  ///
  /// In fa, this message translates to:
  /// **'انصراف'**
  String get global_button_cancel;

  /// No description provided for @global_button_save.
  ///
  /// In fa, this message translates to:
  /// **'ذخیره'**
  String get global_button_save;

  /// No description provided for @global_badge_new_label.
  ///
  /// In fa, this message translates to:
  /// **'جدید'**
  String get global_badge_new_label;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['fa'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'fa':
      return AppLocalizationsFa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
