import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  var data = '';

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
                const Text('Page One'),
                ElevatedButton(
                  onPressed: () async {
                    // With the AppBar we have a second way of returning
                    // to page one, which will return Null. Deal with it
                    // by adding '?' to the return type below
                    var returnValue = await Navigator.of(context)
                        .pushNamed('/page-two') as String?; // Added ?

                    setState(() {
                      // Add nullish operator to deal with the possible
                      // Null value that could be returned
                      data = returnValue ?? 'NO DATA';
                    });
                  },
                  child: const Text('Goto Page 2'),
                ),
                data.isNotEmpty
                    ? Text('Received $data')
                    : const Text('Awaiting data'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
