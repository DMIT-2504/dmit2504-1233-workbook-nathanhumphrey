import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:week_08_state_managment/state/user_cubit.dart';

import '../models/user.dart';

class LastNamePage extends StatelessWidget {
  const LastNamePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            // RE-render on app state changes
            // Replace ListenableBuilder with BlocBuilder
            BlocBuilder<UserCubit, UserState>(
              builder: (BuildContext contex, UserState state) => Text(
                  'User name: ${state.user.firstName} ${state.user.lastName}'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Update our user first name here
        onPressed: () {
          User user = context.read<UserCubit>().state.user;
          user.lastName = 'NewLastName';
          context.read<UserCubit>().updatedUser(user);
        },
        child: const Icon(Icons.update),
      ),
    );
  }
}
