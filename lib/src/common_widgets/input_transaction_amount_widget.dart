import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stack_my_money_app/src/common_widgets/dropdown_menu.dart';
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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _appendText(String text) {
    final currentText = _controller.text;
    setState(() {
      _controller.text = currentText + text;
    });
  }

  void _deleteText() {
    final currentText = _controller.text;
    if (currentText.isNotEmpty) {
      setState(() {
        _controller.text = currentText.substring(0, currentText.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(sDefaultSmallSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SDropDownMenu(
                  color: sSecondaryColor2, items: UIDataUtils.getDropdownItemsForCurrencies()),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: GestureDetector(
                  onTap: () {
                    _focusNode.requestFocus();
                  },
                  child: AbsorbPointer(
                    child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      focusNode: _focusNode,
                      keyboardType: TextInputType.none,
                      style: Theme.of(context).textTheme.titleLarge,
                      // decoration: InputDecoration(hintText: sTransactionAmountHintText),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const TextField(decoration: InputDecoration(hintText: sTransactionNameHintText)),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: NumericKeypad(
              onKeyTap: _appendText,
              onDelete: _deleteText,
              onCalendar: () {},
              onValidation: () {},
            ),
          ),
        ],
      ),
    );
  }
}




class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onCalendar;
  final VoidCallback onValidation;

  const NumericKeypad(
      {super.key,
      required this.onKeyTap,
      required this.onDelete,
      required this.onCalendar,
      required this.onValidation});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(children: [_buildKey("1"), _buildKey("2"), _buildKey("3")]),
            Row(children: [_buildKey("4"), _buildKey("5"), _buildKey("6")]),
            Row(children: [_buildKey("7"), _buildKey("8"), _buildKey("9")]),
            Row(children: [_buildKey("0"), _buildKey(",", isDot: true)]),
          ],
        ),
        Column(children: [
          _buildKey(Icons.backspace, isDelete: true),
          _buildKey(Icons.calendar_today, isCalendar: true),
          _buildKey(Icons.check, isValidation: true),
        ])
      ],
    );
  }

  Widget _buildKey(dynamic value,
      {bool isDelete = false,
      bool isDot = false,
      bool isCalendar = false,
      bool isValidation = false}) {
    return GestureDetector(
      onTap: () {
        if (isDelete) {
          onDelete();
        } else if (isCalendar) {
          onCalendar();
        } else if (isValidation) {
          onValidation();
        } else {
          onKeyTap(value.toString());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: value is IconData
              ? Icon(value, size: 24)
              : Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
        ),
      ),
    );
  }
}

/*
class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;

  const NumericKeypad({super.key, required this.onKeyTap, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 2,
      children: <Widget>[
        ...List.generate(9, (index) {
          return _buildKey((index + 1).toString());
        }),
        _buildKey('.', isDot: true),
        _buildKey('0'),
        _buildKey(Icons.backspace, isDelete: true),
      ],
    );
  }

  Widget _buildKey(dynamic value, {bool isDelete = false, bool isDot = false}) {
    return GestureDetector(
      onTap: () {
        if (isDelete) {
          onDelete();
        } else {
          onKeyTap(value.toString());
        }
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: isDelete
              ? Icon(value, size: 24)
              : Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 24),
                ),
        ),
      ),
    );
  }
}
*/
/*class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onCalendar;
  final VoidCallback onValidation;

  const NumericKeypad(
      {super.key,
      required this.onKeyTap,
      required this.onDelete,
      required this.onCalendar,
      required this.onValidation});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      children: List.generate(12, (index) {
        if (index == 3) {
          return IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.backspace),
          );
        } else if (index == 7) {
          return TextButton(
            onPressed: onCalendar,
            child: const Icon(Icons.calendar_today),
          );
        } else if (index == 11) {
          return IconButton(
            onPressed: onValidation,
            icon: const Icon(Icons.check),
            color: Colors.black,
            iconSize: 36,
          );
        } else {
          // Adjust the number displayed on the button
          final displayNumber = ([3, 7, 11].contains(index)) ? 0 : index + 1;
          return TextButton(
            onPressed: () => onKeyTap(displayNumber.toString()),
            child: Text(
              displayNumber.toString(),
              style: const TextStyle(fontSize: 24),
            ),
          );
        }
      }),
    );
  }
}*/