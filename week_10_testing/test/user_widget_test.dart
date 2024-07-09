import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:week_10_testing/models/user.dart';
import 'package:week_10_testing/widgets/user_widget.dart';

void main() {
  late User user;
  late Widget app;

  setUp(() {
    user = const User(name: 'Jane Doe', email: 'jdoe@example.com');

    app = MaterialApp(
      home: Scaffold(body: UserWidget(user: user)),
    );
  });

  testWidgets('UserWidget displays name and email',
      (WidgetTester tester) async {
    await tester.pumpWidget(app);

    // Finders
    final nameFinder = find.text('Name: Jane Doe');
    final emailFinder = find.text('Email: jdoe@example.com');

    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
