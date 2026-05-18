import 'package:flutter_test/flutter_test.dart';
import 'package:sport_flutter_app/core/network/http_client.dart';

void main() {
  test('Test client', () async {
    final httpClient = HTTPClient();

    final response = await httpClient.dio.get('');

    expect(response, {'hello': 'hi'});
  });
}
