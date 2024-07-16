import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/bottom_nav_bar.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/carousel_widget.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/drawer.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/floating_action_button.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/month_carousel.dart';
import 'package:stack_my_money_app/src/ui/common_widgets/nav_bar.dart';
import 'package:stack_my_money_app/src/ui/constants/colors.dart';
import 'package:stack_my_money_app/src/ui/constants/sizes.dart';

import '../utils/theme/ui_data_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: const SNavBar(),
      drawer: const SDrawer(),
      bottomNavigationBar: const SBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const SFloatingActionButton(),
      body: Column(
        children: [
          SizedBox(height: screenHeight / 20, child: const SMonthCarousel()),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: screenWidth,
              color: sPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text("Revenus",
                        style: Theme.of(context).textTheme.displayMedium),
                    Text("2500 €",
                        style: Theme.of(context).textTheme.titleLarge)
                  ]),
                  const VerticalDivider(),
                  Column(children: [
                    Text("Depenses",
                        style: Theme.of(context).textTheme.displayMedium),
                    Text("1500 €",
                        style: Theme.of(context).textTheme.titleLarge)
                  ]),
                ],
              )),
          const SizedBox(height: 20),
          SCarouselSliderWidget(
            screenWidth: screenWidth,
            stats: UIDataUtils.getStats(context),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.only(left: sDefaultSmallSize),
              child: Row(
                children: [
                  Text("Dernières transactions",
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              )),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: UIDataUtils.getTransactions(),
            ),
          ),
        ],
      ),
    );
  }
}
