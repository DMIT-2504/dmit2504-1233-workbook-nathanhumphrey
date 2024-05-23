import 'package:flutter/material.dart';

class ProfileHeading extends StatelessWidget {
  const ProfileHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text(
        'Employee Profile',
        style: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
