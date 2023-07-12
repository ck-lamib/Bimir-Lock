import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/views/splash_page.dart';
import 'package:bimir_lock/views/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BimirLock());
}

class BimirLock extends StatelessWidget {
  const BimirLock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
