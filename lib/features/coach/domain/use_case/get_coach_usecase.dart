import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/repository/coach_repository.dart';

class GetCoachUseCase {
  final CoachRepository _repository;

  const GetCoachUseCase(this._repository);

  Future<Result<Coach>> call(int id) => _repository.getCoach(id);
}
