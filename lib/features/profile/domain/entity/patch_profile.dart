import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';

class PatchProfile {
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final String? email;
  final DateTime? birthDate;

  const PatchProfile({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.birthDate,
  });
}
