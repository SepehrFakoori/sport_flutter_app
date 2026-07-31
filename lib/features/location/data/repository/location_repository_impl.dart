import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/error/repository_handler.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/location/data/datasource/location_remote_datasource.dart';
import 'package:sport_flutter_app/features/location/data/mapper/location_mapper.dart';
import 'package:sport_flutter_app/features/location/data/model/location_model.dart';
import 'package:sport_flutter_app/features/location/domain/entity/location.dart';
import 'package:sport_flutter_app/features/location/domain/repository/location_repository.dart';

class LocationRepositoryImpl
    with RepositoryHandler
    implements LocationRepository {
  final LocationRemoteDatasource _datasource;

  const LocationRepositoryImpl(this._datasource);

  @override
  Future<Result<Location>> getCity(String city) async {
    return execute(() async {
      final LocationModel location = await _datasource.getCity(city);

      return location.toEntity();
    });
  }

  @override
  Future<Result<Paginated<Location>>> getCities({
    required int page,
    required int pageSize,
    String? value,
  }) async {
    return execute(() async {
      final paginated = await _datasource.getCities(
        page: page,
        pageSize: pageSize,
      );

      return paginated.map<Location>(mapper: (model) => model.toEntity());
    });
  }
}
