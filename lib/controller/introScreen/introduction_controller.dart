import 'package:bimir_lock/main.dart';

import '../../views/introScreen/quotes_category.dart';

class IntroductionController {
  void onIntroEnd() {
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const HomePage()),
    // );

    navigatorKey.currentState!.pushNamed(QuotesCategoryPage.routeName);
  }
}
