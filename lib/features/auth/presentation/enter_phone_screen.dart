import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  bool get isPhoneValid => RegExp(r'^09\d{9}$').hasMatch(phoneController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .all(24),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(
                context.l10n.auth_title,
                style: context.textTheme.titleMedium,
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
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: .min,
        spacing: 4,
        children: [
          RichText(
            textAlign: .justify,
            text: TextSpan(
              style: context.textTheme.labelLarge?.copyWith(
                color: context.colors.onBackgroundSecondary,
              ),
              children: [
                TextSpan(text: context.l10n.auth_read_terms),
                TextSpan(
                  text: context.l10n.auth_terms,
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
                TextSpan(text: 'پلی آن'),
              ],
            ),
          ),
          Container(
            width: .infinity,
            margin: .symmetric(horizontal: 24.0, vertical: 12.0),
            child: AppFilledButton(
              onPressed: () {
                context.pushNamed(
                  AppRoutes.verifyOtp.name!,
                  extra: phoneController.text,
                );
              },
              // onPressed: isPhoneValid ? () {} : null,
              title: context.l10n.auth_get_code,
            ),
          ),
        ],
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
