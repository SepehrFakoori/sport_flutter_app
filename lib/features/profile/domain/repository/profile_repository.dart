import 'package:sport_flutter_app/features/profile/domain/entity/profile.dart';

abstract class ProfileRepository {
  Future<Profile> getProfile();
}
