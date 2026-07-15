import 'package:equatable/equatable.dart';

class Paginated<T> extends Equatable {
  final int totalItems;
  final int totalPages;
  final int currentPage;
  final List<T> items;

  const Paginated({
    required this.totalItems,
    required this.totalPages,
    required this.currentPage,
    required this.items,
  });

  bool get hasMore => currentPage < totalPages;

  @override
  List<Object?> get props => [totalItems, totalPages, currentPage, items];
}
