import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/image_strings.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';
import 'package:stack_my_money_app/src/features/authentication/models/onboarding_model.dart';
import 'package:stack_my_money_app/src/features/authentication/screens/onboarding/onboarding_page_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    final pages = [
      OnBoardingPageWidget(
          model: OnBoardingModel(
              title: sOnBoardingTitle1,
              subTitle: sOnBoardingSubTitle1,
              image: sOnBoardingImage1,
              counterText: sOnBoardingCounter1,
              screenHeight: screenHeight,
              bgColor: sOnBoardingPage1Color)),
      OnBoardingPageWidget(
          model: OnBoardingModel(
              title: sOnBoardingTitle2,
              subTitle: sOnBoardingSubTitle2,
              image: sOnBoardingImage2,
              counterText: sOnBoardingCounter2,
              screenHeight: screenHeight,
              bgColor: sOnBoardingPage2Color)),
      OnBoardingPageWidget(
          model: OnBoardingModel(
              title: sOnBoardingTitle3,
              subTitle: sOnBoardingSubTitle3,
              image: sOnBoardingImage3,
              counterText: sOnBoardingCounter3,
              screenHeight: screenHeight,
              bgColor: sOnBoardingPage3Color))
    ];
    return Stack(
      children: [
        LiquidSwipe(pages: pages)
      ],
    );
  }
}
