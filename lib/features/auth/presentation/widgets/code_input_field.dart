import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:sport_flutter_app/core/constant/constants.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class CodeInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onCompleted;

  const CodeInputField({
    super.key,
    this.controller,
    this.focusNode,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final PinTheme defaultPinTheme = _defaultPinTheme(context);

    return Directionality(
      textDirection: .ltr,
      child: Pinput(
        controller: controller,
        focusNode: focusNode,
        length: AppConstants.otpLength,
        crossAxisAlignment: .center,
        textInputAction: .done,
        keyboardType: .number,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: defaultPinTheme,
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: .all(color: context.colors.error),
        ),
        onCompleted: onCompleted,
        inputFormatters: [
          LengthLimitingTextInputFormatter(AppConstants.otpLength),
          FilteringTextInputFormatter.digitsOnly,
        ],
        closeKeyboardWhenCompleted: true,
        mainAxisAlignment: .center,
      ),
    );
  }

  PinTheme _defaultPinTheme(BuildContext context) => PinTheme(
    width: 48,
    height: 56,
    textStyle: context.textTheme.headlineLarge,
    decoration: BoxDecoration(
      color: context.colors.tertiary,
      borderRadius: .circular(AppRadius.md),
      border: .all(color: Colors.transparent),
    ),
  );
}
