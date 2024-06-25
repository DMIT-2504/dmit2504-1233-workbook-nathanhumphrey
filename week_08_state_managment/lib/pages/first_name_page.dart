import 'package:flutter/material.dart';
import 'package:week_08_state_managment/widgets/user_notifier.dart';

import '../models/user.dart';

class FirstNamePage extends StatelessWidget {
  const FirstNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user from the inherited notifier
    User user = UserNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            // RE-render on app state changes
            ListenableBuilder(
              listenable: user,
              builder: (BuildContext contex, Widget? child) =>
                  Text('User name: ${user.firstName} ${user.lastName}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user firs name here
        onPressed: () {
          user.firstName = 'NewFirstName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
