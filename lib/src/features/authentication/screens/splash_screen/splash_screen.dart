import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';
import 'package:stack_my_money_app/src/routing/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // small delay before logo animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
      // Wait for the logo animation to complete before going to the next page
      Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.of(context).pushNamed(AppRouter.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double splashIconSize = mediaQuery.size.height * 0.2;
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? sSplashDarkColor : sSplashColor,
      body: Center(
          child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 2000),
              child: isDarkMode
                  ? Image(image: const AssetImage(sSplashWhiteIcon), height: splashIconSize)
                  : Image(image: const AssetImage(sSplashBlackIcon), height: splashIconSize))),
    );
  }
}
