import 'package:flutter/material.dart';

import 'package:stack_my_money_app/presentation/pages/home_page.dart';
import 'package:stack_my_money_app/presentation/pages/login_page.dart';
import 'package:stack_my_money_app/presentation/pages/no_page.dart';
import 'package:stack_my_money_app/src/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:stack_my_money_app/src/features/authentication/screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      /*
            builder: (_) => BlocProvider.value(
                  value: animationBloc,
                  child: const SplashScreen(),
                ));*/
      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const NoPage());
    }
  }

  void dispose() {
    //animationBloc.close();
  }

  static const String home = "/home";
  static const String onboarding = "/onboarding";
}
