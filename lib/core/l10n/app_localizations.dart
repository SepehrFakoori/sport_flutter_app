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

  /// No description provided for @app_name.
  ///
  /// In fa, this message translates to:
  /// **'سوپس'**
  String get app_name;

  /// No description provided for @bottom_navigation_home.
  ///
  /// In fa, this message translates to:
  /// **'خانه'**
  String get bottom_navigation_home;

  /// No description provided for @bottom_navigation_dashboard.
  ///
  /// In fa, this message translates to:
  /// **'داشبورد'**
  String get bottom_navigation_dashboard;

  /// No description provided for @bottom_navigation_inbox.
  ///
  /// In fa, this message translates to:
  /// **'ورودی‌ها'**
  String get bottom_navigation_inbox;

  /// No description provided for @bottom_navigation_profile.
  ///
  /// In fa, this message translates to:
  /// **'پروفایل'**
  String get bottom_navigation_profile;

  /// No description provided for @account_appBarTitle.
  ///
  /// In fa, this message translates to:
  /// **'پروفایل'**
  String get account_appBarTitle;

  /// No description provided for @account_button_edit.
  ///
  /// In fa, this message translates to:
  /// **'ویرایش پروفایل'**
  String get account_button_edit;

  /// No description provided for @account_enrollments_button.
  ///
  /// In fa, this message translates to:
  /// **'ثبت‌نام‌های من'**
  String get account_enrollments_button;

  /// No description provided for @account_settings_button.
  ///
  /// In fa, this message translates to:
  /// **'تنظیمات'**
  String get account_settings_button;

  /// No description provided for @account_addresses.
  ///
  /// In fa, this message translates to:
  /// **'آدرس‌ها'**
  String get account_addresses;

  /// No description provided for @account_comments.
  ///
  /// In fa, this message translates to:
  /// **'دیدگاه‌ها'**
  String get account_comments;

  /// No description provided for @account_become_coach.
  ///
  /// In fa, this message translates to:
  /// **'ثبت نام به عنوان مربی'**
  String get account_become_coach;

  /// No description provided for @account_giftcard_button.
  ///
  /// In fa, this message translates to:
  /// **'تخفیف'**
  String get account_giftcard_button;

  /// No description provided for @account_support_button.
  ///
  /// In fa, this message translates to:
  /// **'پشتیبانی'**
  String get account_support_button;

  /// No description provided for @account_invite_friends_button.
  ///
  /// In fa, this message translates to:
  /// **'معرفی به دوستان'**
  String get account_invite_friends_button;

  /// No description provided for @account_policy_button.
  ///
  /// In fa, this message translates to:
  /// **'قوانین و شرایط استفاده'**
  String get account_policy_button;

  /// No description provided for @account_view_profile.
  ///
  /// In fa, this message translates to:
  /// **'مشاهده پروفایل'**
  String get account_view_profile;

  /// No description provided for @account_logout.
  ///
  /// In fa, this message translates to:
  /// **'خروج'**
  String get account_logout;

  /// No description provided for @profile_appbar_title.
  ///
  /// In fa, this message translates to:
  /// **'اطلاعات حساب کاربری'**
  String get profile_appbar_title;

  /// No description provided for @profile_firstname_title.
  ///
  /// In fa, this message translates to:
  /// **'نام'**
  String get profile_firstname_title;

  /// No description provided for @profile_lastname_title.
  ///
  /// In fa, this message translates to:
  /// **'نام خانوادگی'**
  String get profile_lastname_title;

  /// No description provided for @profile_phone_number_title.
  ///
  /// In fa, this message translates to:
  /// **'شماره همراه'**
  String get profile_phone_number_title;

  /// No description provided for @profile_email_title.
  ///
  /// In fa, this message translates to:
  /// **'ایمیل'**
  String get profile_email_title;

  /// No description provided for @profile_optional_email_title.
  ///
  /// In fa, this message translates to:
  /// **'ایمیل (اختیاری)'**
  String get profile_optional_email_title;

  /// No description provided for @profile_birthdate_title.
  ///
  /// In fa, this message translates to:
  /// **'تاریخ تولد'**
  String get profile_birthdate_title;

  /// No description provided for @profile_submit_button.
  ///
  /// In fa, this message translates to:
  /// **'ثبت'**
  String get profile_submit_button;

  /// No description provided for @profile_signup_button.
  ///
  /// In fa, this message translates to:
  /// **'ثبت نام'**
  String get profile_signup_button;

  /// No description provided for @profile_complete_title.
  ///
  /// In fa, this message translates to:
  /// **'حساب کاربری‌تان را ایجاد کنید.'**
  String get profile_complete_title;

  /// No description provided for @profile_firstname_exception.
  ///
  /// In fa, this message translates to:
  /// **'فیلد نام باید حداقل 3 کارکتر باشد.'**
  String get profile_firstname_exception;

  /// No description provided for @profile_lastname_exception.
  ///
  /// In fa, this message translates to:
  /// **'فیلد نام خانوادگی باید حداقل 3 کارکتر باشد.'**
  String get profile_lastname_exception;

  /// No description provided for @profile_email_exception.
  ///
  /// In fa, this message translates to:
  /// **'لطفا یک ایمیل معتبر وارد کنید.'**
  String get profile_email_exception;

  /// No description provided for @profile_gender_selection_title.
  ///
  /// In fa, this message translates to:
  /// **'جنسیت'**
  String get profile_gender_selection_title;

  /// No description provided for @profile_gender_male.
  ///
  /// In fa, this message translates to:
  /// **'آقا'**
  String get profile_gender_male;

  /// No description provided for @profile_gender_female.
  ///
  /// In fa, this message translates to:
  /// **'خانم'**
  String get profile_gender_female;

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

  /// No description provided for @home_search_icon_tooltip.
  ///
  /// In fa, this message translates to:
  /// **'جستوجو'**
  String get home_search_icon_tooltip;

  /// No description provided for @home_notifications_icon_tooltip.
  ///
  /// In fa, this message translates to:
  /// **'اعلان‌ها'**
  String get home_notifications_icon_tooltip;

  /// No description provided for @home_nearby_coaches_title.
  ///
  /// In fa, this message translates to:
  /// **'مربی‌های اطراف'**
  String get home_nearby_coaches_title;

  /// No description provided for @home_nearby_classes_title.
  ///
  /// In fa, this message translates to:
  /// **'کلاس‌های اطراف'**
  String get home_nearby_classes_title;

  /// No description provided for @dashboard_appbar_title.
  ///
  /// In fa, this message translates to:
  /// **'داشبورد'**
  String get dashboard_appbar_title;

  /// No description provided for @inbox_message_tab_label.
  ///
  /// In fa, this message translates to:
  /// **'گفتگو‌ها'**
  String get inbox_message_tab_label;

  /// No description provided for @inbox_notifications_tab_label.
  ///
  /// In fa, this message translates to:
  /// **'اعلان‌ها'**
  String get inbox_notifications_tab_label;

  /// No description provided for @coach_appbar_title.
  ///
  /// In fa, this message translates to:
  /// **'پروفایل مربی'**
  String get coach_appbar_title;

  /// No description provided for @coach_reviews_label.
  ///
  /// In fa, this message translates to:
  /// **'{count, plural, =0{بدون دیدگاه} other{{count} دیدگاه}}'**
  String coach_reviews_label(num count);

  /// No description provided for @coach_class.
  ///
  /// In fa, this message translates to:
  /// **'کلاس‌ها'**
  String get coach_class;

  /// No description provided for @chat_text_field_hint.
  ///
  /// In fa, this message translates to:
  /// **'پیام خود را بنویسید...'**
  String get chat_text_field_hint;

  /// No description provided for @gender_men_label.
  ///
  /// In fa, this message translates to:
  /// **'ویژه آقایان'**
  String get gender_men_label;

  /// No description provided for @gender_women_label.
  ///
  /// In fa, this message translates to:
  /// **'ویژه بانوان'**
  String get gender_women_label;

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

  /// No description provided for @global_coach_label.
  ///
  /// In fa, this message translates to:
  /// **'مربی'**
  String get global_coach_label;

  /// No description provided for @global_support_label.
  ///
  /// In fa, this message translates to:
  /// **'پشتیبانی'**
  String get global_support_label;

  /// No description provided for @class_review_title.
  ///
  /// In fa, this message translates to:
  /// **'نظرات'**
  String get class_review_title;

  /// No description provided for @class_features.
  ///
  /// In fa, this message translates to:
  /// **'ویژگی‌های کلاس'**
  String get class_features;

  /// No description provided for @class_description.
  ///
  /// In fa, this message translates to:
  /// **'توضیحات'**
  String get class_description;

  /// No description provided for @class_reviews.
  ///
  /// In fa, this message translates to:
  /// **'نظرات'**
  String get class_reviews;

  /// No description provided for @class_show_more_reviews_title.
  ///
  /// In fa, this message translates to:
  /// **'نمایش همه'**
  String get class_show_more_reviews_title;

  /// No description provided for @class_coach_reviews.
  ///
  /// In fa, this message translates to:
  /// **'نظرات کاربران'**
  String get class_coach_reviews;

  /// No description provided for @class_coach_rate.
  ///
  /// In fa, this message translates to:
  /// **'امتیاز'**
  String get class_coach_rate;

  /// No description provided for @class_coach_title.
  ///
  /// In fa, this message translates to:
  /// **'آشنایی با مربی'**
  String get class_coach_title;

  /// No description provided for @class_coach_experience.
  ///
  /// In fa, this message translates to:
  /// **'سابقه'**
  String get class_coach_experience;

  /// No description provided for @class_price_title.
  ///
  /// In fa, this message translates to:
  /// **'قیمت'**
  String get class_price_title;

  /// No description provided for @auth_title.
  ///
  /// In fa, this message translates to:
  /// **'لطفا شماره موبایل خود را وارد کنید و دکمه دریافت کد را بزنید'**
  String get auth_title;

  /// No description provided for @auth_phone_number.
  ///
  /// In fa, this message translates to:
  /// **'شماره موبایل'**
  String get auth_phone_number;

  /// No description provided for @auth_phone_validation_invalid_prefix.
  ///
  /// In fa, this message translates to:
  /// **'شماره موبایل باید با 09 شروع شود.'**
  String get auth_phone_validation_invalid_prefix;

  /// No description provided for @auth_phone_number_example.
  ///
  /// In fa, this message translates to:
  /// **'مثلا: 09123456789'**
  String get auth_phone_number_example;

  /// No description provided for @auth_read_terms.
  ///
  /// In fa, this message translates to:
  /// **'مطالعه '**
  String get auth_read_terms;

  /// No description provided for @auth_terms.
  ///
  /// In fa, this message translates to:
  /// **'قوانین و مقررات '**
  String get auth_terms;

  /// No description provided for @auth_privacy_title.
  ///
  /// In fa, this message translates to:
  /// **'بیانیه حریم خصوصی'**
  String get auth_privacy_title;

  /// No description provided for @auth_get_code.
  ///
  /// In fa, this message translates to:
  /// **'دریافت کد'**
  String get auth_get_code;

  /// No description provided for @auth_verify_code_title.
  ///
  /// In fa, this message translates to:
  /// **'کد ارسال شده را وارد کنید'**
  String get auth_verify_code_title;

  /// No description provided for @auth_verify_code_subtitle.
  ///
  /// In fa, this message translates to:
  /// **'کد 6 رقمی به شماره شما پیامک شد'**
  String get auth_verify_code_subtitle;

  /// No description provided for @auth_resend_code_in.
  ///
  /// In fa, this message translates to:
  /// **'دریافت مجدد کد:'**
  String get auth_resend_code_in;

  /// No description provided for @auth_resend_code.
  ///
  /// In fa, this message translates to:
  /// **'دریافت مجدد پیامک'**
  String get auth_resend_code;

  /// No description provided for @auth_send_code.
  ///
  /// In fa, this message translates to:
  /// **'ارسال'**
  String get auth_send_code;

  /// No description provided for @auth_phone_exception.
  ///
  /// In fa, this message translates to:
  /// **'لطفا شماره همراه 11 رقمی و معتبر وارد کنید.'**
  String get auth_phone_exception;

  /// No description provided for @choose_profile_photo_sheet_title.
  ///
  /// In fa, this message translates to:
  /// **'انتخاب تصویر حساب کاربری'**
  String get choose_profile_photo_sheet_title;

  /// No description provided for @choose_from_gallery_title.
  ///
  /// In fa, this message translates to:
  /// **'انتخاب از گالری'**
  String get choose_from_gallery_title;

  /// No description provided for @take_photo_title.
  ///
  /// In fa, this message translates to:
  /// **'بازکردن دوربین'**
  String get take_photo_title;
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
