import 'package:sport_flutter_app/features/location/data/model/location_model.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

extension LocationMapper on LocationModel {
  Location toEntity() {
    return Location(
      id: id,
      province: province,
      city: city,
      lat: lat,
      long: long,
    );
  }
}
