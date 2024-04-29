import 'package:bimir_lock/views/homePage/add_password.dart';
import 'package:bimir_lock/views/homePage/home_page.dart';
import 'package:bimir_lock/views/homePage/password_detail.dart';
import 'package:bimir_lock/views/pin/change_access_pin.dart';
import 'package:bimir_lock/views/pin/set_access_pin.dart';
import 'package:bimir_lock/views/splash_page.dart';
import 'package:flutter/material.dart';

import '../views/user/add_user_detail.dart';
import '../views/introScreen/introduction_page.dart';
import '../views/introScreen/quotes_category.dart';
import '../views/introScreen/welcome_page.dart';

// final routes = {
//   SplashPage.routeName: (_) => const SplashPage(),
//   WelcomePage.routeName: (_) => const WelcomePage(),
//   IntroductionPage.routeName: (_) => IntroductionPage(),
//   QuotesCategoryPage.routeName: (_) => const QuotesCategoryPage(),
//   AddUserDetailPage.routeName: (_) => AddUserDetailPage(),
//   HomePage.routeName: (_) => HomePage(),
//   AddPasswordPage.routeName: (_) => AddPasswordPage(),
//   PasswordDetailPage.routeName: (_) => const PasswordDetailPage(),
// };

Route<dynamic>? generatedRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case WelcomePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const WelcomePage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case IntroductionPage.routeName:
      return MaterialPageRoute(
        builder: (_) => IntroductionPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case QuotesCategoryPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const QuotesCategoryPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case AddUserDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddUserDetailPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case HomePage.routeName:
      return MaterialPageRoute(
        builder: (_) => HomePage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case AddPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const AddPasswordPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case PasswordDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PasswordDetailPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case SetAccessPinPage.routeName:
      return MaterialPageRoute(
        builder: (_) => SetAccessPinPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );
    case ChangeAccessPinPage.routeName:
      return MaterialPageRoute(
        builder: (_) => ChangeAccessPinPage(),
        settings: RouteSettings(
          arguments: settings.arguments,
          name: settings.name,
        ),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}



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
