import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mobile UI Form'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: UserSignUpForm(),
        ),
      ),
    );
  }
}

class UserSignUpForm extends StatelessWidget {
  const UserSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('New User Form',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
          TextFormField(
            validator: (value) => value == null || value.trim() == ''
                ? 'Username cannot be empty'
                : null,
            autocorrect: false,
            enableSuggestions: true,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          TextFormField(
            autocorrect: false,
            enableSuggestions: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          ElevatedButton(
            onPressed: () => false,
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}
