import 'package:bimir_lock/features/introductionPage/presentation/introduction_controller.dart';
import 'package:bimir_lock/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  static const String routeName = "/introduction";
  final c = IntroductionController();
  IntroductionPage({super.key});

  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: IntroductionScreen(
            key: introKey,
            allowImplicitScrolling: false,
            pages: [
              PageViewModel(
                title: "About bimir lock",
                body: "Instead of having to buy an entire share, invest any amount you want.",
                // image: Image.asset("assets/Icons/apple.svg"),
                // decoration: pageDecoration,
              ),
              PageViewModel(
                title: "function 1",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
              ),
              PageViewModel(
                title: "function 2",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
              ),
              PageViewModel(
                title: "function 3",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
              ),
              PageViewModel(
                title: "function 4",
                body: "Download the Stockpile app and master the market with our mini-lesson.",
              ),
            ],
            onDone: () => c.onIntroEnd(context),
            onSkip: () => c.onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipOrBackFlex: 0,
            nextFlex: 0,
            showBackButton: false,

            back: const Icon(Icons.arrow_back),
            skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            curve: Curves.fastLinearToSlowEaseIn,
            controlsMargin: const EdgeInsets.all(16),
            controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
