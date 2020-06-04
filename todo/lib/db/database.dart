import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/todo_model.dart';

class DatabaseProvider {
  static Database _database;

  static Future<Database> provide() async {
    _database ??= await initDatabase();
    return _database;
  }

  static initDatabase() async {
    String path = join(await getDatabasesPath(), 'todo.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE Todo(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        content TEXT,
        due_date TEXT
      )
      ''');
    });
  }
}

Future insertTodo(TodoModel todo) async {
  Database database = await DatabaseProvider.provide();
  await database.insert('Todo', todo.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
}
