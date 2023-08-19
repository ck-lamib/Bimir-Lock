import 'dart:developer';
import 'dart:io';

import 'package:bimir_lock/controller/introScreen/quotes_category_controller.dart';
import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/main.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/user_model.dart';
import '../../views/introScreen/welcome_page.dart';

class AddUserDetailController extends GetxController {
  QuotesCategoryController qcc = Get.find<QuotesCategoryController>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? userAvatar;
  RxBool isLoading = false.obs;
  Future pickImage(ImageSource source) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        userAvatar = File(pickedImage.path);
      }
      update();
    } catch (e) {
      print('======>>>Failed to pick image: $e');
    }
  }

  onSaveUserDetail(BuildContext context) async {
    CoreController cc = Get.find<CoreController>();
    FocusManager.instance.primaryFocus!.unfocus();
    if (userAvatar == null) return Fluttertoast.showToast(msg: "Upload Profile Image to save user");
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      String imagePath = await StorageHelper().storeImage(userAvatar!);
      User userModel = User(
        dob: dobController.text,
        userName: userNameController.text,
        userAvatar: imagePath,
      );
      //save user
      await StorageHelper().setUser(userModel);
      //load quotes;
      try {
        QuotesCategoryController c = Get.find<QuotesCategoryController>();
        await c.loadQuotes();
        await cc.loadCurrentUser();
      } catch (e) {
        log("========>>>>>> Error: $e");
      }
      try {
        cc.loadInitQuote().then((value) => navigatorKey.currentState!
            .pushNamedAndRemoveUntil(WelcomePage.routeName, (route) => false));
      } catch (e) {
        log("============>>>Error while loading initial quotes");
      }
    }
    isLoading.value = false;
  }
}
