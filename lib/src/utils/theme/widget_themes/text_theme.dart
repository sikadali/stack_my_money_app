import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';

class STextTheme {
  STextTheme._();

  static TextTheme lightTextTheme = const TextTheme(
      displayMedium: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300), //headline
      titleSmall: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 20), //subtitle
      bodyLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300, color: sDarkColor) // body
      );

  static TextTheme darkTextTheme = const TextTheme(
    displayMedium: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300),
    titleSmall: TextStyle(fontFamily: "RoxboroughCF", fontWeight: FontWeight.w500, fontSize: 20),
    bodyLarge: TextStyle(fontFamily: "OpenSauceOne", fontWeight: FontWeight.w300),
  );
}
