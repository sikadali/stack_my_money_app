import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';

class SOutlinedButtonTheme {
  SOutlinedButtonTheme._(); // to avoid creating instances

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: sSecondaryColor,
      side: const BorderSide(color: sSecondaryColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: sWhiteColor,
      side: const BorderSide(color: sWhiteColor),
      padding: const EdgeInsets.symmetric(vertical: sButtonHeight),
    ),
  );
}
