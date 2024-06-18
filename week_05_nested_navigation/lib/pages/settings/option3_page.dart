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
                  if (_quote == null) {
                    // Add quote
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

                    success = 'Added quote $id';
                  } else {
                    // Edit a quote
                    q = _quote!;

                    q.author = _authorController.text;
                    q.text = _textController.text;

                    await QuoteManager.instance.updateQuote(q);

                    setState(() {
                      _quote = null;
                      _authorController.text = '';
                      _textController.text = '';
                    });

                    success = 'Updated quote ${q.id}';
                  }

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(success),
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
              child: Text('${_quote == null ? 'Add' : 'Edit'} Quote'),
            ),
            ElevatedButton(
              onPressed: _quote != null
                  ? () async {
                      // TODO: implement the delete for a quote
                      if (context.mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Quote Deleted'),
                        ));
                      }
                    }
                  : null,
              child: const Text('Delete Quote'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            _quotes.isEmpty
                ? const Text('No quotes to display')
                : Expanded(
                    child: Column(
                    children: [
                      const Text('Quotes'),
                      Expanded(
                        child: ListView.builder(
                            itemCount: _quotes.length,
                            itemBuilder: (BuildContext context, int index) {
                              final quote = _quotes[index];

                              return ListTile(
                                title: Text(quote.toString()),
                                onTap: () {
                                  setState(() {
                                    _quote = quote;
                                    _authorController.text = quote.author;
                                    _textController.text = quote.text;
                                  });
                                },
                              );
                            }),
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
