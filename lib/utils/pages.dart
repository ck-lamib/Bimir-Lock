import 'package:bimir_lock/views/home_page.dart';
import 'package:bimir_lock/views/splash_page.dart';
import 'package:go_router/go_router.dart';

import '../views/introScreen/add_user_detail.dart';
import '../views/introScreen/introduction_page.dart';
import '../views/introScreen/quotes_category.dart';
import '../views/introScreen/welcome_page.dart';

final routerConfig = GoRouter(
  initialLocation: SplashPage.routeName,
  routes: [
    GoRoute(
      path: SplashPage.routeName,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: WelcomePage.routeName,
      builder: (context, state) => const WelcomePage(),
    ),
    GoRoute(
      path: IntroductionPage.routeName,
      builder: (context, state) => IntroductionPage(),
    ),
    GoRoute(
      path: QuotesCategoryPage.routeName,
      builder: (context, state) => const QuotesCategoryPage(),
    ),
    GoRoute(
      path: AddUserDetailPage.routeName,
      builder: (context, state) => AddUserDetailPage(),
    ),
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => HomePage(),
    ),
  ],
  debugLogDiagnostics: true,
);
