import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/bottom_nav_bar.dart';
import 'package:stack_my_money_app/src/common_widgets/drawer.dart';
import 'package:stack_my_money_app/src/common_widgets/floating_action_button.dart';
import 'package:stack_my_money_app/src/common_widgets/nav_bar.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SNavBar(),
      drawer: SDrawer(),
      bottomNavigationBar: SBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SFloatingActionButton(),
      backgroundColor: sPrimaryColor,
      body: Expanded(
          child: Center(
              child: Text(
        "HOME (MOBILE)",
        style: TextStyle(fontSize: 60, color: Colors.white),
      ))),
    );
  }
}
