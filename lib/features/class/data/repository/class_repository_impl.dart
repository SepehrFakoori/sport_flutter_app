import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/mapper/class_mapper.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class ClassRepositoryImpl implements ClassRepository {
  final ClassRemoteDatasource _datasource;

  const ClassRepositoryImpl(this._datasource);

  @override
  Future<Class> getClass(int id) async {
    final ClassModel result = await _datasource.getClass(id);
    return result.toEntity();
  }

  @override
  Future<Paginated<Class>> getClasses({
    required int page,
    int pageSize = 20,
  }) async {
    final result = await _datasource.getClasses(page: page, pageSize: 20);
    return result.map<Class>(mapper: (model) => model.toEntity());
  }
}
