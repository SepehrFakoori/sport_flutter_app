import 'package:sport_flutter_app/features/class/data/model/class_model.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';
import 'package:sport_flutter_app/features/coach/data/mapper/coach_mapper.dart';

extension ClassMapper on ClassModel {
  Class toEntity() {
    return Class(
      id: id,
      title: title,
      description: description,
      fee: fee,
      capacity: capacity,
      remainingCapacity: remainingCapacity,
      isFull: isFull,
      coach: coach.toEntity(),
      isActive: isActive,
    );
  }
}
