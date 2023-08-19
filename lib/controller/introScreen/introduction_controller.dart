import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../views/introScreen/quotes_category.dart';

class IntroductionController {
  void onIntroEnd(BuildContext context) {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const HomePage()),
    // );
    context.push(QuotesCategoryPage.routeName);
  }
}
