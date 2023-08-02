import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../utils/image_path.dart';

class WelcomePage extends StatelessWidget {
  static const String routeName = "/welcome";
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              // width: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Image.asset(ImagePath.logoBPath),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "\"The body achieves what the mind believes.\"",
              style: TextStyle(
                fontSize: 28,
                wordSpacing: 1,
                letterSpacing: 0.6,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 25,
            ),
            const Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                "- Erin Gray",
                style: TextStyle(
                  fontSize: 25,
                  wordSpacing: 1,
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                const Text(
                  "Welcome to Bimir Lock",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Bimal",
                  style: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                    // height: 10,
                    child: LoadingAnimationWidget.fourRotatingDots(
                  color: theme.colorScheme.onSurface.withOpacity(0.8),
                  size: 50,
                )),
                const SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
