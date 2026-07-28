class Location {
  final int id;
  final String province;
  final String city;
  final double lat;
  final double long;

  Location({
    required this.id,
    required this.province,
    required this.city,
    required this.lat,
    required this.long,
  });

  String get address => '$province، $city';
}
