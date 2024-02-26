import "package:flutter_test/flutter_test.dart";
import "../lib/counter.dart";

main() {
  //GIVEN, WHEN, THEN
  test('Given a Counter class, when you instantiate, then count = 0', () {
    //ARRANGE
    Counter counter; //create object definition
    //ACT
    counter = Counter(); //instantiate object
    int count = counter.count; //get object count
    //ASSERT
    expect(count, 0); //test if object count is 0 as expected
  });

  test(
      'Given instantiated Counter class, when increment button pressed, then count = count + 1',
      () {
    // ARRANGE
    Counter counter = Counter(); //instantiate Counter class
    // ACT
    counter.incrementCount(); //simulate the pressing of increment button
    // ASSERT
    expect(
        counter.count, 1); // test if counter.count has incremented accordingly
  });
}
