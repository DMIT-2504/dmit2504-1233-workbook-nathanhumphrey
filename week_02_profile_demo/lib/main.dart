import 'package:flutter/material.dart';
import 'package:week_02_profile_demo/widgets/profile_detail.dart';
import 'package:week_02_profile_demo/widgets/profile_heading.dart';

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
        body: Column(
          children: <Widget>[
            const ProfileHeading(),
            ClipOval(
              child: Image.asset(
                'assets/images/me.jpg',
                width: 250.0,
                height: 250.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Nathan Humphrey',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // const ProfileDetail('Role', 'Developer'),
            // const ProfileDetail('Team', 'Mobile Development'),
            // const ProfileDetail('Handle', '@nathanh'),
            // const ProfileDetail('Supervisor', 'Jane Doe'),
          ],
        ),
      ),
    );
  }
}
