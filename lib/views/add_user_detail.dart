import 'package:flutter/material.dart';

import '../widgets/custom/custom_text_field.dart';

class AddUserDetailPage extends StatelessWidget {
  const AddUserDetailPage({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // c.showImagePicker(context);
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(100.0),
                        child: ClipOval(
                          child:
                              // Obx(
                              //   () => c.imageFile.value != null
                              //       ?
                              Container(
                            color: theme.colorScheme.surfaceVariant,

                            height: 122,
                            width: 122,
                            child: FittedBox(
                              child: Icon(
                                Icons.person_rounded,
                                color: theme.colorScheme.background,
                              ),
                            ),
                            // Image.file(
                            //   c.imageFile.value!,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
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
                    ),
                    Positioned(
                      bottom: 5,
                      right: 13,
                      child: InkWell(
                        onTap: () {
                          // c.showImagePicker(context);
                        },
                        child: const Icon(Icons.add_a_photo_outlined),
                      ),
                    ),
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
                          controller: TextEditingController(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        BimirLockTextField(
                          label: "Date of Birth",
                          controller: TextEditingController(),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(DateTime.now().year),
                              firstDate: DateTime(DateTime.now().year - 100),
                              lastDate: DateTime(DateTime.now().year),
                            );

                            if (pickedDate != null) {
                              // log("===============>>>>$pickedDate");
                              // selectedDate.value = DateFormat('yyyy-MM-dd').format(pickedDate);
                              // dateOfBirthController.text = selectedDate.value;
                            } else {
                              // log("==============>>>>>>> Date is not selected");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.subdirectory_arrow_right_rounded),
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
    );
  }
}
