import 'package:sport_flutter_app/core/entity/paginated.dart';
import 'package:sport_flutter_app/features/location/data/datasource/location_remote_datasource.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';
import 'package:sport_flutter_app/features/location/data/model/location_model.dart';

class LocationRemoteDatasourceImpl implements LocationRemoteDatasource {
  final HttpClient _client;

  const LocationRemoteDatasourceImpl(this._client);

  @override
  Future<LocationModel> getCity(String city) async {
    final response = await _client.get('/cities/$city');
    return LocationModel.fromJson(response.data);
  }

  @override
  Future<Paginated<LocationModel>> getCities({
    required int page,
    required int pageSize,
    String? value,
  }) async {
    final response = await _client.get(
      '/cities/',
      queryParams: {
        'page': page,
        'page_size': pageSize,
        if (value != null && value.isNotEmpty) 'search': value,
      },
    );

    List<dynamic> cities = response.data['results'];

    return Paginated<LocationModel>(
      totalItems: response.data['total_items'],
      totalPages: response.data['total_pages'],
      currentPage: response.data['current_page'],
      items: cities.map((item) => LocationModel.fromJson(item)).toList(),
    );
  }
}
