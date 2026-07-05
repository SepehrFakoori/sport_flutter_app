import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/core/router/app_routes.dart';
import 'package:sport_flutter_app/core/ui/widgets/buttons/app_filled_button.dart';
import 'package:sport_flutter_app/core/utils/time_formatter.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_bloc.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_event.dart';
import 'package:sport_flutter_app/features/auth/presentation/bloc/verify_otp_bloc/verify_otp_state.dart';
import 'package:sport_flutter_app/features/auth/presentation/widgets/code_input_field.dart';
import 'package:sport_flutter_app/features/auth/presentation/widgets/edit_phone_action_chip.dart';
import 'package:sport_flutter_app/features/auth/presentation/widgets/resend_time.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String phone;

  const VerifyOtpScreen({super.key, required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    context.read<VerifyOtpBloc>().add(StartTimer());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state.outcome != null) {
          switch (state.outcome!) {
            case .authenticated:
              context.goNamed(AppRoutes.home.name!);
              break;
            case .profileCompletionRequired:
              context.goNamed(AppRoutes.account.name!);
              break;
          }
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const .all(16),
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
                    EditPhoneActionChip(phone: widget.phone),
                  ],
                ),
                CodeInputField(
                  controller: _controller,
                  onCompleted: (value) => context.read<VerifyOtpBloc>().add(
                    CompleteCode(widget.phone, value),
                  ),
                ),
                BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
                  builder: (context, state) {
                    if (state.canResend) {
                      return TextButton(
                        onPressed: () => context.read<VerifyOtpBloc>().add(
                          ResendOtpPressed(widget.phone),
                        ),
                        child: Text(
                          context.l10n.auth_resend_code,
                          style: context.textTheme.titleMedium?.copyWith(
                            color: context.colors.primary,
                          ),
                        ),
                      );
                    } else {
                      return ResendTime(
                        duration: TimeFormatter.mmss(state.remainingSeconds),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: BlocBuilder<VerifyOtpBloc, VerifyOtpState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) => AppFilledButton(
            title: context.l10n.auth_send_code,
            onPressed: () => context.read<VerifyOtpBloc>().add(
              VerifyPressed(widget.phone, _controller.text),
            ),
            isLoading: state.isLoading,
            isWide: true,
          ),
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
}
