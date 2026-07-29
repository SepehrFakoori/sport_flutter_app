import 'package:flutter_test/flutter_test.dart';
import 'package:sport_flutter_app/core/deep_link/deep_link_builder.dart';

void main() {
  late DeepLinkBuilder builder;

  setUp(() {
    builder = const DeepLinkBuilder(host: 'example.ir');
  });

  group('Test deep link', () {
    test('builds a URI with a single segment', () {
      final uri = builder.build(['profile']);
      expect(uri.toString(), 'https://example.ir/profile');
    });

    test('builds a URI with multiple segments joined by /', () {
      final uri = builder.build(['profile', '123', 'edit']);
      expect(uri.toString(), 'https://example.ir/profile/123/edit');
    });

    test('includes query parameters when provided', () {
      final uri = builder.build(['search'], queryParameters: {'q': 'flutter'});
      expect(uri.toString(), 'https://example.ir/search?q=flutter');
    });

    test('omits query string when queryParameters is null', () {
      final uri = builder.build(['profile']);
      expect(uri.hasQuery, false);
    });

    test('handles empty segments list', () {
      final uri = builder.build([]);
      expect(uri.toString(), 'https://example.ir/');
    });

    test('uses https scheme', () {
      final uri = builder.build(['profile']);
      expect(uri.scheme, 'https');
    });

    test('uses the given host', () {
      final uri = builder.build(['profile']);
      expect(uri.host, 'example.ir');
    });
  });
}
