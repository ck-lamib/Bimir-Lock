import 'package:bimir_lock/controller/homePage/home_page_controller.dart';
import 'package:bimir_lock/main.dart';
import 'package:bimir_lock/views/homePage/add_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/bimir_lock_drawer.dart';
import '../../widgets/custom/custom_text_field.dart';
import '../../widgets/slidable_list_tile.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";
  HomePage({
    super.key,
  });
  final HomePageController c = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
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
                child: const ClipOval(
                  child: Icon(
                    Icons.person,
                    size: 30,
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
              const BimirLockTextField(
                prefixIcon: Icon(Icons.search),
                label: "Search",
                hint: "Facebook",
              ),
              const SizedBox(
                height: 30,
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await c.loadPasswords();
                  },
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return const SlidableListTile();
                    },
                  ),
                ),
              )

              // tile
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            navigatorKey.currentState!.pushNamed(AddPasswordPage.routeName);
          },
          icon: const Icon(Icons.add),
          label: const Text("Add password"),
          backgroundColor: theme.colorScheme.onInverseSurface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        drawer: const BimirLockDrawer(),
      ),
    );
  }
}
