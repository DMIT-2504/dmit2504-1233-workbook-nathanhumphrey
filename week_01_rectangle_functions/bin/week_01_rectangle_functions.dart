import 'dart:io';

import 'package:week_01_rectangle_functions/week_01_rectangle_functions.dart'
    as rectangle;

// TODO: Create a menu-driven program to allow the user to calculate the
// area or volume of cuboid until they choose to quit.
void main(List<String> arguments) {
  stdout.writeln(rectangle.surfaceArea(2, 2, 2));
}
