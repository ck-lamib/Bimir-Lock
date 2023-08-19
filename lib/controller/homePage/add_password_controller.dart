import 'package:bimir_lock/controller/homePage/home_page_controller.dart';
import 'package:bimir_lock/main.dart';
import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPasswordController extends GetxController {
  HomePageController homePageController = Get.find<HomePageController>();
  TextEditingController mediaTitleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  // TextEditingController mediaTitleController = TextEditingController(text: "Facebook");
  // TextEditingController emailController = TextEditingController(text: "bimal@gmail.com");
  // TextEditingController userNameController = TextEditingController(text: "Bimal kc");
  // TextEditingController passwordController = TextEditingController(text: "password");
  // TextEditingController reTypePasswordController = TextEditingController(text: "password");
  RxBool hidePassword = true.obs;
  RxBool hideRetypePassword = true.obs;
  RxBool isLoading = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  togglePassword() {
    hidePassword.value = !hidePassword.value;
  }

  toggleRetypePassword() {
    hideRetypePassword.value = !hideRetypePassword.value;
  }

  onSavePassword() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      PasswordTable passwordTable = PasswordTable(
          title: mediaTitleController.text,
          email: emailController.text,
          userName: userNameController.text,
          password: passwordController.text);
      DataBaseHelper dataBaseHelper = DataBaseHelper();
      await dataBaseHelper.insertPassword(passwordTable);

      isLoading.value = false;
      homePageController.loadPasswords().whenComplete(() => navigatorKey.currentState!.pop());
    }
    isLoading.value = false;
  }
}
