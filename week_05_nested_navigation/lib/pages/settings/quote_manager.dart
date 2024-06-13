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
}
