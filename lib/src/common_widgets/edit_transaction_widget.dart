import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/input_transaction_name_and_amount_widget.dart';
import 'package:stack_my_money_app/src/common_widgets/input_transaction_type_and_category_widget.dart';

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
          const SizedBox(height: 15),
          const InputTransactionTypeAndCategoryWidget(),
          const InputTransactionNameAndAmountWidget()
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
