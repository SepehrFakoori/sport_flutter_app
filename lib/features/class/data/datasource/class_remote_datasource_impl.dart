import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';

class ClassRemoteDatasourceImpl implements ClassRemoteDatasource {
  final HttpClient _client;

  const ClassRemoteDatasourceImpl(this._client);

  @override
  Future<ClassModel> getClass(int id) async {
    final response = await _client.get('/classes/$id/');
    return ClassModel.fromJson(response.data);
  }

  @override
  Future<Paginated<ClassModel>> getClasses({
    required int page,
    required int pageSize,
  }) async {
    final response = await _client.get(
      '/classes/',
      queryParams: {'page': page, 'page_size': pageSize},
    );

    List<dynamic> classes = response.data['results'];

    return Paginated<ClassModel>(
      totalItems: response.data['total_items'],
      totalPages: response.data['total_pages'],
      currentPage: response.data['current_page'],
      items: classes.map((item) => ClassModel.fromJson(item)).toList(),
    );
  }
}
