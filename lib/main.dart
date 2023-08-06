import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/utils/helper/storage_helper.dart';
import 'package:bimir_lock/utils/pages.dart';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BimirLock());
}

class BimirLock extends StatelessWidget {
  const BimirLock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
