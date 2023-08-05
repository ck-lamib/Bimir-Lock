import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class AddUserDetailController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
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

  onSaveUserDetail() {}
}
