import 'package:flutter/material.dart';
import 'package:week_05_navigator/pages/page_one.dart';
import 'package:week_05_navigator/pages/page_two.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const PageOne(),
        '/page-two': (context) => const PageTwo(),
      },
    );
  }
}
