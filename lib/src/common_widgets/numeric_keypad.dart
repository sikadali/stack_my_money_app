import 'package:flutter/material.dart';

class SNumericKeypad extends StatelessWidget {
  final Function(String) onKeyTap;
  final VoidCallback onDelete;
  final VoidCallback onCalendar;
  final VoidCallback onValidation;

  const SNumericKeypad(
      {super.key,
      required this.onKeyTap,
      required this.onDelete,
      required this.onCalendar,
      required this.onValidation});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(children: [
              _buildKey(context, "1"),
              _buildKey(context, "2"),
              _buildKey(context, "3")
            ]),
            Row(children: [
              _buildKey(context, "4"),
              _buildKey(context, "5"),
              _buildKey(context, "6")
            ]),
            Row(children: [
              _buildKey(context, "7"),
              _buildKey(context, "8"),
              _buildKey(context, "9")
            ]),
            Row(children: [
              _buildKey(context, "0", isZero: true),
              _buildKey(context, ",", isDot: true)
            ]),
          ],
        ),
        Column(children: [
          _buildKey(context, Icons.backspace, isDelete: true),
          _buildKey(context, Icons.calendar_today, isCalendar: true),
          _buildKey(context, Icons.check, isValidation: true),
        ])
      ],
    );
  }

  Widget _buildKey(BuildContext context, dynamic value,
      {bool isDelete = false,
      bool isDot = false,
      bool isCalendar = false,
      bool isValidation = false,
      bool isZero = false}) {

    var mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;
    double keyPadSize = screenWidth * 0.2;
    final bool isDarkMode = mediaQuery.platformBrightness == Brightness.dark;

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
        margin: const EdgeInsets.all(1.0),
        height: isValidation ? keyPadSize * 2 : keyPadSize,
        width: isZero ? keyPadSize * 2 : keyPadSize,
        decoration: BoxDecoration(
          color: getKeyPadColor(isDelete, isCalendar, isValidation, isDarkMode),
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Center(
          child: value is IconData
              ? Icon(
                  value,
                  size: 30,
                  color: isValidation && !isDarkMode ? Colors.white : Colors.black,
                )
              : Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
        ),
      ),
    );
  }

  getKeyPadColor(bool isDelete, bool isCalendar, bool isValidation, bool isDarkMode) {
    if (isValidation) {
      return isDarkMode ? Colors.white : Colors.black87;
    } else if (isDelete) {
      return Colors.red[100];
    } else if (isCalendar) {
      return Colors.blue[100];
    }
    return isDarkMode ? Colors.black87 : const Color(0xffDDDDDD);
  }
}

