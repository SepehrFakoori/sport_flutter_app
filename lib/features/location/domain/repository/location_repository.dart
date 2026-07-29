import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';

abstract class LocationRepository {
  Future<Result<Location>> getCity(String city);

  Future<Result<Paginated<Location>>> getCities({
    required int page,
    required int pageSize,
    String? value,
  });
}
