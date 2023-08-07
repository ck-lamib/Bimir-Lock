import 'dart:io';

import 'package:bimir_lock/features/introductionPage/data/model/user_model.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddUserDetailController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? userAvatar;
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

  onSaveUserDetail() async {
    FocusManager.instance.primaryFocus!.unfocus();
    if (userAvatar == null) return Fluttertoast.showToast(msg: "Upload Profile Image to save user");
    if (formKey.currentState!.validate()) {
      String imagePath = await StorageHelper().storeImage(userAvatar!);
      User userModel = User(
        dob: dobController.text,
        userName: userNameController.text,
        userAvatar: imagePath,
      );
      await StorageHelper().setUser(userModel);
      //load quotes
      //save user
      //load initial quote
    }
  }
}
