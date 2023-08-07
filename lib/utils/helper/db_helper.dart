import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/models/quote_category_model.dart';
import 'package:bimir_lock/models/quote_model.dart';
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
      create table ${DbConstant.passwordTableName} ( 
        ${DbConstant.id} integer primary key autoincrement, 
        ${DbConstant.title} text not null,
        ${DbConstant.userName} text not null,
        ${DbConstant.email} text not null,
        ${DbConstant.password} text not null)
      ''');

    await db.execute('''
      create table ${DbConstant.quoteTableName} ( 
        id integer primary key autoincrement, 
        quote text not null,
        author text not null)
      ''');
    await db.execute('''
      create table ${DbConstant.quoteCategoryTableName} ( 
        id integer primary key autoincrement, 
        category text not null)
      ''');
  }

//for password
  Future<void> insertPassword(PasswordTable data) async {
    try {
      final db = await getDatabase;
      db.insert(
        DbConstant.passwordTableName,
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
        DbConstant.passwordTableName,
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
        DbConstant.passwordTableName,
      );
    } catch (e) {
      log("===============>>> Error while deleting all password: $e");
    }
  }

  Future<void> getAllPassword() async {
    try {
      final db = await getDatabase;

      db.query(
        DbConstant.passwordTableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all password: $e");
    }
  }

  Future<void> updatePassword(PasswordTable data) async {
    try {
      final db = await getDatabase;

      db.update(
        DbConstant.passwordTableName,
        data.toJson(),
        where: '${DbConstant.id} = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while updating: $e");
    }
  }

  //for quotes
  Future<void> insertQuote(Quote data) async {
    try {
      final db = await getDatabase;
      db.insert(
        DbConstant.quoteTableName,
        data.toJson(),
      );
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  Future<void> deleteQuote(Quote data) async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.quoteTableName,
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while deleting quote: $e");
    }
  }

  getinitialQuotes() async {
    try {
      final db = await getDatabase;
      var values = await db.query(
        DbConstant.quoteTableName,
      );
      math.Random random = math.Random();
      int randomIndex = random.nextInt(values.length);
      return values[randomIndex];
    } catch (e) {
      log("===============>>> Error while reading all quote: $e");
      return null;
    }
  }

  Future<void> getAllQuotes() async {
    try {
      final db = await getDatabase;

      db.query(
        DbConstant.quoteTableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all quote: $e");
    }
  }

  Future<void> updateQuote(Quote data) async {
    try {
      final db = await getDatabase;

      db.update(
        DbConstant.quoteTableName,
        data.toJson(),
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while updating: $e");
    }
  }

  //for quotes
  Future<void> insertQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;
      db.insert(
        DbConstant.quoteCategoryTableName,
        data.toJson(),
      );
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  Future<void> deleteQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;

      db.delete(
        DbConstant.quoteCategoryTableName,
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while deleting quote cat: $e");
    }
  }

  Future<void> getAllQuotesCategory() async {
    try {
      final db = await getDatabase;

      db.query(
        DbConstant.quoteCategoryTableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all quote cat: $e");
    }
  }

  Future<void> updateQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;

      db.update(
        DbConstant.quoteCategoryTableName,
        data.toJson(),
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while updating: $e");
    }
  }
}
