import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/home/home_screen.dart';

import 'package:stack_my_money_app/src/ui/no_page.dart';
import 'package:stack_my_money_app/src/ui/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:stack_my_money_app/src/ui/authentication/screens/splash_screen/splash_screen.dart';
import 'package:stack_my_money_app/src/ui/authentication/screens/welcome/welcome_screen.dart';

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
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) => const NoPage());
    }
  }

  void dispose() {
    //animationBloc.close();
  }

  static const String home = "/home";
  static const String onboarding = "/onboarding";
  static const String welcome = "/welcome";
}
