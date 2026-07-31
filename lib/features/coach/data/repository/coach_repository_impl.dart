import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/error/repository_handler.dart';
import 'package:sport_flutter_app/core/extension/paginated_extensions.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/coach/data/datasource/coach_remote_datasource.dart';
import 'package:sport_flutter_app/features/coach/data/mapper/coach_mapper.dart';
import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/repository/coach_repository.dart';

class CoachRepositoryImpl with RepositoryHandler implements CoachRepository {
  final CoachRemoteDatasource _datasource;

  const CoachRepositoryImpl(this._datasource);

  @override
  Future<Result<Coach>> getCoach(int id) async {
    return execute(() async {
      final CoachModel coach = await _datasource.getCoach(id);

      return coach.toEntity();
    });
  }

  @override
  Future<Result<Paginated<Coach>>> getCoaches({
    required int page,
    required int pageSize,
  }) async {
    return execute(() async {
      final paginated = await _datasource.getCoaches(
        page: page,
        pageSize: pageSize,
      );

      return paginated.map<Coach>(mapper: (model) => model.toEntity());
    });
  }
}
