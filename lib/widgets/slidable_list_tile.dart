import 'package:bimir_lock/widgets/pin_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SlidableListTile extends StatelessWidget {
  const SlidableListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Slidable(
        useTextDirection: true,
        key: UniqueKey(),
        startActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (val) {},
              backgroundColor: theme.colorScheme.onSurfaceVariant,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        endActionPane: ActionPane(
          dismissible: DismissiblePane(
            onDismissed: () {},
          ),
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15),
              onPressed: (val) {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Do you want to delete?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel',
                                style: TextStyle(
                                    // color: AppColor.secondaryTextColor,
                                    )),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('OK',
                                style: TextStyle(
                                    // color: Colors.red,
                                    )),
                          ),
                        ],
                      );
                    });
              },
              backgroundColor: theme.colorScheme.error,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 10,
          semanticContainer: false,
          surfaceTintColor: theme.colorScheme.surfaceTint,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            tileColor: theme.colorScheme.surfaceVariant,
            leading: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            title: const Text(
              "Facebook",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: const Text(
              "bim**",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            isThreeLine: false,
            contentPadding: const EdgeInsets.only(right: 10),
            trailing: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return PinInputMenuDialog(
                            onConfirm: (pin) {
                              print(pin);
                            },
                          );
                        });
                  },
                  icon: const Icon(
                    Icons.password_rounded,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 2,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.fingerprint,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
