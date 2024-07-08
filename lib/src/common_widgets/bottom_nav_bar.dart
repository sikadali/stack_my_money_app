import 'package:flutter/material.dart';

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
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          Padding(
            padding: const EdgeInsets.only(right: 28.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.track_changes)),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.pie_chart)),
        ],
      ),
    );
  }
}
