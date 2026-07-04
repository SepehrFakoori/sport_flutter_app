import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/exception/app_exception.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/features/profile/domain/exceptions/profile_exceptions.dart';

class ProfileEditScreen extends StatefulWidget {
  final String title;
  final String name;

  const ProfileEditScreen({super.key, required this.name, required this.title});

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
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const .symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 24),
              AppTextFormField(
                controller: _controller,
                keyboardType: .text,
                labelText: widget.title,
                textInputAction: .done,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                autofocus: true,
                autovalidateMode: .onUserInteraction,
                errorText: _translateException(
                  context,
                  InvalidEmailException(),
                ),
                onChange: (value) {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AppFilledButton.secondary(
        title: context.l10n.profile_submit_button,
        onPressed: null,
        isLoading: false,
        isWide: true,
      ),
      floatingActionButtonLocation: .centerFloat,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? _translateException(BuildContext context, AppException? exception) {
    switch (exception) {
      case InvalidFirstNameLengthException():
        return context.l10n.auth_phone_exception;
      case InvalidLastNameLengthException():
        return context.l10n.auth_phone_exception;
      case InvalidEmailException():
        return context.l10n.auth_phone_exception;
      default:
        return null;
    }
  }
}
