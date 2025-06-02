

import 'package:module_5_assign/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class dbHelper {
  static final dbHelper _instance = dbHelper.internal();
  static Database? _database;

  factory dbHelper() {
    return _instance;
  }

  dbHelper.internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'perform.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        desc TEXT,
        date TEXT,
        time TEXT,
        priority INTEGER,
        isCompleted INTEGER
      )
    ''');
  }

  Future<int> insert(Perform p) async {
    Database db = await database;
    return await db.insert('tasks', p.toMap());
  }

  Future<int> delete(int id) async {
    Database db = await database;
    return await db.delete(
      'task',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Perform>> get() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('task');
    return List.generate(maps.length, (i) {
      return Perform.fromMap(maps[i]);
    });
  }

  Future<int> update(Perform p) async {
    Database db = await database;
    return await db.update(
      'task',
      p.toMap(),
      where: 'id = ?',
      whereArgs: [p.id],
    );
  }

}
















