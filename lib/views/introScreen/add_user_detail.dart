import 'dart:developer';

import 'package:bimir_lock/utils/extensions.dart';
import 'package:bimir_lock/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../widgets/custom/custom_text_field.dart';
import '../../controller/introScreen/add_user_controller.dart';
import '../../widgets/custom/custom_dialogues.dart';

class AddUserDetailPage extends StatelessWidget {
  static const String routeName = "/addUserDetail";
  final c = AddUserDetailController();
  AddUserDetailPage({super.key});

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
            "Add User Detail",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(100.0),
                        child: ClipOval(
                          child: GetBuilder<AddUserDetailController>(
                              init: c,
                              builder: (controller) {
                                return Container(
                                  color: theme.colorScheme.surfaceVariant,
                                  height: 122,
                                  width: 122,
                                  child: c.userAvatar == null
                                      ? FittedBox(
                                          child: Icon(
                                            Icons.person_rounded,
                                            color: theme.colorScheme.background,
                                          ),
                                        )
                                      : Image.file(
                                          c.userAvatar!,
                                          fit: BoxFit.cover,
                                        ),
                                );
                              }),
                          // : CachedNetworkImage(
                          //     height: 122,
                          //     width: 122,
                          //     errorWidget: (context, url, error) =>
                          //         Image.asset(ImagePath.defaultAvatar),
                          //     placeholder: (context, url) =>
                          //         Image.asset(ImagePath.defaultAvatar),
                          //     imageUrl: c.initialImageUrl,
                          //     fit: BoxFit.cover,
                          //   ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          child: Card(
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(360),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add_a_photo_outlined,
                              ),
                              onPressed: () {
                                showCustomDialog(
                                  context: context,
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const ListTile(
                                        title: Text("Choose image source",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      ListTile(
                                        title: const Text("Camera"),
                                        trailing: const Icon(Icons.chevron_right),
                                        onTap: () async {
                                          await c.pickImage(ImageSource.camera);
                                          if (context.mounted) Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        title: const Text("Gallery"),
                                        trailing: const Icon(Icons.chevron_right),
                                        onTap: () async {
                                          await c.pickImage(ImageSource.gallery);
                                          if (context.mounted) Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0),
                    ),
                    elevation: 10,
                    semanticContainer: false,
                    surfaceTintColor: theme.colorScheme.surfaceTint,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: c.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "User Detail",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BimirLockTextField(
                              label: "User Name",
                              controller: c.userNameController,
                              textInputAction: TextInputAction.next,
                              validator: Validators.checkFieldEmpty,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            BimirLockTextField(
                              label: "Date of Birth",
                              controller: c.dobController,
                              textInputAction: TextInputAction.done,
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(DateTime.now().year),
                                  firstDate: DateTime(DateTime.now().year - 100),
                                  lastDate: DateTime(DateTime.now().year),
                                );
                                if (pickedDate != null) {
                                  c.dobController.text = pickedDate.formatDate();
                                  FocusManager.instance.primaryFocus?.unfocus();
                                } else {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  log("==============>>>>>>> Date is not selected");
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => c.isLoading.value
                        ? const FloatingActionButton.extended(
                            onPressed: null,
                            label: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : FloatingActionButton.extended(
                            onPressed: () => c.onSaveUserDetail(context),
                            icon: const Icon(Icons.subdirectory_arrow_right_rounded),
                            label: const Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
