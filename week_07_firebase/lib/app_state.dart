import "package:flutter/material.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_auth/firebase_auth.dart" hide EmailAuthProvider;
import "package:firebase_ui_auth/firebase_ui_auth.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:week_07_firebase/firebase_options.dart";

import "models/todo.dart";

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  User? _user;
  User? get user => _user;
  set user(User? user) {
    if (user == null) {
      throw ArgumentError('Cannot set the user to null');
    }
    _user = user;
  }

  List<Todo>? _todos;
  List<Todo>? get todos {
    if (user == null) {
      throw StateError('Cannot get todos when user is null');
    }
    return _todos;
  }

  set todos(List<Todo>? todos) {
    if (user == null) {
      throw StateError('Cannot set todos when the user is null');
    }
    if (todos == null) {
      throw ArgumentError('Cannot set todos to null');
    }
    _todos = todos;
  }

  void _fetchTodos() {
    if (user == null) {
      throw StateError('Cannot fetch todos when user is null');
    }

    FirebaseFirestore.instance
        .collection('/todos/${user!.uid}/todos')
        .get()
        .then((snapshot) {
      todos = snapshot.docs.map((doc) => Todo.fromFirestore(doc)).toList();
    });
  }

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
        this.user = user;
        _fetchTodos();
      } else {
        _loggedIn = false;
      }

      notifyListeners();
    });
  }
}
