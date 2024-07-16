import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:stack_my_money_app/src/ui/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:stack_my_money_app/src/ui/utils/theme/widget_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._(); // to avoid creating instances

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: const AppBarTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(),
  );
}
