import 'package:flutter/material.dart';
import 'package:week_05_nested_navigation/pages/settings/quote.dart';
import 'package:week_05_nested_navigation/pages/settings/quote_manager.dart';

class Option3Page extends StatefulWidget {
  const Option3Page({super.key});

  @override
  State<Option3Page> createState() => _Option3PageState();
}

class _Option3PageState extends State<Option3Page> {
  final _textController = TextEditingController();
  final _authorController = TextEditingController();
  Quote? _quote;
  var _quotes = <Quote>[];

  @override
  void dispose() {
    _textController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textController.text = '';
    _authorController.text = '';

    // Get all quotes
    try {
      QuoteManager.instance.getQuotes().then((quotes) {
        setState(() {
          _quotes = quotes;
        });
        print(quotes.length);
      });
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Option 3 - Work SQLite a DB'),
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
                  labelText: 'Quote Text',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: TextField(
                controller: _authorController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Quote Author',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var success = '';
                Quote q;

                // Add/edit the quote to/in the db
                try {
                  q = Quote(
                      author: _authorController.text,
                      text: _textController.text);

                  final id = await QuoteManager.instance.addQuote(q);

                  q.id = id;

                  setState(() {
                    _quotes.add(q);
                    _textController.text = '';
                    _authorController.text = '';
                  });
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added quote $id to the db'),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: $e'),
                      ),
                    );
                  }
                }
              },
              child: const Text('Add Quote'),
            ),
            ElevatedButton(
              onPressed: () async {
                // TODO: implement the delete for a quote
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Quote Deleted'),
                  ));
                }
              },
              child: const Text('Delete Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
