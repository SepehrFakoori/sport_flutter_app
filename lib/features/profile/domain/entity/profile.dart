import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';

class Profile {
  final String fullName;
  final String phoneNumber;
  final String? avatar;
  final String? email;
  final Gender gender;
  final DateTime birthDate;

  const Profile({
    required this.fullName,
    required this.phoneNumber,
    required this.avatar,
    this.email,
    required this.gender,
    required this.birthDate,
  });
}
