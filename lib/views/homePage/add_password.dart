import 'package:bimir_lock/controller/homePage/add_password_controller.dart';
import 'package:bimir_lock/models/password_table.dart';
import 'package:bimir_lock/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom/custom_text_field.dart';

//this class require argument
class AddPasswordPage extends StatelessWidget {
  static const String routeName = "/addPasswordPage";
  final AddPasswordController c = Get.put(AddPasswordController());
  AddPasswordPage({
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
            "Add Password",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
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
                    child: Form(
                      key: c.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Add Password",
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
                              hint: "Facebook",
                              controller: c.mediaTitleController,
                              readOnly: false,
                              validator: Validators.checkFieldEmpty,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            BimirLockTextField(
                              label: "Email",
                              hint: "bimal@gmail.com",
                              textInputType: TextInputType.emailAddress,
                              controller: c.emailController,
                              hasCopy: true,
                              validator: Validators.checkEmailField,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            BimirLockTextField(
                              label: "User Name",
                              hint: "Bimir codes",
                              controller: c.userNameController,
                              hasCopy: true,
                              validator: Validators.checkFieldEmpty,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Obx(() => BimirLockTextField(
                                  label: "Password",
                                  controller: c.passwordController,
                                  obscure: c.hidePassword.value,
                                  hasCopy: true,
                                  isPass: true,
                                  onEyeTap: c.togglePassword,
                                  validator: Validators.checkPasswordField,
                                )),
                            const SizedBox(
                              height: 40,
                            ),
                            Obx(() => BimirLockTextField(
                                  label: "Retype Password",
                                  controller: c.reTypePasswordController,
                                  obscure: c.hideRetypePassword.value,
                                  hasCopy: true,
                                  isPass: true,
                                  onEyeTap: c.toggleRetypePassword,
                                  validator: (fieldContent) {
                                    return Validators.checkConfirmPassword(
                                        password: c.passwordController.text,
                                        fieldContent: fieldContent);
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Obx(
                    () => c.isButtonLoading.value
                        ? const FloatingActionButton.extended(
                            onPressed: null,
                            label: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : FloatingActionButton.extended(
                            onPressed: c.onSavePassword,
                            label: const Text(
                              "Save",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  )
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
    required this.addPassword,
  });
  final PasswordTable passwordTable;
  final bool isEdit;
  final bool addPassword;
}
