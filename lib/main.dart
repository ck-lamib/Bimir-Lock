import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/views/passwordDetail/password_detail.dart';
import 'package:flutter/material.dart';

import 'views/HomePage/home_page.dart';

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
      home: PasswordDetailPage(),
    );
  }
}
