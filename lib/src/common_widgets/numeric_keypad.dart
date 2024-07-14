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
    var mediaQuery = MediaQuery.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(children: [
              _buildKey(mediaQuery, "1"),
              _buildKey(mediaQuery, "2"),
              _buildKey(mediaQuery, "3")
            ]),
            Row(children: [
              _buildKey(mediaQuery, "4"),
              _buildKey(mediaQuery, "5"),
              _buildKey(mediaQuery, "6")
            ]),
            Row(children: [
              _buildKey(mediaQuery, "7"),
              _buildKey(mediaQuery, "8"),
              _buildKey(mediaQuery, "9")
            ]),
            Row(children: [
              _buildKey(mediaQuery, "0", isZero: true),
              _buildKey(mediaQuery, ",", isDot: true)
            ]),
          ],
        ),
        Column(children: [
          _buildKey(mediaQuery, Icons.backspace, isDelete: true),
          _buildKey(mediaQuery, Icons.calendar_today, isCalendar: true),
          _buildKey(mediaQuery, Icons.check, isValidation: true),
        ])
      ],
    );
  }

  Widget _buildKey(var mediaQuery, dynamic value,
      {bool isDelete = false,
      bool isDot = false,
      bool isCalendar = false,
      bool isValidation = false,
      bool isZero = false}) {

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
                  style: const TextStyle(fontSize: 30),
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

