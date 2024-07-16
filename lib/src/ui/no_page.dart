import 'package:flutter/material.dart';

class NoPage extends StatelessWidget {
  const NoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 33, 72),
      body: Text("SORRY ! THIS PAGE DOESN'T EXIST ..."),
    );
  }
}
