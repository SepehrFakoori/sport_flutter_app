import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/class/domain/repository/class_repository.dart';

class GetClassUseCase {
  final ClassRepository _repository;

  const GetClassUseCase(this._repository);

  Future<Result<Class>> call(int id) => _repository.getClass(id);
}
