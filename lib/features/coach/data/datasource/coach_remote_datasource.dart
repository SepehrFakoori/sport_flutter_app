import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';

abstract class CoachRemoteDatasource {
  Future<CoachModel> getCoach(int id);

  Future<Paginated<CoachModel>> getCoaches({
    required int page,
    required int pageSize,
  });
}
