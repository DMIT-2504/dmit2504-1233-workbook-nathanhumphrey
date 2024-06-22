import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:week_07_firebase/app_state.dart';
import 'package:week_07_firebase/home.dart';
import 'package:week_07_firebase/todo_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create our AppState
  AppState appState = AppState();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MainApp(
    appState: appState,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({required this.appState, super.key});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    final routes = {
      '/': (context) {
        return HomePage(appState: appState);
      },
      '/sign-in': (context) {
        return SignInScreen(
          actions: [
            AuthStateChangeAction((context, state) {
              // state has changed, find out what happened and deal with it
              final user = switch (state) {
                SignedIn state => state.user,
                UserCreated state => state.credential.user,
                _ => null,
              };

              if (user == null) {
                return;
              }

              if (state is UserCreated) {
                // New user, update their display name
                user.updateDisplayName(user.email!.split('@').first);
              }

              // remove the modal
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        );
      },
      '/profile': (context) {
        return ProfileScreen(
          actions: [
            SignedOutAction((context) {
              // Remove the modal
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
            }),
          ],
        );
      },
      '/todos': (context) {
        return TodoPage(
          appState: appState,
        ); // need a TodoPage
      }
    };

    return MaterialApp(
      title: 'Firebase Demo',
      routes: routes,
      onGenerateRoute: (settings) {
        if (settings.name == '/todos') {
          // Perform an auth check
          if (appState.loggedIn) {
            return MaterialPageRoute(
                builder: (context) => TodoPage(
                      appState: appState,
                    ));
          } else {
            // Not logged in!
            return MaterialPageRoute(
                builder: (context) => HomePage(appState: appState));
          }
        }

        // For any other route, use the default behaviour
        return null;
      },
    );
  }
}
