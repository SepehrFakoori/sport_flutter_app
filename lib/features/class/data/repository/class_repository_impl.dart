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
  Future<List<Class>> getClasses() async {
    final List<ClassModel> result = await _datasource.getClasses();
    return result.map((item) => item.toEntity()).toList();
  }
}
