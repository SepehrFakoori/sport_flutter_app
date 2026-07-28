import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';
import 'package:sport_flutter_app/features/location/domain/repository/location_repository.dart';

class GetLocationUseCase {
  final LocationRepository _repository;

  const GetLocationUseCase(this._repository);

  Future<Result<Location>> call(String city) => _repository.getCity(city);
}
