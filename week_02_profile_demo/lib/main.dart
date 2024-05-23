import 'package:flutter/material.dart';
import 'package:week_02_profile_demo/widgets/profile_detail.dart';
import 'package:week_02_profile_demo/widgets/profile_heading.dart';
import 'package:week_02_profile_demo/widgets/profile_image.dart';
import 'package:week_02_profile_demo/widgets/profile_name.dart';

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
          title: const Text('Simple Layout Demo'),
        ),
        body: const Column(
          children: <Widget>[
            ProfileHeading(),
            ProfileImage('assets/images/me.jpg'),
            ProfileName('Nate Humphrey'),
            ProfileDetail('Role', 'Developer'),
            ProfileDetail('Team', 'Mobile Development'),
            ProfileDetail('Handle', '@nathanh'),
            ProfileDetail('Supervisor', 'Jane Doe'),
          ],
        ),
      ),
    );
  }
}
