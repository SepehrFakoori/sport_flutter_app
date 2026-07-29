import 'package:flutter_test/flutter_test.dart';
import 'package:sport_flutter_app/core/extension/int_extensions.dart';

void main() {
  group('Format fee', () {
    test('format zero', () {
      expect(0.toFormattedFee(), '۰');
    });
    test('format 1000', () {
      expect(1000.toFormattedFee(), '۱٬۰۰۰');
    });
  });
}
