import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:bimir_lock/features/introductionPage/data/model/user_model.dart';
import 'package:bimir_lock/utils/extensions.dart';
import 'package:bimir_lock/utils/helper/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class StorageHelper {
  // static SharedPreferences? _sharedPreferences;

  // Future<SharedPreferences> get sharedPreferences async {
  //   if (_sharedPreferences != null) {
  //     return _sharedPreferences!;
  //   }
  //   _sharedPreferences = await SharedPreferences.getInstance();
  //   return _sharedPreferences!;
  // }

  setUser(User user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs
          .setString(StorageKey.user, jsonEncode(user))
          .then((value) => log("=======>>> user added"));
    } catch (e) {
      log("=================>>>>>> Error while setting user: $e");
    }
  }

  getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return User.fromJson(await jsonDecode(prefs.getString(StorageKey.user)!));
    } catch (e) {
      log("=================>>>>>> Error while getting user: $e");
      return null;
    }
  }

  Future<bool> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<String> getImageLocation() async {
    String imageDir = await getDatabasesPath();
    String newImagePath = "$imageDir/imageFolder";
    bool isDirExist = await Directory(newImagePath).exists();
    if (!isDirExist) await Directory(newImagePath).create();
    return newImagePath;
  }

  Future<String> storeImage(File file) async {
    var newPath = await file.getNewDbFilePath();
    File newFile = await file.copy(newPath);
    return newFile.path;
  }
}
