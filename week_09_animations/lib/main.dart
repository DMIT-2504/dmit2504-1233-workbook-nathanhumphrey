import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tranforms'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              // Rotate 30 degrees
              angle: 30 * (math.pi / 180),
              child: const Text('Rotate only'),
            ),
          ],
        )),
      ),
    );
  }
}
