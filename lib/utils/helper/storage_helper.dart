import 'dart:convert';
import 'dart:developer';

import 'package:bimir_lock/features/introductionPage/data/model/user_model.dart';
import 'package:bimir_lock/utils/helper/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      await prefs.setString(StorageKey.user, jsonEncode(user));
    } catch (e) {
      log("=================>>>>>> Error while setting user: $e");
      return false;
    }
  }

  getUser() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return jsonDecode(prefs.getString(StorageKey.user)!);
    } catch (e) {
      log("=================>>>>>> Error while getting user: $e");
    }
  }

  Future<bool> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
