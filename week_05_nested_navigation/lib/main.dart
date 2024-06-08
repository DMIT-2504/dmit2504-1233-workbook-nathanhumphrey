import 'package:flutter/material.dart';
import 'package:week_05_nested_navigation/pages/home_page.dart';
import 'package:week_05_nested_navigation/pages/settings/settings_manager.dart';
import 'package:week_05_nested_navigation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        Widget page;

        switch (settings.name) {
          case homeRoute:
            page = const HomePage();
            break;
          case settingsHomeRoute:
            page = const SettingsManager();
            break;
          default:
            throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      },
    );
  }
}
