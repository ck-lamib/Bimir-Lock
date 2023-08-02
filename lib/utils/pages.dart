import 'package:bimir_lock/features/introductionPage/presentation/views/introduction_page.dart';
import 'package:bimir_lock/features/introductionPage/presentation/views/welcome_page.dart';
import 'package:bimir_lock/features/splashPage/presentation/splash_page.dart';
import 'package:go_router/go_router.dart';

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
  ],
  debugLogDiagnostics: true,
);
