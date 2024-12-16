import 'package:flutter/material.dart';
import 'package:week_04_network_gestures/widgets/random_dog.dart';

var dogImageUrl = '';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: RandomDogImage(),
          ),
        ),
      ),
    );
  }
}
