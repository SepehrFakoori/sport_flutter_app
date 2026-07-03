import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

abstract class ClassRepository {
  Future<Class> getClass();

  Future<List<Class>> getClasses();
}
