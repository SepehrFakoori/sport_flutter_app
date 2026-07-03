class CoachModel {
  final int id;
  final String fullName;
  final String phone;
  final String email;

  const CoachModel({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.email,
  });

  factory CoachModel.fromJson(Map<String, dynamic> json) => CoachModel(
    id: json['id'],
    fullName: json['full_name'],
    phone: json['phone_number'],
    email: json['email'],
  );
}
