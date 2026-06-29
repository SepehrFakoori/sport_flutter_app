import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final phoneController = TextEditingController();

  bool get isPhoneValid => RegExp(r'^09\d{9}$').hasMatch(phoneController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
        elevation: 1,
        actions: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'En',
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
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 20,
            children: [
              Text(
                context.l10n.auth_welcome,
                style: context.textTheme.headlineLarge,
              ),
              Text(
                context.l10n.auth_description,
                style: context.textTheme.titleLarge?.copyWith(
                  color: context.colors.onBackgroundSecondary,
                ),
              ),
              TextFormField(
                onTap: () {},
                controller: phoneController,
                autofocus: true,
                keyboardType: TextInputType.phone,
                onChanged: (_) => setState(() {}),
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                decoration: InputDecoration(
                  label: Text(
                    context.l10n.auth_phone_number,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                  ),
                  hintText: '${context.l10n.auth_example}: 09123456789',
                  hintStyle: TextStyle(
                    color: context.colors.onBackgroundSecondary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              RichText(
                textAlign: .justify,
                text: TextSpan(
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colors.onBackgroundSecondary,
                  ),
                  children: [
                    TextSpan(text: context.l10n.auth_terms_prefix),
                    TextSpan(
                      text: context.l10n.auth_terms_title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.primary,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: context.l10n.auth_terms_and),
                    TextSpan(
                      text: context.l10n.auth_privacy_title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.colors.primary,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(text: context.l10n.auth_terms_suffix),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: AppFilledButton(
                  onPressed: isPhoneValid ? () {} : null,
                  title: context.l10n.auth_continue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
