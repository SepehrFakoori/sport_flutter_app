import 'package:sport_flutter_app/features/coach/domain/entity/coach.dart';

class Class {
  final int id;
  final String title;
  final String description;
  final String fee;
  final int capacity;
  final int remainingCapacity;
  final bool isFull;
  final Coach coach;
  final bool isActive;

  Class({
    required this.id,
    required this.title,
    required this.description,
    required this.fee,
    required this.capacity,
    required this.remainingCapacity,
    required this.isFull,
    required this.coach,
    required this.isActive,
  });
}
