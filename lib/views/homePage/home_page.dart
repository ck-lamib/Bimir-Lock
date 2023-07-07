import 'package:flutter/material.dart';

import '../../widgets/custom/custom_text_field.dart';
import '../../widgets/slidable_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

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
          padding: const EdgeInsets.all(24),
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
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return const SlidableListTile();
                  },
                ),
              )

              // tile
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Add password"),
          backgroundColor: theme.colorScheme.onInverseSurface,
          foregroundColor: theme.colorScheme.onSurface,
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
