import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/class/data/datasource/class_remote_datasource.dart';
import 'package:sport_flutter_app/features/class/data/model/class_model.dart';

class ClassRemoteDatasourceImpl implements ClassRemoteDatasource {
  final HttpClient _client;

  const ClassRemoteDatasourceImpl(this._client);

  @override
  Future<ClassModel> getClass() {
    // TODO: implement getClass
    throw UnimplementedError();
  }

  @override
  Future<List<ClassModel>> getClasses() async {
    final response = await _client.get('/classes/');
    final classes = response.data['results'];
    return classes
        .map((item) => ClassModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
