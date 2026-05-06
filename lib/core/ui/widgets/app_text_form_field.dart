// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sport_flutter_app/core/constants/asset_icons.dart';
// import 'package:sport_flutter_app/core/extensions/build_context_extensions.dart';
// import 'package:sport_flutter_app/core/ui/widgets/icon_widget.dart';
//
// class AppTextFormField extends StatelessWidget {
//   final TextEditingController? controller;
//   final VoidCallback? onTap;
//   final bool canRequestFocus;
//   final String? hintText;
//   final String? labelText;
//   final String? helperText;
//   final Widget? helper;
//   final int? maxLines;
//   final int? minLines;
//   final TextInputType? keyboardType;
//   final TextDirection? textDirection;
//   final Widget? prefixIcon;
//   final FormFieldValidator<String>? validator;
//   final FormFieldValidator<String>? onFieldSubmitted;
//   final void Function(String value)? onChange;
//   final TextInputAction? textInputAction;
//   final List<TextInputFormatter>? inputFormatters;
//
//   const AppTextFormField({
//     super.key,
//     this.controller,
//     this.onTap,
//     this.canRequestFocus = true,
//     this.hintText,
//     this.labelText,
//     this.helperText,
//     this.helper,
//     this.maxLines = 1,
//     this.minLines,
//     this.keyboardType,
//     this.textDirection,
//     this.prefixIcon,
//     this.validator,
//     this.onFieldSubmitted,
//     this.onChange,
//     this.textInputAction,
//     this.inputFormatters,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       onTap: onTap,
//       canRequestFocus: canRequestFocus,
//       minLines: minLines,
//       maxLines: maxLines,
//       keyboardType: keyboardType,
//       textDirection: textDirection,
//       textInputAction: textInputAction,
//       validator: validator,
//       onFieldSubmitted: onFieldSubmitted,
//       onChanged: onChange,
//       inputFormatters: inputFormatters,
//       errorBuilder: (context, errorText) {
//         return Row(
//           spacing: 4,
//           children: [
//             IconWidget(
//               icon: AssetIcons.warning,
//               color: context.colors.error,
//               height: 16,
//               width: 16,
//             ),
//             Text(errorText),
//           ],
//         );
//       },
//       decoration: InputDecoration(
//         hintText: hintText,
//         labelText: labelText,
//         helperText: helperText,
//         helper: helper,
//         prefixIcon: prefixIcon,
//         errorStyle: context.textTheme.labelLarge?.copyWith(
//           color: context.colors.error,
//         ),
//         contentPadding: EdgeInsets.all(4),
//         border: CustomOutlineInputBorder(color: context.colorScheme.tertiary),
//         disabledBorder: CustomOutlineInputBorder(
//           color: context.colorScheme.tertiary,
//         ),
//         errorBorder: CustomOutlineInputBorder(color: context.colors.error),
//         focusedBorder: CustomOutlineInputBorder(
//           color: context.colors.primary,
//         ),
//       ),
//     );
//   }
// }
//
// class CustomOutlineInputBorder extends OutlineInputBorder {
//   final Color color;
//
//   const CustomOutlineInputBorder({required this.color});
//
//   @override
//   BorderRadius get borderRadius => BorderRadius.circular(8);
//
//   @override
//   BorderSide get borderSide => BorderSide(color: color);
// }
