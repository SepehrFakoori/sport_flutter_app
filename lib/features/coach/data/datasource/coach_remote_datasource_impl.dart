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
}
