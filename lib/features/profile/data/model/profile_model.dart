class ProfileModel {
  final String fullName;
  final String phoneNumber;
  final String? email;
  final String gender;
  final DateTime birthDate;

  const ProfileModel({
    required this.fullName,
    required this.phoneNumber,
    this.email,
    required this.gender,
    required this.birthDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    fullName: json['full_name'],
    phoneNumber: json['phone_number'],
    email: json['email'],
    gender: json['gender'],
    // DateTime parsing بدون handling error || اگر API خراب باشد → crash ||  throw custom exception
    birthDate: DateTime.parse(json['birth_date']),
  );

  Map<String, dynamic> toJson() => {
    'full_name': fullName,
    'phone_number': phoneNumber,
    'email': email,
    'gender': gender,
    'birth_date': birthDate.toIso8601String(),
  };
}
