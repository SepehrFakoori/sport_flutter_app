class Coach {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;

  const Coach({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
  });

  String get fullName => '$firstName $lastName';
}
