// Prompt for the [number] of values
// Prompt for the range
// Generate a list of [number] values with no duplicates
// Display the list of values

import 'dart:io';
import 'dart:math';

void main(List<String> arguments) {
  int numOfValues;
  int range;
  var ticket = <int>[];

  stdout.write('Enter the number of values: ');
  numOfValues = int.parse(stdin.readLineSync() as String);

  stdout.write('Enter range: ');
  range = int.parse(stdin.readLineSync() as String);

  for (var i = 0; i < numOfValues; i += 1) {
    var number = Random().nextInt(range) + 1;
    if (!ticket.contains(number)) {
      ticket.add(number);
    } else {
      // Decrement the counter to account for the number that is not
      // being added to the ticket
      i -= 1;
    }
  }

  // TODO: sort the ticket
  stdout.writeln(ticket);
}
