import 'package:flutter/material.dart';
import 'package:week_08_state_managment/widgets/user_notifier.dart';

import 'models/user.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

// Create the state
User user = User('Jane', 'Doe');

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserNotifier(
      user: user,
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
