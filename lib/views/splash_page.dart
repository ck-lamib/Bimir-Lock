import 'package:bimir_lock/core/core_controller.dart';
import 'package:bimir_lock/views/introScreen/introduction_page.dart';
import 'package:bimir_lock/views/introScreen/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/image_path.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = "/splashPage";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final CoreController c = Get.put(CoreController());
  @override
  void initState() {
    navigation();
    super.initState();
  }

  navigation() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (c.isUserLoggedIn()) {
        context.go(WelcomePage.routeName);
      } else {
        context.go(IntroductionPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Image.asset(ImagePath.logoPath),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        // height: 10,
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
          // color: Colors.blue,
          size: 50,
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
