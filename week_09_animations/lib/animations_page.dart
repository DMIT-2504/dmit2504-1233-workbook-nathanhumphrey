import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  const AnimationsPage({super.key});

  @override
  State<AnimationsPage> createState() => _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  // Required for tween animation
  int _tweenValue = 0;
  late Timer _tweenTimer;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 3,
      ),
    )..repeat();

    // Start the tween animation parts
    _tweenTimer = Timer.periodic(
      const Duration(milliseconds: 30),
      (timer) {
        setState(() {
          _tweenValue = _tweenValue == 1000 ? 1 : _tweenValue + 1;
        });
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              child: const Text('Rotate Animation'),
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * (2 * math.pi),
                  child: child,
                );
              },
            ),
            const SizedBox(
              height: 105.0,
            ),
            TweenAnimationBuilder(
              tween: IntTween(
                begin: 0,
                end: _tweenValue,
              ),
              duration: const Duration(microseconds: 30),
              builder: (_, int? value, __) {
                double val = value! / 100.0;
                return Transform.rotate(
                  angle: val * (2 * math.pi),
                  child: const Text('Tween Builder Rotation'),
                );
              },
            ),
            const SizedBox(
              height: 105.0,
            ),
            RotationTransition(
              //turns: _controller,
              turns: CurvedAnimation(
                parent: _controller,
                curve: Curves.elasticInOut,
              ),
              child: const Text('RotationTransition'),
            )
          ],
        ),
      ),
    );
  }
}
