import 'package:flutter/material.dart';

class SMonthCarousel extends StatefulWidget {
  const SMonthCarousel({super.key});

  @override
  _SMonthCarouselState createState() => _SMonthCarouselState();
}

class _SMonthCarouselState extends State<SMonthCarousel> {
  final List<String> months = [
    'Janvier',
    'Février',
    'Mars',
    'Avril',
    'Mai',
    'Juin',
    'Juillet',
    'Août',
    'Septembre',
    'Octobre',
    'Novembre',
    'Décembre'
  ];

  DateTime _selectedDate = DateTime.now();

  void _previousMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month - 1,
      );
    });
  }

  void _nextMonth() {
    setState(() {
      _selectedDate = DateTime(
        _selectedDate.year,
        _selectedDate.month + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenWidth = mediaQuery.size.width;

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
          _nextMonth(); // glissement vers la gauche
        } else if (details.primaryVelocity != null && details.primaryVelocity! > 0) {
          _previousMonth(); // glissement vers la droite
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: _previousMonth,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: screenWidth / 2,
            child: Text(
              '${months[_selectedDate.month - 1]} ${_selectedDate.year}',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: _nextMonth,
          ),
        ],
      ),
    );
  }
}
