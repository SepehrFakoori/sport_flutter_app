import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
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
  final TextAlign textAlign;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final String? errorText;

  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
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
    this.textAlign = .start,
    this.style,
    this.contentPadding,
    this.border,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
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
      textAlign: textAlign,
      style: style,
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
        contentPadding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border:
            border ??
            CustomOutlineInputBorder(color: context.colorScheme.tertiary),
        disabledBorder: CustomOutlineInputBorder(
          color: context.colorScheme.tertiary,
        ),
        errorBorder: CustomOutlineInputBorder(
          color: context.colors.error.withValues(alpha: 0.6),
        ),
        focusedBorder: CustomOutlineInputBorder(color: context.colors.primary),
        focusedErrorBorder: CustomOutlineInputBorder(
          color: context.colors.error,
        ),
        errorText: errorText,
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
