import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordDetailController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DataBaseHelper dbHelper = DataBaseHelper();
  RxBool isEdit = false.obs;
  int? id;

  void onEditTap() {
    isEdit.value = true;
  }

  onCancelTap() {
    isEdit.value = false;
  }

  Future<bool> onDeleteTap(PasswordTable passwordTable) async {
    var success = await dbHelper.deletePassword(passwordTable);
    return success;
  }

  Future<bool> onSaveTap() async {
    bool success = false;
    PasswordTable passwordTable = PasswordTable(
      id: id,
      title: titleController.text,
      userName: userNameController.text,
      password: passwordController.text,
    );
    success = await dbHelper.updatePassword(passwordTable);

    return success;
  }
}
