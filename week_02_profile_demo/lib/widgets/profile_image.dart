import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String image;

  const ProfileImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        image,
        width: 250.0,
        height: 250.0,
      ),
    );
  }
}
