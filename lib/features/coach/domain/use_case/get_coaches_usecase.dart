import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/repository/coach_repository.dart';

class GetCoachesUseCase {
  final CoachRepository _repository;

  const GetCoachesUseCase(this._repository);

  Future<Result<Paginated<Coach>>> call({
    required int page,
    int pageSize = 20,
  }) => _repository.getCoaches(page: page, pageSize: pageSize);
}
