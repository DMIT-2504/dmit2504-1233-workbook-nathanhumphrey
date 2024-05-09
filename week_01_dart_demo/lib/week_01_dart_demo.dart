import 'dart:io';

/// Returns a [String]
///
/// Displays the passed in [message] as the prompt
/// for the user.
String prompt(String message) {
  stdout.write(message);
  return stdin.readLineSync()!;
}
