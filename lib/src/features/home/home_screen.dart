import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stack_my_money_app/src/common_widgets/bottom_nav_bar.dart';
import 'package:stack_my_money_app/src/common_widgets/drawer.dart';
import 'package:stack_my_money_app/src/common_widgets/floating_action_button.dart';
import 'package:stack_my_money_app/src/common_widgets/nav_bar.dart';
import 'package:stack_my_money_app/src/constants/colors.dart';
import 'package:stack_my_money_app/src/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenHeight = mediaQuery.size.height;
    double screenWidth = mediaQuery.size.width;

    List<Widget> transactions = [
      const TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      const TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      const TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      const TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
    ];

    return Scaffold(
      appBar: const SNavBar(),
      drawer: const SDrawer(),
      bottomNavigationBar: const SBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const SFloatingActionButton(),
      body: Column(
        children: [
          SizedBox(height: screenHeight / 20, child: const MonthCarousel()),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              width: screenWidth,
              color: sPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(children: [
                    Text(
                      "Revenus",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text("2500 €", style: Theme.of(context).textTheme.titleLarge)
                  ]),
                  const VerticalDivider(),
                  Column(children: [
                    Text("Depenses", style: Theme.of(context).textTheme.displayMedium),
                    Text("1500 €", style: Theme.of(context).textTheme.titleLarge)
                  ]),
                ],
              )),
          const SizedBox(height: 20),
          SCarouselSliderWidget(screenWidth: screenWidth),
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: sDefaultSize),
              child: Row(
                children: [
                  Text("Dernieres transactions", style: Theme.of(context).textTheme.bodyLarge),
                ],
              )),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: transactions,
            ),
          ),
        ],
      ),
    );
  }
}

class SCarouselSliderWidget extends StatefulWidget {
  const SCarouselSliderWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SCarouselSliderWidget> createState() => _SCarouselSliderWidgetState();
}

class _SCarouselSliderWidgetState extends State<SCarouselSliderWidget> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> stats = [
      Column(
        children: [
          Text("Solde Restant", style: Theme.of(context).textTheme.displayMedium),
          Text("1000 €", style: Theme.of(context).textTheme.titleLarge)
        ],
      ),
      Column(
        children: [
          Text("Solde Final Prédit", style: Theme.of(context).textTheme.displayMedium),
          Text("52.34 €", style: Theme.of(context).textTheme.titleLarge)
        ],
      )
    ];

    return Column(
      children: [
        Container(
            height: 90,
            width: widget.screenWidth,
            padding: const EdgeInsets.symmetric(horizontal: sDefaultSize),
            child: CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: stats,
            )),
        AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: stats.length,
          effect: const WormEffect(
              activeDotColor: Color(0xff272727),
              dotHeight: 5.0
          ),
        )
      ],
    );
  }
}

class MonthCarousel extends StatefulWidget {
  const MonthCarousel({super.key});

  @override
  _MonthCarouselState createState() => _MonthCarouselState();
}

class _MonthCarouselState extends State<MonthCarousel> {
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

class TransactionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String amount;
  final Color amountColor;

  const TransactionItem({super.key,
    required this.icon,
    required this.title,
    required this.time,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(icon),
      ),
      title: Text(title),
      subtitle: Text(time),
      trailing: Text(
        amount,
        style: TextStyle(color: amountColor),
      ),
    );
  }
}
