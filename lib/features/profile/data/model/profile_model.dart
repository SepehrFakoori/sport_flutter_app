import 'package:intl/intl.dart';

class ProfileModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String? imageUrl;
  final String? email;
  final String gender;
  final DateTime birthDate;

  const ProfileModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.imageUrl,
    this.email,
    required this.gender,
    required this.birthDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    firstName: json['first_name'],
    lastName: json['last_name'],
    phone: json['phone_number'],
    imageUrl: json['profile_photo_url'],
    email: json['email'],
    gender: json['gender'],
    birthDate: DateTime.parse(json['birth_date']),
  );

  Map<String, dynamic> toJson() => {
    'full_name': firstName,
    'phone_number': phone,
    'profile_photo_url': imageUrl,
    'email': email,
    'gender': gender,
    'birth_date': DateFormat('yyyy-MM-dd').format(birthDate),
  };
}
