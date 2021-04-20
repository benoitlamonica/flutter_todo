import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class ToDo {
  static final dbName = 'tododb2.db';
  static final dbVersion = 1;
  static final tableName = "todo";
  static final columnId = "id";
  static final columnContent = "content";
  static final columnDone = "is_done";

  ToDo._privateConstructor();
  static final ToDo instance = ToDo._privateConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initiateDatabase();
    }
    // Directory directory = await getApplicationDocumentsDirectory();
    // String path = join(directory.path, dbName);
    //deleteDatabase(path);
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      
      CREATE TABLE $tableName 
      (
        $columnId integer primary key not null,
        $columnContent text not null,
        $columnDone bool not null default 0
      )

    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(tableName, orderBy: 'id desc');
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db
        .update(tableName, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
