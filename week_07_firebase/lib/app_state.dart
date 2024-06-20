import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_auth/firebase_auth.dart" hide EmailAuthProvider;
import "package:firebase_ui_auth/firebase_ui_auth.dart";
import "package:week_07_firebase/firebase_options.dart";

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  Future<void> init() async {
    // Initial app state

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders(
      [
        EmailAuthProvider(),
      ],
    );

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
      } else {
        _loggedIn = false;
      }

      notifyListeners();
    });
  }
}
