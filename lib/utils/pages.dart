import 'package:bimir_lock/views/homePage/add_password.dart';
import 'package:bimir_lock/views/homePage/home_page.dart';
import 'package:bimir_lock/views/homePage/password_detail.dart';
import 'package:bimir_lock/views/splash_page.dart';

import '../views/introScreen/add_user_detail.dart';
import '../views/introScreen/introduction_page.dart';
import '../views/introScreen/quotes_category.dart';
import '../views/introScreen/welcome_page.dart';

final routes = {
  SplashPage.routeName: (_) => const SplashPage(),
  WelcomePage.routeName: (_) => const WelcomePage(),
  IntroductionPage.routeName: (_) => IntroductionPage(),
  QuotesCategoryPage.routeName: (_) => const QuotesCategoryPage(),
  AddUserDetailPage.routeName: (_) => AddUserDetailPage(),
  HomePage.routeName: (_) => HomePage(),
  AddPasswordPage.routeName: (_) => AddPasswordPage(),
  PasswordDetailPage.routeName: (_) => const PasswordDetailPage(),
};



//  GoRouter(
//   initialLocation: SplashPage.routeName,
//   routes: [
//     GoRoute(
//       path: SplashPage.routeName,
//       builder: (context, state) => const SplashPage(),
//     ),
//     GoRoute(
//       path: WelcomePage.routeName,
//       builder: (context, state) => const WelcomePage(),
//     ),
//     GoRoute(
//       path: IntroductionPage.routeName,
//       builder: (context, state) => IntroductionPage(),
//     ),
//     GoRoute(
//       path: QuotesCategoryPage.routeName,
//       builder: (context, state) => const QuotesCategoryPage(),
//     ),
//     GoRoute(
//       path: AddUserDetailPage.routeName,
//       builder: (context, state) => AddUserDetailPage(),
//     ),
//     GoRoute(
//       path: HomePage.routeName,
//       builder: (context, state) => HomePage(),
//     ),
//     GoRoute(
//       path: PasswordDetailPage.routeName,
//       builder: (context, state) => PasswordDetailPage(),
//     ),
//   ],
//   debugLogDiagnostics: true,
// );
