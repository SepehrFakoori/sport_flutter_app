import 'package:intl/intl.dart';

class UpdateProfileModel {
  final String firstName;
  final String lastName;
  final String gender;
  final String? email;
  final DateTime birthDate;

  const UpdateProfileModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.email,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'gender': gender,
    'email': email,
    'birth_date': DateFormat('yyyy-MM-dd').format(birthDate),
  };
}
