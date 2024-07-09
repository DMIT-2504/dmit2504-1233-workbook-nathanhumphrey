import 'package:test/test.dart';
import 'package:week_10_testing/models/user.dart';

void main() {
  group('User Tests', () {
    late User user;

    setUp(() {
      user = const User(
        name: 'Jane Doe',
        email: 'jdoe@example.com',
      );
    });

    test('User should have a name and an email', () {
      expect(user.name, 'Jane Doe');
      expect(user.email, 'jdoe@example.com');
    });
  });
}
