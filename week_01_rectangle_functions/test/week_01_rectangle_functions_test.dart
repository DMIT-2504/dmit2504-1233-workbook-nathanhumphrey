import 'package:week_01_rectangle_functions/week_01_rectangle_functions.dart';
import 'package:test/test.dart';

void main() {
  test('surfaceArea', () {
    // arrange
    int width = 2;
    int height = 2;
    int length = 2;
    int expected = 24;
    int actual;

    // act
    actual = surfaceArea(width, length, height);

    // assert
    expect(actual, expected);
  });

  test('volume', () {
    // arrange
    int width = 2;
    int height = 2;
    int length = 2;
    int expected = 8;
    int actual;

    // act
    actual = volume(width, length, height);

    // assert
    expect(actual, expected);
  });
}
