import 'package:bimir_lock/utils/validators.dart';
import 'package:bimir_lock/widgets/access_pin.dart';
import 'package:flutter/material.dart';

class ChangeAccessPinPage extends StatelessWidget {
  ChangeAccessPinPage({super.key});
  final accessPinController = TextEditingController();
  final reAccessPinController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
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
            "Set Access Pin",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Enter your access pin:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AccessPinWidget(
                            pinController: accessPinController,
                            validator: Validators.checkPinField,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text(
                            "Re-Enter your access pin:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          AccessPinWidget(
                              pinController: reAccessPinController,
                              onCompleted: (p0) {},
                              validator: (value) =>
                                  Validators.checkConfirmPin(accessPinController.text, value)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                FloatingActionButton.extended(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print("form is nice");
                      }
                    },
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
        ));
  }
}
