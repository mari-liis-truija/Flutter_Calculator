import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_HISTORY = "history";
  static const String COLUMN_ID = "id";
  static const String COLUMN_EXPRESSION = "expression";
  static const String COLUMN_RESULT = "result";

  static Future<Database> open() async {
    return openDatabase(
      join(await getDatabasesPath(), 'history_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $TABLE_HISTORY($COLUMN_ID INTEGER PRIMARY KEY, $COLUMN_EXPRESSION TEXT, $COLUMN_RESULT TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertHistory(Map<String, dynamic> history) async {
    final Database db = await open();
    await db.insert(
      TABLE_HISTORY,
      history,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getHistory() async {
    final Database db = await open();
    return db.query(TABLE_HISTORY, orderBy: "$COLUMN_ID DESC");
  }
}
