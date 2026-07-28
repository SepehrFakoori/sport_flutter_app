import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/location/data/model/location_model.dart';

abstract class LocationRemoteDatasource {
  Future<LocationModel> getCity(String city);

  Future<Paginated<LocationModel>> getCities({
    required int page,
    required int pageSize,
    String? value,
  });
}
