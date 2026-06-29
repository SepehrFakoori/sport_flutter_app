import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  bool get isPhoneValid => RegExp(r'^09\d{9}$').hasMatch(phoneController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: const .symmetric(horizontal: 12),
        elevation: 1,
        actions: [
          InkWell(
            onTap: () {},
            borderRadius: .circular(8),
            child: Padding(
              padding: const .all(8.0),
              child: Text(
                'EN',
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const .all(12.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(
                context.l10n.auth_welcome,
                style: context.textTheme.displaySmall,
              ),
              Text(
                context.l10n.auth_description,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colors.onBackgroundSecondary,
                ),
              ),
              AppTextFormField(
                key: _formKey,
                controller: phoneController,
                keyboardType: .phone,
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                labelText: context.l10n.auth_phone_number,
                hintText: context.l10n.auth_phone_number_example,
                textInputAction: .done,
                autofocus: true,
                autovalidateMode: .onUserInteraction,
                validator: (value) {
                  if (value != null && !value.startsWith('09')) {
                    return context.l10n.auth_phone_validation_invalid_prefix;
                  }
                  return null;
                },
              ),
              RichText(
                textAlign: .justify,
                text: TextSpan(
                  style: context.textTheme.labelLarge?.copyWith(
                    color: context.colors.onBackgroundSecondary,
                  ),
                  children: [
                    TextSpan(text: context.l10n.auth_terms_prefix),
                    TextSpan(
                      text: context.l10n.auth_terms_title,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colors.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(
                            Uri.https('google.com'),
                            mode: .externalApplication,
                          );
                        },
                    ),
                    TextSpan(text: context.l10n.auth_terms_and),
                    TextSpan(
                      text: context.l10n.auth_privacy_title,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colors.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(
                            Uri.https('google.com'),
                            mode: .externalApplication,
                          );
                        },
                    ),
                    TextSpan(text: context.l10n.auth_terms_suffix),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: .infinity,
        margin: .all(12),
        child: AppFilledButton(
          onPressed: isPhoneValid ? () {} : null,
          title: context.l10n.auth_continue,
        ),
      ),
      floatingActionButtonLocation: .centerFloat,
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
