import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/error/repository_handler.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/mapper/class_mapper.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class ClassRepositoryImpl with RepositoryHandler implements ClassRepository {
  final ClassRemoteDatasource _datasource;

  const ClassRepositoryImpl(this._datasource);

  @override
  Future<Result<Class>> getClass(int id) async {
    return execute(() async {
      final ClassModel model = await _datasource.getClass(id);
      return model.toEntity();
    });
  }

  @override
  Future<Result<Paginated<Class>>> getClasses({
    required int page,
    required int pageSize,
  }) async {
    return execute(() async {
      final paginated = await _datasource.getClasses(
        page: page,
        pageSize: pageSize,
      );
      return paginated.map<Class>(mapper: (model) => model.toEntity());
    });
  }
}
