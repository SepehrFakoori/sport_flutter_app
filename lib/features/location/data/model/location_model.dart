class LocationModel {
  final int id;
  final String province;
  final String city;
  final double lat;
  final double long;

  LocationModel({
    required this.id,
    required this.province,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
    id: json['id'],
    province: json['province']['name'],
    city: json['name'],
    lat: json['lat'],
    long: json['lng'],
  );
}
