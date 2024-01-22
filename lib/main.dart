import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/utils/pages.dart';
import 'package:bimir_lock/views/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BimirLock());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class BimirLock extends StatelessWidget {
  BimirLock({super.key});
  final CoreController cc = Get.put(CoreController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MaterialApp(
        navigatorKey: navigatorKey,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: cc.themeMode.value,
        // routes: routes,
        initialRoute: SplashPage.routeName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generatedRoute,
      ),
    );
  }
}
