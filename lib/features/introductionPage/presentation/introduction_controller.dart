import 'package:bimir_lock/features/introductionPage/presentation/views/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroductionController {
  void onIntroEnd(BuildContext context) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const HomePage()),
    // );
    context.go(WelcomePage.routeName);
  }
}
