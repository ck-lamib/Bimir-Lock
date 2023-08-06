import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';
import 'package:get/get.dart';

import '../features/introductionPage/data/model/user_model.dart';

class CoreController extends GetxController {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  StorageHelper storageHelper = StorageHelper();
  Rx<User?> currentUser = Rxn<User>();

  @override
  void onInit() async {
    loadCurrentUser();
    await dataBaseHelper.getDatabase;
    super.onInit();
  }

  void loadCurrentUser() async {
    currentUser.value = storageHelper.getUser();
  }

  bool isUserLoggedIn() {
    return currentUser.value != null;
  }

  void logOut() async {
    await dataBaseHelper.deleteAllPassword();
    await storageHelper.removeUser();
    loadCurrentUser();
    // route to intro page
  }
}
