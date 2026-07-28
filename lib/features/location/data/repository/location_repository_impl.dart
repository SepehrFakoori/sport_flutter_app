import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/location/data/datasource/location_remote_datasource.dart';
import 'package:sport_flutter_app/features/location/data/mapper/location_mapper.dart';
import 'package:sport_flutter_app/features/location/data/model/location_model.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';
import 'package:sport_flutter_app/features/location/domain/repository/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDatasource _datasource;

  const LocationRepositoryImpl(this._datasource);

  @override
  Future<Result<Location>> getCity(String city) async {
    try {
      final LocationModel result = await _datasource.getCity(city);
      return Success(result.toEntity());
    } catch (e) {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Paginated<Location>>> getCities({
    required int page,
    required int pageSize,
    String? value,
  }) async {
    try {
      final result = await _datasource.getCities(
        page: page,
        pageSize: pageSize,
        value: value,
      );
      return Success(
        result.map<Location>(mapper: ((model) => model.toEntity())),
      );
    } catch (e) {
      return Error(ServerFailure());
    }
  }
}
