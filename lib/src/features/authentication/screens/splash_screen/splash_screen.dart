import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';
import 'package:stack_my_money_app/src/features/authentication/bloc/animation/animation_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    // context.read<AnimationBloc>().add(AnimateSplashScreen());
    super.initState();

    // Démarrer l'animation après un court délai
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double splashIconSize = mediaQuery.size.height * 0.2;
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.blueAccent : sSplashColor,
      body: Center(
          child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 5),
              child: isDarkMode
                  ? Image(image: AssetImage(sSplashWhiteIcon), height: splashIconSize)
                  : Image(image: AssetImage(sSplashBlackIcon), height: splashIconSize))),
    );
  }
}
