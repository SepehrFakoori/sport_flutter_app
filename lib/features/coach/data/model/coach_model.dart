class CoachModel {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const CoachModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
    id: json['id'],
    firstName: json['first_name'],
    lastName: json['last_name'],
    phone: json['phone_number'],
    email: json['email'],
  );
}
