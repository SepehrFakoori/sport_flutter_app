import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';

class ClassModel {
  final int id;
  final String title;
  final String description;
  final String fee;
  final int capacity;
  final int remainingCapacity;
  final bool isFull;
  final CoachModel coach;
  final bool isActive;

  ClassModel({
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

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    fee: json['fee'],
    capacity: json['capacity'],
    remainingCapacity: json['remaining_capacity'],
    isFull: json['is_full'],
    coach: CoachModel.fromJson(json['coach']),
    isActive: json['is_active'],
  );
}
