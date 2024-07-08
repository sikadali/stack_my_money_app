import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';
import 'package:stack_my_money_app/src/features/authentication/models/onboarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(sDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: model.screenHeight * 0.25),
          Column(
            children: [
              Text(model.title, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center),
              const SizedBox(height: 10.0),
              Text(model.subTitle, style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 50.0)
        ],
      ),
    );
  }
}