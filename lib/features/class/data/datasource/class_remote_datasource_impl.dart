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
  Future<List<ClassModel>> getClasses() async {
    final response = await _client.get('/classes/');
    final List<dynamic> classes = response.data["results"];
    return classes.map((item) => ClassModel.fromJson(item)).toList();
  }
}
