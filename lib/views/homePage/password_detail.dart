import 'package:bimir_lock/models/password_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom/custom_text_field.dart';

//this class require argument
class PasswordDetailPage extends StatefulWidget {
  static const String routeName = "/passwordDetailPage";
  const PasswordDetailPage({
    super.key,
  });

  @override
  State<PasswordDetailPage> createState() => _PasswordDetailPageState();
}

class _PasswordDetailPageState extends State<PasswordDetailPage> {
  RxBool isEdit = false.obs;
  PasswordDetailPageArgument? _passwordDetailPageArgument;
  @override
  void initState() {
    // _passwordDetailPageArgument =
    //     ModalRoute.of(context)!.settings.arguments as PasswordDetailPageArgument;
    // editPage.value = _passwordDetailPageArgument!.isEdit;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              highlightColor: Colors.transparent,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: theme.colorScheme.onSurfaceVariant,
                size: 30,
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          title: const Text(
            "Media link",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              splashRadius: 0,
              // shadowColor: AppColor.tertiaryTextColor,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
              position: PopupMenuPosition.under,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              constraints: const BoxConstraints(minWidth: 119, minHeight: 123),
              onSelected: (value) {
                if (value == "Edit") {
                  // c.onEditTap();
                } else if (value == "Delete") {
                  // c.onDeletetap();
                }
              },
              offset: const Offset(-20, 0),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "Edit",
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: "Delete",
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Delete",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: theme.colorScheme.error,
                        ),
                      )
                    ],
                  ),
                ),
              ],
              child: const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(
                  Icons.more_vert_rounded,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    elevation: 10,
                    semanticContainer: false,
                    surfaceTintColor: theme.colorScheme.surfaceTint,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Media title",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          BimirLockTextField(
                            label: "Media Title",
                            controller: TextEditingController(text: "Facebook"),
                            readOnly: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          BimirLockTextField(
                            label: "Email",
                            controller: TextEditingController(text: "bimal@gmail.com"),
                            readOnly: true,
                            hasCopy: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          BimirLockTextField(
                            label: "User Name",
                            controller: TextEditingController(text: "Bimal"),
                            readOnly: true,
                            hasCopy: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          BimirLockTextField(
                            label: "Password",
                            controller: TextEditingController(text: "Facebook"),
                            readOnly: true,
                            hasCopy: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  FloatingActionButton.extended(
                      key: UniqueKey(),
                      onPressed: () {},
                      label: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        // floatingActionButton: FloatingActionButton.extended(onPressed: () {}, label: Text("Save")),
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class PasswordDetailPageArgument {
  PasswordDetailPageArgument({
    required this.passwordTable,
    required this.isEdit,
  });
  final PasswordTable passwordTable;
  final bool isEdit;
}
