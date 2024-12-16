import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'animations_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranforms'),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Animations Page',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AnimationsPage(),
            ),
          );
        },
        child: const Icon(Icons.play_arrow),
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
          // Transforms can be nested too!
          Transform.scale(
            scale: 1.5,
            child: Transform.translate(
              offset: const Offset(0, 64.0),
              child: Transform.rotate(
                angle: -30 * (math.pi / 180),
                child: const Text('Scale, translate, and rotate'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
