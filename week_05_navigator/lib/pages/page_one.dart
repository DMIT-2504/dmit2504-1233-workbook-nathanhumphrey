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
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Page One'),
                ElevatedButton(
                  onPressed: () async {
                    var returnValue = await Navigator.of(context)
                        .pushNamed('/page-two') as String;

                    setState(() {
                      data = returnValue;
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
