import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_flutter_app/core/constant/assets_icons.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_modal_bottom_sheet.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/profile/domain/exceptions/profile_exceptions.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_state.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CompleteProfileBloc bloc = context.read<CompleteProfileBloc>();

    return BlocBuilder<CompleteProfileBloc, CompleteProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const .symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 24,
                children: [
                  Text(
                    context.l10n.profile_complete_title,
                    style: context.textTheme.headlineMedium,
                  ),
                  AppTextFormField(
                    labelText: context.l10n.profile_firstname_title,
                    keyboardType: .name,
                    autofocus: true,
                    textInputAction: .next,
                    errorText: _translateFirstNameException(
                      context,
                      state.exception,
                    ),
                    onChange: (value) => bloc.add(FirstNameChanged(value)),
                  ),
                  AppTextFormField(
                    labelText: context.l10n.profile_lastname_title,
                    keyboardType: .name,
                    autofocus: true,
                    textInputAction: .next,
                    errorText: _translateLastNameException(
                      context,
                      state.exception,
                    ),
                    onChange: (value) => bloc.add(LastNameChanged(value)),
                  ),
                  SizedBox(
                    width: .infinity,
                    child: SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(
                          value: 'male',
                          label: Text('آقا'),
                          tooltip: '',
                          enabled: true,
                        ),
                        ButtonSegment(value: 'female', label: Text('خانم')),
                        ButtonSegment(value: 'other', label: Text('کودک')),
                      ],
                      selected: {'female'},
                      onSelectionChanged: (value) {},
                      emptySelectionAllowed: false,
                      multiSelectionEnabled: false,
                    ),
                  ),
                  AppTextFormField(
                    labelText: context.l10n.profile_optional_email_title,
                    keyboardType: .emailAddress,
                    autofocus: true,
                    textInputAction: .done,
                    errorText: _translateEmailException(
                      context,
                      state.exception,
                    ),
                    onChange: (value) => bloc.add(EmailChanged(value)),
                  ),
                  AppTextFormField(
                    initialValue: state.birthDate,
                    onTap: () {
                      AppModalBottomSheet.show(
                        context,
                        child: Padding(
                          padding: const .symmetric(horizontal: 16.0),
                          child: CalendarDatePicker(
                            initialDate: null,
                            firstDate: DateTime(1950),
                            lastDate: DateTime(3000),
                            initialCalendarMode: .year,
                            onDateChanged: (value) {
                              bloc.add(BirthDateChanged(value.toString()));
                            },
                          ),
                        ),
                      );
                    },
                    labelText: context.l10n.profile_birthdate_title,
                    canRequestFocus: false,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: IconWidget(
                        icon: AssetIcons.calendar,
                        height: 10,
                        width: 10,
                      ),
                    ),
                    errorText: _translateBirthDateException(
                      context,
                      state.exception,
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: AppFilledButton(
            title: context.l10n.profile_signup_button,
            onPressed: state.isValid
                ? () => bloc.add(const SubmitProfile())
                : null,
            isLoading: state.status == .loading,
            isWide: true,
          ),
          floatingActionButtonLocation: .centerFloat,
        );
      },
    );
  }

  String? _translateFirstNameException(
    BuildContext context,
    AppException? exception,
  ) {
    switch (exception) {
      case InvalidFirstNameException():
        return context.l10n.profile_firstname_exception;
      default:
        return null;
    }
  }

  String? _translateLastNameException(
    BuildContext context,
    AppException? exception,
  ) {
    switch (exception) {
      case InvalidLastNameException():
        return context.l10n.profile_lastname_exception;
      default:
        return null;
    }
  }

  String? _translateEmailException(
    BuildContext context,
    AppException? exception,
  ) {
    switch (exception) {
      case InvalidEmailException():
        return context.l10n.profile_email_exception;
      default:
        return null;
    }
  }

  String? _translateBirthDateException(
    BuildContext context,
    AppException? exception,
  ) {
    switch (exception) {
      case InvalidFirstNameException():
        return context.l10n.auth_phone_exception;
      default:
        return null;
    }
  }

  // Future<void> _selectDateShamsi() async {
  //   final Jalali? picked = await showPersianDatePicker(
  //     context: context,
  //     initialDate: Jalali(1385, 1),
  //     firstDate: Jalali(1300, 1),
  //     lastDate: Jalali.now(),
  //     holidayConfig: PersianHolidayConfig(weekendDays: {7}),
  //     initialEntryMode: PersianDatePickerEntryMode.calendarOnly,
  //     initialDatePickerMode: PersianDatePickerMode.year,
  //   );
  //   if (picked != null) {
  //     selectedBirthDate = picked;
  //     birthDateController.text =
  //         '${picked.year}/${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}';
  //   }
  // }
}
