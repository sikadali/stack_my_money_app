import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    List<Widget> items = <Widget>[
      Container(width: 100, color: Colors.red),
      Container(width: 100, color: Colors.blue),
      Container(width: 100, color: Colors.green),
      Container(width: 100, color: Colors.yellow),
      Container(width: 100, color: Colors.orange),
      Container(width: 100, color: Colors.red),
      Container(width: 100, color: Colors.blue),
      Container(width: 100, color: Colors.green),
      Container(width: 100, color: Colors.yellow),
      Container(width: 100, color: Colors.orange),
    ];

    List<Widget> transactions = [
      TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.person,
          title: 'Money Transfer',
          time: '12:35 PM',
          amount: '-\$450',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.payment,
          title: 'Paypal',
          time: '10:20 AM',
          amount: '+\$1200',
          amountColor: Colors.green),
      TransactionItem(
          icon: Icons.directions_car,
          title: 'Uber',
          time: '08:40 AM',
          amount: '-\$150',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.store,
          title: 'Bata Store',
          time: 'Yesterday',
          amount: '-\$200',
          amountColor: Colors.red),
      TransactionItem(
          icon: Icons.monetization_on_outlined,
          title: 'Bank Transfer',
          time: 'Yesterday',
          amount: '-\$600',
          amountColor: Colors.red),
    ];

    return Scaffold(
      appBar: SNavBar(),
      drawer: SDrawer(),
      bottomNavigationBar: SBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SFloatingActionButton(),
      body: Column(
        children: [
          Container(height: screenHeight / 25, child: MonthCarousel()),
          Container(
              padding: EdgeInsets.symmetric(vertical: 30),
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
                  VerticalDivider(),
                  Column(children: [
                    Text("Depenses", style: Theme.of(context).textTheme.displayMedium),
                    Text("1500 €", style: Theme.of(context).textTheme.titleLarge)
                  ]),
                ],
              )),
          SizedBox(height: 20),
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: sDefaultSize),
            child: ListView.separated(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.0); // Add spacing of 10.0 between each item
              },
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: sDefaultSize),
              child: Row(
                children: [
                  Text("Dernieres transactions", style: Theme.of(context).textTheme.bodyLarge),
                ],
              )),
          SizedBox(height: 20),
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
            icon: Icon(Icons.arrow_left),
            onPressed: _previousMonth,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('${months[_selectedDate.month - 1]} ${_selectedDate.year}',
                style: Theme.of(context).textTheme.bodyLarge),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
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

  TransactionItem({
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
