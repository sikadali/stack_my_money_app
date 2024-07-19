import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/constants/colors.dart';
import 'package:stack_my_money_app/src/ui/constants/image_strings.dart';
import 'package:stack_my_money_app/src/core/routing/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  double _splashIconSize = 0.0;

  @override
  void initState() {
    super.initState();
    // small delay before logo animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
        _splashIconSize = MediaQuery.of(context).size.height * 0.2;
      });
      // Wait for the logo animation to complete before going to the next page
      Future.delayed(const Duration(milliseconds: 3000), () {
        Navigator.of(context).popAndPushNamed(AppRouter.home);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? sSplashDarkColor : sSplashColor,
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.easeInOut,
        // Optional: Add a curve for smoother animation
        height: _splashIconSize,
        // Variable to control the height of the image
        width: _splashIconSize,
        child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 2000),
            child: isDarkMode
                ? const Image(image: AssetImage(sSplashWhiteIcon))
                : const Image(image: AssetImage(sSplashDarkIcon))),
      )),
    );
  }
}
