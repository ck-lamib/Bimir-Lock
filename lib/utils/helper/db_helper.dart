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

  _onCreate(Database db, int version) async {
    await db.execute('''
      create table ${DbConstant.passwordTableName} ( 
        ${DbConstant.id} integer primary key autoincrement, 
        ${DbConstant.title} text,
        ${DbConstant.userName} text,
        ${DbConstant.email} text,
        ${DbConstant.password} text)
      ''');

    await db.execute('''
      create table ${DbConstant.quoteTableName} ( 
        ${DbConstant.id} integer primary key autoincrement, 
        ${DbConstant.quote} text,
        ${DbConstant.author} text)
      ''');
    await db.execute('''
      create table ${DbConstant.quoteCategoryTableName} ( 
        ${DbConstant.id} integer primary key autoincrement, 
        ${DbConstant.quoteCategory} text)
      ''');
  }

//for password
  insertPassword(PasswordTable data) async {
    try {
      final db = await getDatabase;
      await db
          .insert(
            DbConstant.passwordTableName,
            data.toJson(),
          )
          .then((value) => print(value));
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  deletePassword(PasswordTable data) async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.passwordTableName,
        where: '${DbConstant.id} = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while deleting single password: $e");
    }
  }

  deleteAllPassword() async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.passwordTableName,
      );
    } catch (e) {
      log("===============>>> Error while deleting all password: $e");
    }
  }

  Future<List<PasswordTable>> getAllPassword() async {
    try {
      final db = await getDatabase;

      List<Map<String, Object?>> passwords = await db.query(
        DbConstant.passwordTableName,
      );
      return passwordfromJson(passwords);
    } catch (e) {
      log("===============>>> Error while reading all password: $e");
      return [];
    }
  }

  updatePassword(PasswordTable data) async {
    try {
      final db = await getDatabase;

      await db.update(
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
  insertQuote(Quote data) async {
    try {
      final db = await getDatabase;
      await db.insert(
        DbConstant.quoteTableName,
        data.toJson(),
      );
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  deleteQuote(Quote data) async {
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

  deleteAllQuotes() async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.quoteTableName,
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
      if (values.isNotEmpty) {
        math.Random random = math.Random();
        int randomIndex = random.nextInt(values.length);
        return Quote.fromJson(values[randomIndex]);
      } else {
        return Quote(quote: "The body achieves what the mind believes.", author: "Erin Gray");
      }
    } catch (e) {
      log("===============>>> Error while reading all quote: $e");
      return null;
    }
  }

  Future<List<Map<String, Object?>>> getAllQuotes() async {
    try {
      final db = await getDatabase;

      return await db.query(
        DbConstant.quoteTableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all quote: $e");
      return [];
    }
  }

  updateQuote(Quote data) async {
    try {
      final db = await getDatabase;

      await db.update(
        DbConstant.quoteTableName,
        data.toJson(),
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while updating: $e");
    }
  }

  //for quotes category
  insertQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;

      await db
          .insert(
        DbConstant.quoteCategoryTableName,
        data.toJson(),
      )
          .then((value) {
        print(value);
      });
    } catch (e) {
      log("===============>>> Error while inserting: $e");
    }
  }

  deleteQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.quoteCategoryTableName,
        where: 'id = ?',
        whereArgs: [data.id],
      );
    } catch (e) {
      log("===============>>> Error while deleting quote cat: $e");
    }
  }

  deleteAllQuoteCategory() async {
    try {
      final db = await getDatabase;

      await db.delete(
        DbConstant.quoteCategoryTableName,
      );
    } catch (e) {
      log("===============>>> Error while deleting quote cat: $e");
    }
  }

  getAllQuotesCategory() async {
    try {
      final db = await getDatabase;

      await db.query(
        DbConstant.quoteCategoryTableName,
      );
    } catch (e) {
      log("===============>>> Error while reading all quote cat: $e");
    }
  }

  updateQuoteCategory(QuoteCategory data) async {
    try {
      final db = await getDatabase;

      await db.update(
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
