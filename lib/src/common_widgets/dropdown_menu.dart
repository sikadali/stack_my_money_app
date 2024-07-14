import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/icons.dart';

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
            });
          },
          icon: const Icon(sExpandIcon),
          style: const TextStyle(fontSize: 16),
          dropdownColor: Colors.white,
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
