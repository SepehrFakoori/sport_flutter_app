import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/coach/data/datasource/coach_remote_datasource.dart';
import 'package:sport_flutter_app/features/coach/data/model/coach_model.dart';

class CoachRemoteDatasourceImpl implements CoachRemoteDatasource {
  final HttpClient _client;

  const CoachRemoteDatasourceImpl(this._client);

  @override
  Future<CoachModel> getCoach(int id) async {
    final response = await _client.get('/coaches/$id/');
    return CoachModel.fromJson(response.data);
  }

  @override
  Future<Paginated<CoachModel>> getCoaches({
    required int page,
    required int pageSize,
  }) async {
    final response = await _client.get(
      '/coaches/',
      queryParams: {'page': page, 'page_size': pageSize},
    );

    List<dynamic> coaches = response.data['results'];

    return Paginated<CoachModel>(
      totalItems: response.data['total_items'],
      totalPages: response.data['total_pages'],
      currentPage: response.data['current_page'],
      items: coaches.map((item) => CoachModel.fromJson(item)).toList(),
    );
  }
}
