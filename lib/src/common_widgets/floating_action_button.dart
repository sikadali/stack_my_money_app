import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

class SFloatingActionButton extends StatelessWidget {
  const SFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;

    return SizedBox(
      height: 70.0,
      width: 70.0,
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 0,
          shape: CircleBorder(side: BorderSide(width: 2.0, color: isDarkMode ? Colors.transparent : sSecondaryColor)),
          backgroundColor: isDarkMode ? null : sWhiteColor,
          foregroundColor: isDarkMode ? null : sSecondaryColor,
          tooltip: sTooltipNewTransaction,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
