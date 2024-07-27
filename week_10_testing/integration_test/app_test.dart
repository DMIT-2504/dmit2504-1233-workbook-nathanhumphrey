import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:week_10_testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify name and email',
        (tester) async {
      // Load app widget.
      await tester.pumpWidget(const MainApp());

      // Verify the counter starts at 0.
      expect(find.text('Name: Nate'), findsNothing);
      expect(find.text('Email: nate@nait.ca'), findsNothing);

      // Finds the floating action button to tap on
      final fab = find.byType(FloatingActionButton);

      // Emulate a tap on the floating action button
      await tester.tap(fab);

      // Trigger a frame
      await tester.pumpAndSettle();

      // Verify name and email are found
      expect(find.text('Name: Nate'), findsOneWidget);
      expect(find.text('Email: nate@nait.ca'), findsOneWidget);
    });
  });
}
