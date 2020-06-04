import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static Database _database;

  static Future<Database> provider() async {
    _database ??= await initDatabase();
    return _database;
  }

  static initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE Todo(
        id INTEGER PRIMARY KEY,
        content TEXT,
        due_date TEXT
      )
      ''');
    });
  }
}
