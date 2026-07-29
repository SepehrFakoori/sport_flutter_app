import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:sport_flutter_app/core/constant/app_icons.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_modal_bottom_sheet.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_outlined_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';
import 'package:sport_flutter_app/features/profile/domain/exceptions/profile_exceptions.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/complete_profile/complete_profile_state.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  late TextEditingController _birthDateController;

  @override
  void initState() {
    super.initState();
    _birthDateController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final CompleteProfileBloc bloc = context.read<CompleteProfileBloc>();

    return BlocConsumer<CompleteProfileBloc, CompleteProfileState>(
      listener: (context, state) {
        if (state.status == .success) {
          context.goNamed(AppRoutes.home.name!);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const .symmetric(horizontal: 16.0, vertical: 24),
                  child: Column(
                    crossAxisAlignment: .start,
                    mainAxisSize: .max,
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
                      GenderSelection(
                        selected: {state.gender},
                        onSelectionChanged: (gender) =>
                            bloc.add(GenderChanged(gender.single)),
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
                        controller: _birthDateController,
                        onTap: () {
                          AppModalBottomSheet.show(
                            context,
                            child: Column(
                              mainAxisSize: .min,
                              children: [
                                PersianCalendarDatePicker(
                                  initialDate: null,
                                  firstDate: Jalali(1300),
                                  lastDate: Jalali.now(),
                                  initialCalendarMode: .year,
                                  onDateChanged: (Jalali picked) {
                                    _birthDateController.text = picked
                                        .formatShortDate();
                                    bloc.add(
                                      BirthDateChanged(picked.toDateTime()),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: const .symmetric(
                                    vertical: 8.0,
                                    horizontal: 16.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: .end,
                                    spacing: 8,
                                    children: [
                                      Expanded(
                                        child: AppOutlinedButton.secondary(
                                          onPressed: () => context.pop(),
                                          title:
                                              context.l10n.global_button_cancel,
                                        ),
                                      ),
                                      Expanded(
                                        child: AppFilledButton.secondary(
                                          onPressed: () => context.pop(),
                                          title:
                                              context.l10n.global_button_save,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        labelText: context.l10n.profile_birthdate_title,
                        canRequestFocus: false,
                        readOnly: true,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconWidget(
                            icon: AppIcons.calendar,
                            size: 10,
                          ),
                        ),
                        // errorText: _translateBirthDateException(
                        //   context,
                        //   state.exception,
                        // ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const .only(bottom: 16.0),
                  child: AppFilledButton(
                    title: context.l10n.profile_signup_button,
                    onPressed: state.isValid
                        ? () => bloc.add(const SubmitProfile())
                        : null,
                    isLoading: state.status == .loading,
                    isWide: true,
                  ),
                ),
              ],
            ),
          ),
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

  @override
  void dispose() {
    _birthDateController.dispose();
    super.dispose();
  }
}

class GenderSelection extends StatelessWidget {
  final Set<Gender> selected;
  final void Function(Set<Gender>)? onSelectionChanged;

  const GenderSelection({
    super.key,
    required this.selected,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(
          context.l10n.profile_gender_selection_title,
          style: context.textTheme.headlineSmall,
        ),
        SizedBox(
          width: .infinity,
          child: SegmentedButton<Gender>(
            segments: [
              ButtonSegment(
                value: .male,
                label: Text(
                  context.l10n.profile_gender_male,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: selected.single == .male
                        ? context.colors.onSecondary
                        : null,
                  ),
                ),
              ),
              ButtonSegment(
                value: .female,
                label: Text(
                  context.l10n.profile_gender_female,
                  style: context.textTheme.bodyLarge?.copyWith(
                    color: selected.single == .female
                        ? context.colors.onSecondary
                        : null,
                  ),
                ),
              ),
            ],
            selected: selected,
            onSelectionChanged: onSelectionChanged,
            emptySelectionAllowed: false,
            multiSelectionEnabled: false,
            showSelectedIcon: false,
          ),
        ),
      ],
    );
  }
}
