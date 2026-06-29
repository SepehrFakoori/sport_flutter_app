// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get bottom_navigation_home => 'خانه';

  @override
  String get bottom_navigation_bookmark => 'مورد علاقه‌ها';

  @override
  String get bottom_navigation_inbox => 'ورودی‌ها';

  @override
  String get bottom_navigation_profile => 'پروفایل';

  @override
  String get account_appBarTitle => 'پروفایل';

  @override
  String get account_button_edit => 'ویرایش پروفایل';

  @override
  String get account_enrollments_button => 'ثبت‌نام‌های من';

  @override
  String get account_settings_button => 'تنظیمات';

  @override
  String get account_support_button => 'پشتیبانی';

  @override
  String get account_invite_friends_button => 'معرفی به دوستان';

  @override
  String get account_policy_button => 'قوانین و شرایط استفاده';

  @override
  String get account_view_profile => 'مشاهده پروفایل';

  @override
  String get account_logout => 'خروج';

  @override
  String get profile_firstname_title => 'نام';

  @override
  String get profile_lastname_title => 'نام خانوادگی';

  @override
  String get profile_phone_number_title => 'شماره همراه';

  @override
  String get profile_email_title => 'ایمیل';

  @override
  String get home_categories_title => 'دسته‌بندی';

  @override
  String get home_popular_title => 'پرطرفدارترین‌ها';

  @override
  String get home_nearby_popular_title => 'پرطرفدارترین‌های اطراف';

  @override
  String get home_search_icon_tooltip => 'جستوجو';

  @override
  String get home_notifications_icon_tooltip => 'اعلان‌ها';

  @override
  String get inbox_message_tab_label => 'گفتگو‌ها';

  @override
  String get inbox_notifications_tab_label => 'اعلان‌ها';

  @override
  String get coach_appbar_title => 'پروفایل مربی';

  @override
  String coach_reviews_label(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count دیدگاه',
      zero: 'بدون دیدگاه',
    );
    return '$_temp0';
  }

  @override
  String get chat_text_field_hint => 'پیام خود را بنویسید...';

  @override
  String get gender_men_label => 'ویژه آقایان';

  @override
  String get gender_women_label => 'ویژه بانوان';

  @override
  String get settings_button_logout => 'خروج';

  @override
  String get global_button_cancel => 'انصراف';

  @override
  String get global_button_save => 'ذخیره';

  @override
  String get global_badge_new_label => 'جدید';

  @override
  String get global_coach_label => 'مربی';

  @override
  String get global_support_label => 'پشتیبانی';

  @override
  String get class_review_title => 'نظرات';

  @override
  String get class_features => 'ویژگی‌های کلاس';

  @override
  String get class_description => 'توضیحات';

  @override
  String get class_reviews => 'نظرات';

  @override
  String get class_show_more_reviews_title => 'نمایش همه';

  @override
  String get class_coach_reviews => 'نظرات کاربران';

  @override
  String get class_coach_rate => 'امتیاز';

  @override
  String get class_coach_title => 'آشنایی با مربی';

  @override
  String get class_price_title => 'قیمت';

  @override
  String get auth_welcome => 'خوش آمدید!';

  @override
  String get auth_description =>
      'لطفا شماره موبایلتان را وارد کنید تا بتوانیم با شما در ارتباط باشیم.';

  @override
  String get auth_phone_number => 'شماره موبایل';

  @override
  String get auth_example => 'مثلا';

  @override
  String get auth_terms_prefix => 'با ثبت نام در پلی آن، ';

  @override
  String get auth_terms_and => ' و ';

  @override
  String get auth_terms_suffix => ' را قبول می‌کنم.';

  @override
  String get auth_terms_title => 'قوانین و مقررات را';

  @override
  String get auth_privacy_title => 'بیانیه حریم خصوصی';

  @override
  String get auth_continue => 'ادامه';
}
