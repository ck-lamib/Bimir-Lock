import 'package:bimir_lock/models/quote_model.dart';
import 'package:bimir_lock/utils/helper/db_helper.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class CoreController extends GetxController {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  StorageHelper storageHelper = StorageHelper();
  Rx<Quote?> initialQuote = Quote().obs;
  Rx<User?> currentUser = Rxn<User>();

  @override
  void onInit() async {
    loadCurrentUser();
    await dataBaseHelper.getDatabase;
    loadInitQuote();
    super.onInit();
  }

  loadCurrentUser() async {
    currentUser.value = await storageHelper.getUser();
  }

  Future loadInitQuote() async {
    initialQuote.value = await dataBaseHelper.getinitialQuotes();
    return initialQuote.value ??
        Quote(quote: "The body achieves what the mind believes.", author: "Erin Gray");
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
