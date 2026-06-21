import 'package:sport_flutter_app/features/auth/data/model/auth_model.dart';
import 'package:sport_flutter_app/features/auth/domain/entity/auth.dart';

extension AuthMapper on AuthModel {
  Auth toEntity() => Auth(accessToken: accessToken, refreshToken: refreshToken);
}
