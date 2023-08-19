import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/utils/pages.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BimirLock());
}

class BimirLock extends StatelessWidget {
  BimirLock({super.key});
  final CoreController cc = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => MaterialApp.router(
          routerConfig: routerConfig,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: cc.themeMode.value,
          debugShowCheckedModeBanner: false,
        ));
  }
}
