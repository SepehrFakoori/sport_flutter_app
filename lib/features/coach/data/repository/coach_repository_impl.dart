import 'package:sport_flutter_app/core/error/failure.dart';
import 'package:sport_flutter_app/core/utils/result.dart';
import 'package:sport_flutter_app/features/coach/data/datasource/coach_remote_datasource.dart';
import 'package:sport_flutter_app/features/coach/data/mapper/coach_mapper.dart';
import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';
import 'package:sport_flutter_app/features/coach/domain/repository/coach_repository.dart';

class CoachRepositoryImpl implements CoachRepository {
  final CoachRemoteDatasource _datasource;

  const CoachRepositoryImpl(this._datasource);

  @override
  Future<Result<Coach>> getCoach(int id) async {
    try {
      final CoachModel result = await _datasource.getCoach(id);
      return Success(result.toEntity());
    } catch (e) {
      return Error(ServerFailure());
    }
  }
}
