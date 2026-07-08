import 'package:flutter/material.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Jalali? selectedBirthDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(horizontal: 16.0, vertical: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: .start,
              spacing: 24,
              children: [
                Text(
                  'حساب کاربری‌تان را ایجاد کنید.',
                  style: context.textTheme.headlineMedium,
                ),
                AppTextFormField(
                  onTap: () {},
                  controller: firstNameController,
                  labelText: 'نام',
                  keyboardType: .text,
                  autofocus: true,
                  textInputAction: .next,
                ),
                AppTextFormField(
                  onTap: () {},
                  controller: lastNameController,
                  labelText: 'نام خانوادگی',
                  keyboardType: .text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفا نام خانوادگی را به فارسی وارد کنید';
                    }
                    return null;
                  },
                  autofocus: true,
                  textInputAction: .next,
                ),
                AppTextFormField(
                  onTap: () {},
                  controller: emailController,
                  labelText: 'ایمیل (اختیاری)',
                  keyboardType: .text,
                  autofocus: true,
                  textInputAction: .next,
                ),
                AppTextFormField(
                  onTap: _selectDateShamsi,
                  controller: birthDateController,
                  labelText: 'تاریخ تولد',
                  hintText: 'تاریخ تولد را انتخاب کنید',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: IconWidget(
                      icon: AssetIcons.calendar,
                      height: 10,
                      width: 10,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'لطفاً تاریخ تولد را وارد کنید.';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AppFilledButton(
        title: context.l10n.profile_signup_button,
        onPressed: () {},
        isLoading: false,
        isWide: true,
      ),
      floatingActionButtonLocation: .centerFloat,
    );
  }

  Future<void> _selectDateShamsi() async {
    final Jalali? picked = await showPersianDatePicker(
      context: context,
      initialDate: Jalali(1385, 1),
      firstDate: Jalali(1300, 1),
      lastDate: Jalali.now(),
      holidayConfig: PersianHolidayConfig(weekendDays: {7}),
      initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
      initialDatePickerMode: PersianDatePickerMode.year,
    );
    if (picked != null) {
      selectedBirthDate = picked;
      birthDateController.text =
          '${picked.year}/${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}';
    }
  }

  @override
  void dispose() {
    birthDateController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
