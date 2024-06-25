import 'package:flutter/material.dart';
import 'package:week_08_state_managment/widgets/user_notifier.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user from the inherited notifier
    User user = UserNotifier.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Last Name Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24.0,
            ),
            ListenableBuilder(
              listenable: user,
              builder: (BuildContext context, Widget? child) =>
                  Text('User name: ${user.firstName} ${user.lastName}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user last name here
        onPressed: () {
          user.lastName = 'NewLastName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
