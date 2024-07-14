import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/dropdown_menu.dart';
import 'package:stack_my_money_app/src/common_widgets/numeric_keypad.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';
import 'package:stack_my_money_app/src/constants/text_strings.dart';
import 'package:stack_my_money_app/src/utils/theme/ui_data_utils.dart';

class InputTransactionAmountWidget extends StatefulWidget {
  const InputTransactionAmountWidget({super.key});

  @override
  State<InputTransactionAmountWidget> createState() => _InputTransactionAmountWidgetState();
}

class _InputTransactionAmountWidgetState extends State<InputTransactionAmountWidget> {
  final TextEditingController _transactionAmountController = TextEditingController();
  final TextEditingController _transactionNameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String? _errorNameText;
  String? _errorAmountText;

  @override
  void dispose() {
    _transactionAmountController.dispose();
    _transactionNameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _appendText(String text) {
    final currentText = _transactionAmountController.text;
    setState(() {
      _transactionAmountController.text = currentText + text;
    });
  }

  void _deleteText() {
    final currentText = _transactionAmountController.text;
    if (currentText.isNotEmpty) {
      setState(() {
        _transactionAmountController.text = currentText.substring(0, currentText.length - 1);
      });
    }
  }

  void _validateAndSubmit() {
    setState(() {
      _errorNameText =_displayErrorTextIfEmpty(_transactionNameController);
      _errorAmountText = _displayErrorTextIfEmpty(_transactionAmountController);

      if (_transactionAmountController.text.isNotEmpty & _transactionAmountController.text.isNotEmpty) {
        _showConfirmationDialog();
      }
    });
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(sConfirmationTitleText),
          content: Text(sWantToConfirmTransactionCreationText, style: Theme.of(context).textTheme.bodyLarge),
          actions: <Widget>[
            TextButton(
              child: const Text(sCancelText),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialogBox
                // transaction creation cancelled
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(sTransactionCancelledText)),
                );
              },
            ),
            TextButton(
              child: const Text(sConfirmText),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialogBox
                Navigator.of(context).pop(); // Close bottomSheet
                // transaction creation succeed
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(sTransactionSuccessfullyCreatedText)),
                );
              },
            ),
          ],
        );
      },
    );
  }

  String? _displayErrorTextIfEmpty(controller) {
    if (controller.text.isEmpty) {
      return sPleaseFillThisFieldText;
    } return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(sDefaultSmallSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SDropDownMenu(
                  color: isDarkMode ? sSecondaryColor : sSecondaryColor2, items: UIDataUtils.getDropdownItemsForCurrencies()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: GestureDetector(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _transactionAmountController,
                      textAlign: TextAlign.center,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.none,
                      style: Theme.of(context).textTheme.titleLarge,
                      decoration: InputDecoration(errorText: _errorAmountText),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextField(
              controller: _transactionNameController,
              decoration: InputDecoration(
                hintText: sTransactionNameHintText,
                errorText: _errorNameText,
              )),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: SNumericKeypad(
              onKeyTap: _appendText,
              onDelete: _deleteText,
              onCalendar: () {},
              onValidation: _validateAndSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
