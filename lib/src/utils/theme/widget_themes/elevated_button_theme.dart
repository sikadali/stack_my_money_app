import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._(); // to avoid creating instances

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: const RoundedRectangleBorder(),
    foregroundColor: sWhiteColor,
    backgroundColor: sSecondaryColor,
    side: const BorderSide(color: sSecondaryColor),
    padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    shape: const RoundedRectangleBorder(),
    foregroundColor: sSecondaryColor,
    backgroundColor: sWhiteColor,
    side: const BorderSide(color: sWhiteColor),
    padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
  ));
}
