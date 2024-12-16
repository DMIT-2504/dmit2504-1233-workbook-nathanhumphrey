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
    final fabFinder = find.byType(FloatingActionButton);

    // Expect no name/email on initial render
    expect(nameFinder, findsNothing);
    expect(emailFinder, findsNothing);

    // Tap the FAB
    await tester.tap(fabFinder);

    // Pump to render the ui
    await tester.pump(const Duration(seconds: 1));

    // Expect to find exactly 1 name and 1 email
    expect(nameFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
  });
}
