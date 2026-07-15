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
  String get bottom_navigation_dashboard => 'داشبورد';

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
  String get account_addresses => 'آدرس‌ها';

  @override
  String get account_comments => 'دیدگاه‌ها';

  @override
  String get account_become_coach => 'ثبت نام به عنوان مربی';

  @override
  String get account_giftcard_button => 'تخفیف';

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
  String get profile_appbar_title => 'اطلاعات حساب کاربری';

  @override
  String get profile_firstname_title => 'نام';

  @override
  String get profile_lastname_title => 'نام خانوادگی';

  @override
  String get profile_phone_number_title => 'شماره همراه';

  @override
  String get profile_email_title => 'ایمیل';

  @override
  String get profile_optional_email_title => 'ایمیل (اختیاری)';

  @override
  String get profile_birthdate_title => 'تاریخ تولد';

  @override
  String get profile_submit_button => 'ثبت';

  @override
  String get profile_signup_button => 'ثبت نام';

  @override
  String get profile_complete_title => 'حساب کاربری‌تان را ایجاد کنید.';

  @override
  String get profile_firstname_exception =>
      'فیلد نام باید حداقل 3 کارکتر باشد.';

  @override
  String get profile_lastname_exception =>
      'فیلد نام خانوادگی باید حداقل 3 کارکتر باشد.';

  @override
  String get profile_email_exception => 'لطفا یک ایمیل معتبر وارد کنید.';

  @override
  String get profile_gender_selection_title => 'جنسیت';

  @override
  String get profile_gender_male => 'آقا';

  @override
  String get profile_gender_female => 'خانم';

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
  String get coach_class => 'کلاس‌ها';

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
  String get class_coach_experience => 'سابقه';

  @override
  String get class_price_title => 'قیمت';

  @override
  String get auth_title =>
      'لطفا شماره موبایل خود را وارد کنید و دکمه دریافت کد را بزنید';

  @override
  String get auth_phone_number => 'شماره موبایل';

  @override
  String get auth_phone_validation_invalid_prefix =>
      'شماره موبایل باید با 09 شروع شود.';

  @override
  String get auth_phone_number_example => 'مثلا: 09123456789';

  @override
  String get auth_read_terms => 'مطالعه ';

  @override
  String get auth_terms => 'قوانین و مقررات ';

  @override
  String get auth_privacy_title => 'بیانیه حریم خصوصی';

  @override
  String get auth_get_code => 'دریافت کد';

  @override
  String get auth_verify_code_title => 'کد ارسال شده را وارد کنید';

  @override
  String get auth_verify_code_subtitle => 'کد 6 رقمی به شماره شما پیامک شد';

  @override
  String get auth_resend_code_in => 'دریافت مجدد کد:';

  @override
  String get auth_resend_code => 'دریافت مجدد پیامک';

  @override
  String get auth_send_code => 'ارسال';

  @override
  String get auth_phone_exception =>
      'لطفا شماره همراه 11 رقمی و معتبر وارد کنید.';

  @override
  String get choose_profile_photo_sheet_title => 'انتخاب تصویر حساب کاربری';

  @override
  String get choose_from_gallery_title => 'انتخاب از گالری';

  @override
  String get take_photo_title => 'بازکردن دوربین';
}
