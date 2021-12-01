import 'package:flab/testing/unit_testing/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Testing', () {
    test('Counter value should be increment', () {
      final counter = Counter();
      counter.increment();
      counter.increment();
      expect(counter.value, 2);
    });

    test('Counter value should be decrement', () {
      final counter = Counter();
      counter.increment();
      counter.decrement();
      expect(counter.value, 0);
    });
  });
}
