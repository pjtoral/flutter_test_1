import "package:flutter_test/flutter_test.dart";
import 'package:testing_project_1/counter.dart';

main() {
  group('Counter class', () {
    late Counter counter;

    setUp(() => counter = Counter()); //isolates object instantiation

    test('Given a Counter class, when you instantiate, then count = 0', () {
      //ACT
      int count = counter.count; //get object count
      //ASSERT
      expect(count, 0); //test if object count is 0 as expected
    });

    group('Incremenet', () {
      test(
          'Given instantiated Counter class, when increment button pressed, then count = count + 1',
          () {
        // ACT
        counter.incrementCount(); //simulate the pressing of increment button
        // ASSERT
        expect(counter.count,
            1); // test if counter.count has incremented accordingly
      });

      test(
          'Given instantiated Counter class, when increment button pressed twice, then count = count + 2',
          () {
        // ACT
        counter.incrementCount();
        counter.incrementCount(); //simulate the pressing of increment button
        // ASSERT
        expect(counter.count,
            2); // test if counter.count has incremented accordingly
      });
    });

    test(
        'Given instantiated Counter class, when decrement is called, then count = count -1 ',
        () {
      //ACT
      counter.decrementCount();
      //ASSERT
      expect(counter.count, -1);
    });
  });
}
