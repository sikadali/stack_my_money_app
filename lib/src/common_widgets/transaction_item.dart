import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final Color amountColor;

  const TransactionItem({
    super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: Text(
        amount,
        style: TextStyle(color: amountColor),
      ),
    );
  }
}