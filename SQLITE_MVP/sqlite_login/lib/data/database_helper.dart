import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();  

  initDb() async {

    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'main.db');

    var ourDb =  await openDatabase(path,version: 1,oncreate: _onCreate);
      
  }
}
