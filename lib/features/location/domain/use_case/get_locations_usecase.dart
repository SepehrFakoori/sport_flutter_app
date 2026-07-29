import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';
import 'package:sport_flutter_app/features/location/domain/repository/location_repository.dart';

class GetLocationsUseCase {
  final LocationRepository _repository;

  const GetLocationsUseCase(this._repository);

  Future<Result<Paginated<Location>>> call({
    required int page,
    int pageSize = 20,
    String? value,
  }) => _repository.getCities(page: page, pageSize: pageSize, value: value);
}
