import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/dropdown_menu.dart';
import 'package:stack_my_money_app/src/common_widgets/transaction_item.dart';
import 'package:stack_my_money_app/src/constants/icons.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';

class UIDataUtils {
  static getStats(BuildContext context) {
    return [
      Column(
        children: [
          Text("Solde Restant", style: Theme.of(context).textTheme.displayMedium),
          Text("1000 €", style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
      Column(
        children: [
          Text("Solde Final Prédit", style: Theme.of(context).textTheme.displayMedium),
          Text("52.34 €", style: Theme.of(context).textTheme.titleLarge)
        ],
      )
    ];
  }

  static getTransactions() {
    return [
      const TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      const TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      const TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
    ];
  }

  static List<Couple<IconData, String>> getDropdownItemsForTransactionType() {
    return <Couple<IconData, String>>[
      Couple(sExpensesIcon, sExpenses),
      Couple(sIncomesIcon, sIncomes)
    ];
  }

  static List<Couple<IconData, String>> getDropdownItemsForTransactionCategory() {
    return <Couple<IconData, String>>[
      Couple(sShoppingIcon, sShopping),
      Couple(sRentIcon, sRent),
      Couple(sRestaurantIcon, sRestaurant),
      Couple(sTransportIcon, sTransport)
    ];
  }
}