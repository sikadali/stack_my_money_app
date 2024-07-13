import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/dropdown_menu.dart';
import 'package:stack_my_money_app/src/common_widgets/input_transaction_amount_widget.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/utils/theme/ui_data_utils.dart';

class EditTransactionWidget extends StatefulWidget {
  const EditTransactionWidget({super.key});

  @override
  _EditTransactionWidgetState createState() => _EditTransactionWidgetState();
}

class _EditTransactionWidgetState extends State<EditTransactionWidget> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          greyIndicator(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SDropDownMenu(
                  color: sSecondaryColor2, items: UIDataUtils.getDropdownItemsForTransactionType()),
              SDropDownMenu(
                  color: sPrimaryColor2,
                  items: UIDataUtils.getDropdownItemsForTransactionCategory()),
            ],
          ),
          const SizedBox(height: 20),
          const InputTransactionAmountWidget()
          /*TextField(
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 36),
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixText: '\$',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                amount = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Add comment...',
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(12, (index) {
                if (index == 9) {
                  return IconButton(
                    onPressed: () {
                      // Handle backspace
                    },
                    icon: const Icon(Icons.backspace),
                  );
                } else if (index == 10) {
                  return TextButton(
                    onPressed: () {
                      // Handle date
                    },
                    child: const Icon(Icons.calendar_today),
                  );
                } else if (index == 11) {
                  return IconButton(
                    onPressed: () {
                      // Handle check
                    },
                    icon: const Icon(Icons.check),
                    color: Colors.black,
                    iconSize: 36,
                  );
                } else {
                  return TextButton(
                    onPressed: () {
                      // Handle number input
                    },
                    child: Text(
                      '${index == 9 ? 0 : index + 1}',
                      style: const TextStyle(fontSize: 24),
                    ),
                  );
                }
              }),
            ),
          ),
          */
        ],
      ),
    );
  }

  Center greyIndicator() {
    return Center(
      child: Container(
        width: 50,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
