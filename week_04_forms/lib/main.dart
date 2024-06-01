// ignore_for_file: use_super_parameters

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

class UserSignUpForm extends StatefulWidget {
  const UserSignUpForm({super.key});

  @override
  State<UserSignUpForm> createState() => _UserSignUpFormState();
}

class _UserSignUpFormState extends State<UserSignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('New User Form',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              )),
          UsernameInput(
            controller: _usernameController,
          ),
          PasswordFormField(controller: _passwordController),
          ElevatedButton(
            onPressed: () => {
              if (_formKey.currentState!.validate())
                {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Username: ${_usernameController.text} Password: ${_passwordController.text}'),
                    ),
                  ),
                }
            },
            child: const Text('Sign Up'),
          ),
        ],
      ),
    );
  }
}

class PasswordFormField extends FormField<String> {
  final TextEditingController controller;
  final String label;

  PasswordFormField({
    FormFieldSetter<String>? onSaved,
    required this.controller,
    this.label = 'Password',
    FormFieldValidator<String>? validator,
    Key? key,
  }) : super(
          key: key,
          validator: validator,
          builder: (FormFieldState<String> state) {
            return TextFormField(
              controller: controller,
              autocorrect: false,
              enableSuggestions: false,
              obscureText: true,
              decoration: InputDecoration(
                labelText: label,
              ),
            );
          },
        );
}

class UsernameInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;

  const UsernameInput({
    required this.controller,
    this.label = 'Username',
    this.errorMessage = 'Username cannot be empty',
    super.key,
  });

  @override
  State<UsernameInput> createState() => _UsernameInputState();
}

class _UsernameInputState extends State<UsernameInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: (value) =>
          value == null || value.trim() == '' ? widget.errorMessage : null,
      autocorrect: false,
      enableSuggestions: true,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
