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
    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          greyIndicator(),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SDropDownMenu(
                  color: isDarkMode ? sSecondaryColor : sSecondaryColor2,
                  items: UIDataUtils.getDropdownItemsForTransactionType()),
              SDropDownMenu(
                  color: isDarkMode ? sPrimaryColor : sPrimaryColor2,
                  items: UIDataUtils.getDropdownItemsForTransactionCategory()),
            ],
          ),
          const InputTransactionAmountWidget()
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
