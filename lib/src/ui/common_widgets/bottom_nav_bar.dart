import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/constants/icons.dart';

class SBottomNavBar extends StatelessWidget {
  const SBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(sHomeIcon)),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: IconButton(
                onPressed: () {}, icon: const Icon(sTransactionsIcon)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: IconButton(onPressed: () {}, icon: const Icon(sGoalsIcon)),
          ),
          IconButton(onPressed: () {}, icon: const Icon(sBudgetIcon)),
        ],
      ),
    );
  }
}
