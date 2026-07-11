import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';

class Profile {
  final String firstName;
  final String lastName;
  final String phone;
  final String? imageUrl;
  final String? email;
  final Gender gender;
  final DateTime birthDate;

  const Profile({
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.imageUrl,
    this.email,
    required this.gender,
    required this.birthDate,
  });

  String get fullName => '$firstName $lastName';
}
