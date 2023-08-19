import 'package:get/get.dart';

class Validators {
  static String? checkFieldEmpty(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? checkPinField(String? fieldContent) {
    fieldContent!.trim();
    if (fieldContent.isEmpty) {
      return 'This field is required';
    } else if (fieldContent.length < 4) {
      return 'Invalid pin';
    }

    return null;
  }

  static String? checkConfirmPin(String? oldPin, String? fieldContent) {
    var checkPin = checkPinField(fieldContent);
    if (checkPin != null) {
      return checkPin;
    }

    if (oldPin != fieldContent!) {
      return "Pin does not match";
    }
    return null;
  }

  static String? checkPasswordField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (fieldContent.length < 6) {
      return 'The password should be at least 6 digits';
    }
    return null;
  }

  static String? checkEmailField(String? fieldContent) {
    if (fieldContent!.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isEmail(fieldContent)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? checkConfirmPassword({String? password, String? fieldContent}) {
    var checkPassword = checkPasswordField(fieldContent);
    if (checkPassword != null) {
      return checkPassword;
    }

    if (password != fieldContent!) {
      return "Password does not match";
    }
    return null;
  }
}
