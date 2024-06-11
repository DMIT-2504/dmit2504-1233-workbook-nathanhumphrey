import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Option2Page extends StatefulWidget {
  const Option2Page({super.key});

  @override
  State<Option2Page> createState() => _Option2PageState();
}

class _Option2PageState extends State<Option2Page> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Get the file's 'text', if it exists
    _initText();
    super.initState();
  }

  Future<void> _initText() async {
    final file = await _localFile;
    var contents = '';

    // Read the file, if it exists
    if (file.existsSync()) {
      contents = await file.readAsString();
    }

    setState(() {
      _textController.text = contents;
    });
  }

  Future<File> get _localFile async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return File('$path/read-write-demo.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Option 2 - Read/Write File'),
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: TextField(
                maxLines: 5,
                minLines: 3,
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Some Text',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final file = await _localFile;

                // Write to the file
                await file.writeAsString(_textController.text);

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Save to file'),
                  ));
                }
              },
              child: const Text('Save File'),
            ),
            ElevatedButton(
              onPressed: () async {
                final file = await _localFile;

                // Delete the file
                await file.delete();

                // Now, clear the text controller
                setState(() {
                  _textController.clear();
                });

                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Deleted file'),
                  ));
                }
              },
              child: const Text('Delete File'),
            ),
          ],
        ),
      ),
    );
  }
}
