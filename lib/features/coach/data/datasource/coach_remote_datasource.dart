import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';

abstract class CoachRemoteDatasource {
  Future<CoachModel> getCoach(int id);
}
