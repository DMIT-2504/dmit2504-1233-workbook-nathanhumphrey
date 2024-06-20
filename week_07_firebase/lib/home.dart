import "package:flutter/material.dart";
import "package:week_07_firebase/app_state.dart";

class HomePage extends StatelessWidget {
  const HomePage({required this.appState, super.key});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth Demo'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          ListenableBuilder(
              listenable: appState,
              builder: (context, _) {
                return appState.loggedIn
                    ? (ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile');
                        },
                        child: const Text('Profile')))
                    : (ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/sign-in');
                        },
                        child: const Text('Sign In')));
              })
        ],
      ),
    );
  }
}
