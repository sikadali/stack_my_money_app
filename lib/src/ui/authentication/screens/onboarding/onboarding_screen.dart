import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_my_money_app/src/ui/constants/colors.dart';
import 'package:stack_my_money_app/src/ui/constants/icons.dart';
import 'package:stack_my_money_app/src/ui/constants/image_strings.dart';
import 'package:stack_my_money_app/src/ui/constants/text_strings.dart';
import 'package:stack_my_money_app/src/ui/authentication/models/onboarding_model.dart';
import 'package:stack_my_money_app/src/ui/authentication/screens/onboarding/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final controller = LiquidController();

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
      alignment: Alignment.center,
      children: [
        LiquidSwipe(
          pages: pages,
          liquidController: controller,
          slideIconWidget: const Icon(sArrowLeftIcon),
          enableSideReveal: true,
          onPageChangeCallback: onPageChangedCallback,
        ),
        Positioned(
            bottom: 60.0,
            child: OutlinedButton(
              onPressed: () =>
                  controller.animateToPage(page: controller.currentPage + 1),
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20.0),
                  foregroundColor: Colors.white),
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                      color: sDarkColor, shape: BoxShape.circle),
                  child: const Icon(sArrowRightIcon)),
            )),
        Positioned(
            top: 50.0,
            right: 30.0,
            child: TextButton(
              onPressed: () => controller.jumpToPage(page: 2),
              child: const Text(
                "Skip",
                style: TextStyle(color: Color(0xffcccccc), fontSize: 18),
              ),
            )),
        Positioned(
            bottom: 25,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                  activeDotColor: Color(0xff272727), dotHeight: 5.0),
            ))
      ],
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
