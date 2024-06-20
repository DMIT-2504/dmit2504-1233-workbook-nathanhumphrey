import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:week_07_firebase/app_state.dart';
import 'package:week_07_firebase/home.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create our AppState
  AppState appState = AppState();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MainApp(
    appState: appState,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.appState, super.key});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: HomePage(appState: appState)),
    );
  }
}
