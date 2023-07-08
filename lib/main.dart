import 'package:bimir_lock/utils/app_theme.dart';
import 'package:bimir_lock/views/add_user_detail.dart';
import 'package:bimir_lock/views/password_detail.dart';
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
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: AddUserDetailPage(),
    );
  }
}
