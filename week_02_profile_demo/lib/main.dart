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
    const MaterialColor themeSwatch = Colors.indigo;
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: themeSwatch,
      primary: themeSwatch.shade900,
      onPrimary: themeSwatch.shade100,
      secondary: themeSwatch.shade500,
      onSecondary: themeSwatch.shade900,
      tertiary: themeSwatch.shade100,
      onTertiary: themeSwatch.shade900,
      brightness: Brightness.light,
      //background: themeSwatch.shade900,
    );
    final Color textColor = colorScheme.primary;

    return MaterialApp(
      theme: ThemeData(
        colorScheme: colorScheme,
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: textColor,
            ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: textColor,
              decorationColor: textColor,
            ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: textColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          titleTextStyle: TextStyle(
            fontSize: 24.0,
            color: colorScheme.onPrimary,
          ),
        ),
      ),
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
