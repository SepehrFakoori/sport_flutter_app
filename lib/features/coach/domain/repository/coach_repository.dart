import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

abstract class CoachRepository {
  Future<Result<Coach>> getCoach(int id);

  Future<Result<Paginated<Coach>>> getCoaches({
    required int page,
    required int pageSize,
  });
}
