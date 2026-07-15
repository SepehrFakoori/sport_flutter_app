import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

abstract class ClassRepository {
  Future<Result<Class>> getClass(int id);

  Future<Result<Paginated<Class>>> getClasses({
    required int page,
    required int pageSize,
  });
}
