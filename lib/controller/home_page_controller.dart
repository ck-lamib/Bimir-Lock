import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  DataBaseHelper dbHelper = DataBaseHelper();
  RxList<PasswordTable>? passwords = RxList();
  @override
  void onInit() {
    loadPasswords();
    super.onInit();
  }

  loadPasswords() async {
    passwords?.value = await dbHelper.getAllPassword();
    print(passwords);
  }
}
