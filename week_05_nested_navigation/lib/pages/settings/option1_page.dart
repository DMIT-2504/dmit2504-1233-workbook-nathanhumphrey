import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Option1Page extends StatefulWidget {
  const Option1Page({super.key});

  @override
  State<Option1Page> createState() => _Option1PageState();
}

class _Option1PageState extends State<Option1Page> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Get the shared prefs 'text', if it exists
    _initText();
    super.initState();
  }

  Future<void> _initText() async {
    // Check for existing text to load
    final prefs = await SharedPreferences.getInstance();

    // Try reading the counter value from persistent storage.
    // If not present, null is returned, so default to 0.
    final text = prefs.getString('text') ?? '';
    setState(() {
      _textController.text = text;
    });
  }

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
              onPressed: () async {
                // Load and obtain the shared preferences for this app.
                final prefs = await SharedPreferences.getInstance();
                // Save the text, if its not empty, to shared prefs
                await prefs.setString('text', _textController.text);
              },
              child: const Text('Save Text'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Load and obtain the shared preferences for this app.
                final prefs = await SharedPreferences.getInstance();
                // Remove the text, if its not empty, to shared prefs
                await prefs.remove('text');

                // Now, clear the text controller
                setState(() {
                  _textController.clear();
                });
              },
              child: const Text('Remove Text'),
            ),
          ],
        ),
      ),
    );
  }
}
