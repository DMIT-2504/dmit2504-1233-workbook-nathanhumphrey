import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation App'),
        backgroundColor: Colors.red.shade200,
      ),
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
                // DEMONSTRATE CUSTOM STYLING
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.error,
                    ),
                    minimumSize: const MaterialStatePropertyAll(
                      Size(
                        52.0,
                        64.0,
                      ),
                    ),
                    elevation: const MaterialStatePropertyAll(4.0),
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
