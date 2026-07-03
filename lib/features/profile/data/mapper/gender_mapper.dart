import 'package:sport_flutter_app/features/profile/domain/entity/gender.dart';

class GenderMapper {
  static Gender fromApi(String value) {
    switch (value) {
      case 'M':
        return Gender.male;
      case 'F':
        return Gender.female;
      default:
        throw Exception('Invalid gender: $value');
    }
  }

  static String toApi(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'M';
      case Gender.female:
        return 'F';
    }
  }
}
