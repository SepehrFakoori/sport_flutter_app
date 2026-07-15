import 'package:equatable/equatable.dart';
import 'package:sport_flutter_app/features/class/domain/entity/class.dart';

enum PaginatedStatus { initial, loading, loadingMore, success, failure }

class ClassListState extends Equatable {
  final PaginatedStatus status;
  final List<Class> classes;
  final int currentPage;
  final bool hasReachedMax;
  final String? errorMessage;

  const ClassListState({
    this.status = PaginatedStatus.initial,
    this.classes = const [],
    this.currentPage = 0,
    this.hasReachedMax = false,
    this.errorMessage,
  });

  ClassListState copyWith({
    PaginatedStatus? status,
    List<Class>? classes,
    int? currentPage,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return ClassListState(
      status: status ?? this.status,
      classes: classes ?? this.classes,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    classes,
    currentPage,
    hasReachedMax,
    errorMessage,
  ];
}
