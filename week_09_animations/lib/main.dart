import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:week_09_animations/animations_page.dart';
import 'package:week_09_animations/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
