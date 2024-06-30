import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("STACK MY MONEY"),
            leading: const Icon(Icons.ondemand_video)),
        floatingActionButton: FloatingActionButton(
          child:  const Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {},
        ),
        body: const Center(child: Text("HOME PAGE CONTENT HERE")));
  }
}
