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
}
