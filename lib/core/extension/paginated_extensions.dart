import 'package:sport_flutter_app/core/entity/paginated.dart';

extension PaginatedX<M> on Paginated<M> {
  Paginated<E> map<E>({required E Function(M model) mapper}) => Paginated<E>(
    totalItems: totalItems,
    totalPages: totalPages,
    currentPage: currentPage,
    items: items.map(mapper).toList(),
  );
}
