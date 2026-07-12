import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

abstract class CoachRepository {
  Future<Coach> getCoach(int id);
}
