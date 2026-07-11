import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

abstract class ClassRepository {
  Future<Class> getClass(int id);

  Future<Paginated<Class>> getClasses({required int page, int pageSize = 20});
}
