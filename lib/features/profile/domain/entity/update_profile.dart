import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';

class UpdateProfile {
  final String firstName;
  final String lastName;
  final Gender gender;
  final String? email;
  final DateTime birthDate;

  const UpdateProfile({
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.email,
    required this.birthDate,
  });
}
