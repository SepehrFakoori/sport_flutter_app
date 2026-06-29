import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool canRequestFocus;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? helper;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final FormFieldValidator<String>? onFieldSubmitted;
  final void Function(String value)? onChange;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;

  const AppTextFormField({
    super.key,
    this.controller,
    this.onTap,
    this.canRequestFocus = true,
    this.hintText,
    this.labelText,
    this.helperText,
    this.helper,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.textDirection,
    this.prefixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.onChange,
    this.textInputAction,
    this.inputFormatters,
    this.autofocus = false,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onTap,
      canRequestFocus: canRequestFocus,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textDirection: textDirection,
      textInputAction: textInputAction,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus,
      onChanged: onChange,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      errorBuilder: (context, errorText) {
        return Text(errorText);
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge?.copyWith(
          color: context.colors.onBackgroundSecondary,
        ),
        labelText: labelText,
        helperText: helperText,
        helper: helper,
        prefixIcon: prefixIcon,
        errorStyle: context.textTheme.labelLarge?.copyWith(
          color: context.colors.error,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: CustomOutlineInputBorder(color: context.colorScheme.tertiary),
        disabledBorder: CustomOutlineInputBorder(
          color: context.colorScheme.tertiary,
        ),
        errorBorder: CustomOutlineInputBorder(color: context.colors.error),
        focusedBorder: CustomOutlineInputBorder(color: context.colors.primary),
      ),
    );
  }
}

class CustomOutlineInputBorder extends OutlineInputBorder {
  final Color color;

  const CustomOutlineInputBorder({required this.color});

  @override
  BorderRadius get borderRadius => BorderRadius.circular(12);

  @override
  BorderSide get borderSide => BorderSide(color: color);
}
