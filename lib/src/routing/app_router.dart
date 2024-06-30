import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stack_my_money_app/presentation/pages/home_page.dart';
import 'package:stack_my_money_app/presentation/pages/login_page.dart';
import 'package:stack_my_money_app/presentation/pages/no_page.dart';
import 'package:stack_my_money_app/src/features/authentication/bloc/animation/animation_bloc.dart';
import 'package:stack_my_money_app/src/features/authentication/screens/splash_screen/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final AnimationBloc _animationBloc = AnimationBloc();

    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _animationBloc,
                  child: const SplashScreen(),
                ));
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const NoPage());
    }
  }

  void dispose() {
    // TODO for closing the cubit after usage
    // _createdCubit.close()
  }
}
