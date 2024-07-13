import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';

class STextTheme {
  STextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
      displayMedium: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300, fontSize: 30),
      displayLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300), //headline
      titleSmall: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 20), //subtitle
      titleLarge: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 35), //subtitle
      bodyLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300, color: sDarkColor), // body
      headlineSmall: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300)
      );

  static TextTheme darkTextTheme = const TextTheme(
    displayMedium: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300, fontSize: 30),
    displayLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300),
    titleSmall: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 20),
    titleLarge: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 35),
    bodyLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300),
    headlineSmall: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300)
  );
}
