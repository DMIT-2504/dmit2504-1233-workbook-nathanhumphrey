import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Page Two'),
                ElevatedButton(
                  onPressed: () => {Navigator.of(context).pop('From Page 2')},
                  child: const Text('Goto Page 1'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
