import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class GetClassesUseCase {
  final ClassRepository _repository;

  const GetClassesUseCase(this._repository);

  Future<Paginated<Class>> call({required int page, int pageSize = 20}) =>
      _repository.getClasses(page: page, pageSize: pageSize);
}
