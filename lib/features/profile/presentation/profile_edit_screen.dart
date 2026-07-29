import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/ui/widgets/custom_app_bar.dart';
import 'package:sport_flutter_app/features/profile/domain/exceptions/profile_exceptions.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_bloc.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_event.dart';
import 'package:sport_flutter_app/features/profile/presentation/bloc/profile_edit_bloc/profile_edit_state.dart';
import 'package:sport_flutter_app/features/profile/profile_field_extensions.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';

class ProfileEditScreen extends StatefulWidget {
  final ProfileField field;
  final String name;

  const ProfileEditScreen({super.key, required this.field, required this.name});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileEditBloc, ProfileEditState>(
      listener: (context, state) {
        if (state.status == .success) {
          context.pop();
        }
      },
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const .symmetric(horizontal: AppSpacing.lg),
            child: Column(
              children: [
                const SizedBox(height: 24),
                AppTextFormField(
                  controller: _controller,
                  keyboardType: widget.field.keyboardType,
                  labelText: widget.field.label(context),
                  textInputAction: .done,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  autofocus: true,
                  autovalidateMode: .onUserInteraction,
                  // errorText: _translateException(
                  //   context,
                  //   InvalidEmailException(),
                  // ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: AppFilledButton.secondary(
          title: context.l10n.profile_submit_button,
          onPressed: () {
            final profile = widget.field.toPatch(_controller.text);
            context.read<ProfileEditBloc>().add(ProfileChanged(profile));
          },
          isLoading: state.status == .loading,
          isWide: true,
        ),
        floatingActionButtonLocation: .centerFloat,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _translateException(BuildContext context, AppException? exception) {
    switch (exception) {
      case InvalidFirstNameException():
        return context.l10n.auth_phone_exception;
      case InvalidLastNameException():
        return context.l10n.auth_phone_exception;
      case InvalidEmailException():
        return context.l10n.auth_phone_exception;
      default:
        return null;
    }
  }
}
