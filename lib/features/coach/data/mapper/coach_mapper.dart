import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';
import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

extension CoachMapper on CoachModel {
  Coach toEntity() => Coach(
    id: id,
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    email: email,
  );
}
