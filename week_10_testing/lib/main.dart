import 'package:flutter/material.dart';
import 'package:week_10_testing/models/user.dart';
import 'package:week_10_testing/widgets/user_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: UserWidget(
            user: User(name: 'Nate', email: 'nate@nait.ca'),
          ),
        ),
      ),
    );
  }
}
