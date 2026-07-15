import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/mapper/class_mapper.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class ClassRepositoryImpl implements ClassRepository {
  final ClassRemoteDatasource _datasource;

  const ClassRepositoryImpl(this._datasource);

  @override
  Future<Result<Class>> getClass(int id) async {
    try {
      final ClassModel result = await _datasource.getClass(id);
      return Success(result.toEntity());
    } catch (e) {
      return Error(ServerFailure());
    }
  }

  @override
  Future<Result<Paginated<Class>>> getClasses({
    required int page,
    int pageSize = 20,
  }) async {
    try {
      final result = await _datasource.getClasses(page: page, pageSize: 20);
      return Success(result.map<Class>(mapper: (model) => model.toEntity()));
    } catch (e) {
      return Error(ServerFailure());
    }
  }
}
