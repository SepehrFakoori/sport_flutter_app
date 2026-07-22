import 'package:flutter_test/flutter_test.dart';
import 'package:sport_flutter_app/core/utils/time_formatter.dart';

void main() {
  group('TimeFormatter.mmss', () {
    test('formats zero seconds', () {
      expect(TimeFormatter.mmss(0), '00:00');
    });

    test('formats seconds under a minute', () {
      expect(TimeFormatter.mmss(5), '00:05');
    });

    test('formats exactly one minute', () {
      expect(TimeFormatter.mmss(60), '01:00');
    });

    test('formats minutes and seconds', () {
      expect(TimeFormatter.mmss(125), '02:05');
    });

    test('pads single-digit seconds with a leading zero', () {
      expect(TimeFormatter.mmss(61), '01:01');
    });

    test('does not pad minutes beyond two digits', () {
      expect(TimeFormatter.mmss(6000), '100:00');
    });

    test('handles large values', () {
      expect(TimeFormatter.mmss(3599), '59:59');
    });
  });
}