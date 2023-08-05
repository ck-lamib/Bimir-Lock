import 'package:flutter/material.dart';

Future<dynamic> showCustomDialog({required BuildContext context, required Widget content}) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    enableDrag: true,
    elevation: 0,
    isScrollControlled: true,
    clipBehavior: Clip.hardEdge,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: content,
          );
        },
      );
    },
  );
}
