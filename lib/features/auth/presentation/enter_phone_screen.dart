import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/app_text_form_field.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/enter_phone_bloc/enter_phone_state.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterPhoneScreen extends StatefulWidget {
  const EnterPhoneScreen({super.key});

  @override
  State<EnterPhoneScreen> createState() => _EnterPhoneScreenState();
}

class _EnterPhoneScreenState extends State<EnterPhoneScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<EnterPhoneBloc, EnterPhoneState>(
      listener: (context, state) {
        if (state.status == .success) {
          context.pushNamed(AppRoutes.verifyOtp.name!, extra: state.phone);
        } else if (state.status == .failure) {
          print(state.errorMessage);
        }
      },
      child: Scaffold(
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
                BlocBuilder<EnterPhoneBloc, EnterPhoneState>(
                  buildWhen: (previous, current) =>
                      previous.errorMessage != current.errorMessage ||
                      previous.isValid != current.isValid,
                  builder: (context, state) {
                    return AppTextFormField(
                      controller: phoneController,
                      keyboardType: .phone,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(11),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      labelText: context.l10n.auth_phone_number,
                      hintText: context.l10n.auth_phone_number_example,
                      textInputAction: .done,
                      autofocus: true,
                      autovalidateMode: .onUserInteraction,
                      errorText: state.errorMessage,
                      onChange: (value) => context.read<EnterPhoneBloc>().add(
                        PhoneChanged(value),
                      ),
                    );
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
              child: BlocBuilder<EnterPhoneBloc, EnterPhoneState>(
                buildWhen: (previous, current) =>
                    previous.isValid != current.isValid ||
                    previous.status != current.status,
                builder: (context, state) {
                  final isLoading = state.status == .loading;
                  return AppFilledButton(
                    onPressed: state.isValid && !isLoading
                        ? () => context.read<EnterPhoneBloc>().add(
                            const GetCodePressed(),
                          )
                        : null,
                    title: context.l10n.auth_get_code,
                    isLoading: isLoading,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: .centerFloat,
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
