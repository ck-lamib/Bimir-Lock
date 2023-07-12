import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/image_path.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
