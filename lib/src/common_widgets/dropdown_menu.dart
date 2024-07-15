import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_my_money_app/src/constants/icons.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';
import 'package:stack_my_money_app/src/features/authentication/bloc/typecategory/transaction_type_and_category_bloc.dart';

class SDropDownMenu extends StatefulWidget {
  const SDropDownMenu({super.key, required this.color, required this.items});

  final List<Couple> items;
  final Color color;

  @override
  State<SDropDownMenu> createState() => _SDropDownMenuState();
}

class _SDropDownMenuState extends State<SDropDownMenu> {
  late String _displayValue;

  @override
  void initState() {
    super.initState();
    _displayValue = widget.items[0].text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      color: widget.color,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _displayValue,
          items: widget.items.map((Couple value) {
            return DropdownMenuItem<String>(
              value: value.text,
              child: Row(
                children: [
                  value.icon is IconData ? Icon(value.icon) : value.icon,
                  const SizedBox(width: 10),
                  Text(value.text.toUpperCase()),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _displayValue = newValue!;
              if (_displayValue == sExpensesText) {
                context
                    .read<TransactionTypeAndCategoryBloc>()
                    .add(ChangeTransactionTypeToExpenses());
              } else if (_displayValue == sIncomesText) {
                context
                    .read<TransactionTypeAndCategoryBloc>()
                    .add(ChangeTransactionTypeToIncomes());
              }
            });
          },
          icon: const Icon(sExpandIcon),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class Couple<A, B> {
  final A icon;
  final B text;

  Couple(this.icon, this.text);
}
