import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';

abstract class ClassRemoteDatasource {
  Future<ClassModel> getClass(int id);

  Future<Paginated<ClassModel>> getClasses({
    required int page,
    required int pageSize,
  });
}
