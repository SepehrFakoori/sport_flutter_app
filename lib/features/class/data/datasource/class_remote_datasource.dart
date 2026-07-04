import 'package:sport_flutter_app/features/class/data/model/class_model.dart';

abstract class ClassRemoteDatasource {
  Future<ClassModel> getClass(int id);

  Future<List<ClassModel>> getClasses();
}
