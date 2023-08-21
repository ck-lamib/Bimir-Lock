import 'package:bimir_lock/utils/validators.dart';
import 'package:bimir_lock/widgets/access_pin.dart';
import 'package:flutter/material.dart';

class PinInputMenuDialog extends StatelessWidget {
  final Function(String password) onConfirm;

  final TextEditingController textController = TextEditingController();
  PinInputMenuDialog({
    super.key,
    required this.onConfirm,
    this.message,
  });
  final String? message;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(50),
              color: theme.colorScheme.surfaceVariant,
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  color: const Color(0xFF000000).withOpacity(0.4),
                  spreadRadius: 80,
                  offset: const Offset(0, 40),
                ),
                BoxShadow(
                  blurRadius: 50,
                  color: const Color(0xFF000000).withOpacity(0.4),
                  spreadRadius: 80,
                  offset: const Offset(0, 40),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.close,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    message ??
                        "The password you are trying to access is protected with a pin. Please enter the pin to proceed.",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        AccessPinWidget(
                          pinController: textController,
                          validator: Validators.checkPinField,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          onConfirm(textController.text);
                        }
                      },
                      child: const Text("Check Pin")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
