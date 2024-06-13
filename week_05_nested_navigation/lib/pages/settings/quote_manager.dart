import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'quote.dart';

class QuoteManager {
  // private constructor
  const QuoteManager._();

  static const _databaseName = 'quotes.db';
  static const _databaseVersion = 1;
  static const QuoteManager instance = QuoteManager._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE quotes (id INTEGER PRIMARY KEY, text TEXT, author TEXT)');
      },
      version: _databaseVersion,
    );

    return database;
  }

  // Create our CRUD
  Future<List<Quote>> getQuotes() async {
    final db = await database;

    final maps = await db.query(
      'quotes',
      orderBy: 'author',
    );

    return List.generate(maps.length, (index) => Quote.fromMap(maps[index]));
  }

  Future<int> addQuote(Quote quote) async {
    final db = await database;

    final map = <String, dynamic>{};
    map['text'] = quote.text;
    map['author'] = quote.author;

    final id = await db.insert('quotes', map);

    return id;
  }

  // TODO: get a quote by id, update a quote, delete a quote
}
