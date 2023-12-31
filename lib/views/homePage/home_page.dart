import 'dart:io';

import 'package:bimir_lock/controller/homePage/home_page_controller.dart';
import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/main.dart';
import 'package:bimir_lock/views/homePage/add_password.dart';
import 'package:bimir_lock/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/bimir_lock_drawer.dart';
import '../../widgets/custom/custom_text_field.dart';
import '../../widgets/slidable_list_tile.dart';
import '../user/add_user_detail.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";
  HomePage({
    super.key,
  });
  final HomePageController c = Get.put(HomePageController());
  final CoreController cc = Get.find<CoreController>();

  @override
  Widget build(BuildContext context) {
    print(cc.currentUser.value?.userAvatar);
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.menu_rounded,
                  color: theme.colorScheme.onSurfaceVariant,
                  size: 30,
                ),
              );
            }),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: theme.colorScheme.onInverseSurface,
                ),
                child: ClipOval(
                  child: cc.currentUser.value?.userAvatar == null
                      ? const Icon(
                          Icons.person,
                          size: 30,
                        )
                      : GestureDetector(
                          onTap: () {
                            navigatorKey.currentState!.pushNamed(
                                AddUserDetailPage.routeName,
                                arguments: true);
                          },
                          child: Image.file(
                            File(
                              cc.currentUser.value!.userAvatar!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
          ],

          //drawr
          //profile pic
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              BimirLockTextField(
                prefixIcon: const Icon(Icons.search),
                controller: c.searchEditingController,
                label: "Search",
                hint: "Facebook || name || email",
                onValueChange: (value) {
                  return c.searchPassword(value);
                },
              ),
              const SizedBox(
                height: 30,
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    FocusManager.instance.primaryFocus!.unfocus();
                    await c.loadPasswords();
                    c.searchEditingController.clear();
                    c.searchPassword("");
                  },
                  child: Obx(() => c.loading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : c.searchedValue.isNotEmpty
                          ? c.searchedPasswords.isNotEmpty
                              ? ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemCount: c.searchedPasswords.length + 1,
                                  itemBuilder: (context, index) {
                                    print(c.searchedPasswords.length);
                                    if (c.searchedPasswords.length == index) {
                                      print("uess");
                                      return Column(
                                        children: [
                                          SlidableListTile(
                                            passwordTable:
                                                c.searchedPasswords[index],
                                          ),
                                          SizedBox(
                                            height: 100,
                                          ),
                                        ],
                                      );
                                    }

                                    return SlidableListTile(
                                      passwordTable: c.searchedPasswords[index],
                                    );
                                  },
                                )
                              : const EmptyState(
                                  description:
                                      "Password you are searching cannot be found.\nPlease add passwords")
                          : c.passwords!.isEmpty
                              ? const EmptyState(
                                  description:
                                      "Password cannot be found.\nPlease add passwords")
                              : ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  shrinkWrap: false,
                                  itemCount: c.passwords!.length,
                                  itemBuilder: (context, index) {
                                    return SlidableListTile(
                                      passwordTable: c.passwords![index],
                                    );
                                  },
                                )),
                ),
              ),
              // tile
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "addPasswordButton",
          onPressed: () {
            navigatorKey.currentState!.pushNamed(AddPasswordPage.routeName);
          },
          icon: const Icon(Icons.add),
          label: const Text("Add password"),
          backgroundColor: theme.colorScheme.onInverseSurface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        drawer: BimirLockDrawer(),
      ),
    );
  }
}
