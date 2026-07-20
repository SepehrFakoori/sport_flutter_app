import 'package:flutter/material.dart';
import 'package:sport_flutter_app/core/extension/build_context_extensions.dart';
import 'package:sport_flutter_app/features/profile/domain/entity/patch_profile.dart';

enum ProfileField { firstName, lastName, phone, email }

extension ProfileFieldExtensions on ProfileField {
  String label(BuildContext context) => switch (this) {
    .firstName => context.l10n.profile_firstname_title,
    .lastName => context.l10n.profile_lastname_title,
    .phone => context.l10n.profile_phone_number_title,
    .email => context.l10n.profile_email_title,
  };

  TextInputType get keyboardType => switch (this) {
    .email => .emailAddress,
    .phone => .phone,
    _ => .text,
  };

  PatchProfile toPatch(String value) => switch (this) {
    .firstName => PatchProfile(firstName: value),
    .lastName => PatchProfile(lastName: value),
    // .phone => PatchProfile(phone: value),
    .email => PatchProfile(email: value),
    _ => PatchProfile(),
  };
}
