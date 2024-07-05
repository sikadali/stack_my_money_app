import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;
    final double screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: isDarkMode ? null : sPrimaryColor2,
      body: Container(
        padding: const EdgeInsets.all(sDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(sWelcomeScreenImage), height: screenHeight * 0.4),
            _welcomeScreenLogoAndSlogan(isDarkMode),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(onPressed: () {}, child: Text(sLogin.toUpperCase()))),
                const SizedBox(width: 10),
                Expanded(
                    child: ElevatedButton(onPressed: () {}, child: Text(sSignup.toUpperCase())))
              ],
            )
          ],
        ),
      ),
    );
  }
}

_welcomeScreenLogoAndSlogan(isDarkMode) {
  return isDarkMode
      ? const Image(image: AssetImage(ssWelcomeWhiteLogoAndSlogan))
      : const Image(image: AssetImage(ssWelcomeDarkLogoAndSlogan));
}
