import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double imgHeight = MediaQuery.of(context).size.height * 0.25;
    return Stack(
      children: [
        LiquidSwipe(pages: [
          Container(
            padding: const EdgeInsets.all(sDefaultSize),
            color: sOnBoardingPage1Color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage(sOnBoardingImage1), height: imgHeight,),
                Column(
                  children: [
                    Text(sOnBoardingTitle1, style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center),
                    SizedBox(height: 10.0),
                    Text(sOnBoardingSubTitle1, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
                  ],
                ),
                Text(sOnBoardingCounter1, style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 50.0)
              ],
            ),
          ),
          Container(color: sOnBoardingPage2Color),
          Container(color: sOnBoardingPage3Color),
        ])
      ],
    );
  }
}
