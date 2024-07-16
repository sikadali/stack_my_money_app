import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/ui/constants/colors.dart';
import 'package:stack_my_money_app/src/ui/constants/text_strings.dart';

class SDrawer extends StatelessWidget {
  const SDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: sPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sika DALI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                Container(
                  height: 100.0,
                  padding: const EdgeInsets.all(40.0),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey),
                  child: const Text("."),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text(sDrawerHome),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(sDrawerTransactions),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(sDrawerGoals),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(sDrawerBudget),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(sDrawerSettings),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(sDrawerLogout),
            onTap: () {
              // Handle the tap
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
