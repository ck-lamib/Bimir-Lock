import 'dart:async';
import 'dart:developer';

import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/helper/db_constants.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Database? _db;

  Future<Database> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = "$dbPath/${DbConstant.dbName}";
    var finalDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return finalDb;
  }

  Future<Database> get getDatabase async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
create table ${DbConstant.tableName} ( 
  ${DbConstant.id} integer primary key autoincrement, 
  ${DbConstant.title} text not null,
  ${DbConstant.userName} text not null,
  ${DbConstant.email} text not null,
  ${DbConstant.password} text not null)
''');
  }

  Future<void> insertPassword(PasswordTable data) async {
    try {
      final db = await getDatabase;
      db.insert(
        DbConstant.tableName,
        data.toJson(),
      );
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  Future<void> deletePassword(PasswordTable data) async {
    try {
      final db = await getDatabase;

      db.delete(
        DbConstant.tableName,
        where: '${DbConstant.id} = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while deleting single password: $e");
    }
  }

  Future<void> deleteAllPassword() async {
    try {
      final db = await getDatabase;

      db.delete(
        DbConstant.tableName,
      );
    } catch (e) {
      log("===============>>> Error while deleting all password: $e");
    }
  }

  Future<void> getAllPassword() async {
    try {
      final db = await getDatabase;

      db.query(
        DbConstant.tableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all password: $e");
    }
  }

  Future<void> updatePassword(PasswordTable data) async {
    try {
      final db = await getDatabase;

      db.update(
        DbConstant.tableName,
        data.toJson(),
        where: '${DbConstant.id} = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while updating: $e");
    }
  }
}
