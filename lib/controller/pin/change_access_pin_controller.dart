import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/main.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ChangeAccessPinPageController extends GetxController {
  final TextEditingController accessPinController = TextEditingController();
  final TextEditingController reAccessPinController = TextEditingController();
  final CoreController cc = Get.find<CoreController>();
  final formKey = GlobalKey<FormState>();
  RxBool isButtonLoading = false.obs;

  onChangeAccessPinTap() async {
    if (formKey.currentState!.validate()) {
      isButtonLoading.value = true;

      StorageHelper storageHelper = StorageHelper();
      await storageHelper.setEncryptedPassword(accessPinController.text);
      isButtonLoading.value = false;
      await cc.loadEncryptedPassword().whenComplete(() {
        navigatorKey.currentState!.pop();
        Fluttertoast.showToast(msg: "Access pin set successfully");
      });
      isButtonLoading.value = false;
    }
  }
}
