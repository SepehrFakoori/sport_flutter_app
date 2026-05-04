import 'package:flutter_test/flutter_test.dart';
import 'package:sport_flutter_app/features/counter.dart';

// flutter test test/features/counter_test.dart
void main() {
  group('Test start, increment, decrement', () {
    test('Value should start at 0', () {
      final counter = Counter();

      expect(counter.value, 0);
    });
    test('Counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
    test('Counter value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
    test('Counter value should be decremented -2', () {
      final counter = Counter();

      counter.decrement();
      counter.decrement();

      expect(counter.value, -2);
    });
  });
}
