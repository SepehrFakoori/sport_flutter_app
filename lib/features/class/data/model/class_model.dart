class ClassModel {
  final int id;
  final String title;
  final String description;
  final int fee;
  final int capacity;
  final int remainingCapacity;
  final bool isFull;
  final bool isActive;

  ClassModel({
    required this.id,
    required this.title,
    required this.description,
    required this.fee,
    required this.capacity,
    required this.remainingCapacity,
    required this.isFull,
    required this.isActive,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    fee: json['fee'],
    capacity: json['capacity'],
    remainingCapacity: json['remainingCapacity'],
    isFull: json['isFull'],
    isActive: json['isActive'],
  );
}
