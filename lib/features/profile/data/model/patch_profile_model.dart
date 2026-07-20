import 'package:intl/intl.dart';

class PatchProfileModel {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? email;
  final DateTime? birthDate;

  const PatchProfileModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.birthDate,
  });

  Map<String, dynamic> toJson() => {
    if (firstName != null) 'first_name': firstName,
    if (lastName != null) 'last_name': lastName,
    if (gender != null) 'gender': gender,
    if (email != null) 'email': email,
    if (birthDate != null)
      'birth_date': DateFormat('yyyy-MM-dd').format(birthDate!),
  };
}
