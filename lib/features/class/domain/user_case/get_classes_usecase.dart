import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class GetClassesUseCase {
  final ClassRepository _repository;

  const GetClassesUseCase(this._repository);

  Future<List<Class>> call() => _repository.getClasses();
}
