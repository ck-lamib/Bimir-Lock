import 'dart:async';

import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  TextEditingController searchEditingController = TextEditingController();
  DataBaseHelper dbHelper = DataBaseHelper();
  RxList<PasswordTable>? passwords = RxList();
  RxList<PasswordTable> searchedPasswords = RxList();

  final RxBool _isLoading = false.obs;
  bool get loading => _isLoading.value;

  Timer? debounce;
  final RxString _searchedValue = "".obs;
  String get searchedValue => _searchedValue.value;
  @override
  void onInit() {
    loadPasswords();
    super.onInit();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  Future loadPasswords() async {
    _isLoading.value = true;
    passwords?.value = await dbHelper.getAllPassword();
    _isLoading.value = false;
  }

  searchPassword(String value) {
    _searchedValue.value = value.toLowerCase();
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 500), () {
      //after 0.5 s
      //search password by email/ link name
      if (_searchedValue.value.isEmpty) {
        loadPasswords();
        searchedPasswords.value = [];
      } else {
        searchedPasswords.value = [];
        List<PasswordTable> allSearchedPasswords = [];
        if (passwords != null) {
          for (PasswordTable each in passwords!) {
            print(each.userName);
            print(each.email);
            print(each.title);
            if (each.email != null && each.email!.toLowerCase().contains(_searchedValue.value)) {
              // searchedPasswords.add(each);
              allSearchedPasswords.add(each);
            }
            if (each.userName != null &&
                each.userName!.toLowerCase().contains(_searchedValue.value)) {
              // searchedPasswords.add(each);
              allSearchedPasswords.add(each);
            }
            if (each.title != null && each.title!.toLowerCase().contains(_searchedValue.value)) {
              // searchedPasswords.add(each);
              allSearchedPasswords.add(each);
            }
          }
        }
        searchedPasswords.value = allSearchedPasswords.toSet().toList();
        print(searchedPasswords.length);

        // print(searchedPasswords);
      }
    });
  }

  deletePassword() {}
}
