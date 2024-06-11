import 'package:flutter/material.dart';

class Option1Page extends StatefulWidget {
  const Option1Page({super.key});

  @override
  State<Option1Page> createState() => _Option1PageState();
}

class _Option1PageState extends State<Option1Page> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Option 1 - Shared Preferences'),
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Some Text',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Text'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Remove Text'),
            ),
          ],
        ),
      ),
    );
  }
}
