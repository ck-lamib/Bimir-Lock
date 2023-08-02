import 'package:bimir_lock/features/introductionPage/presentation/views/introduction_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashController {
  onInit(BuildContext context) {
    //check wheter is already logged in or not.
    //load user
    Future.delayed(const Duration(seconds: 3), () {
      context.go(IntroductionPage.routeName);
    });
  }
}
