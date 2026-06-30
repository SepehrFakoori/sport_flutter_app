import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/features/auth/presentation/widgets/code_input_field.dart';
import 'package:sport_flutter_app/features/auth/presentation/widgets/resend_time.dart';

class VerifyOtpScreen extends StatelessWidget {
  final String phone;

  const VerifyOtpScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .all(24),
          child: Column(
            crossAxisAlignment: .center,
            spacing: 20,
            children: [
              Column(
                crossAxisAlignment: .center,
                spacing: 4,
                children: [
                  Text(
                    context.l10n.auth_verify_code_title,
                    style: context.textTheme.titleMedium,
                    textAlign: .center,
                  ),
                  Text(
                    context.l10n.auth_verify_code_subtitle,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.onBackgroundSecondary,
                    ),
                    textAlign: .center,
                  ),
                  AppFilledButton.secondary(onPressed: () {}, title: phone),
                ],
              ),
              CodeInputField(),
              if (false)
                TextButton(
                  onPressed: () {},
                  child: Text(
                    context.l10n.auth_resend_code,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.colors.primary,
                    ),
                  ),
                )
              else
                ResendTime(duration: '01:15'),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: .infinity,
        margin: .symmetric(horizontal: 24.0, vertical: 12.0),
        child: AppFilledButton(
          onPressed: () {},
          title: context.l10n.auth_get_code,
        ),
      ),
      floatingActionButtonLocation: .centerFloat,
    );
  }
}
