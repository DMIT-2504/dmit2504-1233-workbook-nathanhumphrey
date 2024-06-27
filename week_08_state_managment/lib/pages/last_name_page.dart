import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';

class LastNamePage extends ConsumerWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use ref to listen to changes to the user state
    final User user = ref.watch(userProvider);

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
            Text('User name: ${user.firstName} ${user.lastName}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user first name here
        onPressed: () {
          user.lastName = 'NewLastName';
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
