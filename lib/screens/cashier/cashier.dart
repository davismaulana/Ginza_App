import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/cashier/widgets/order.dart';
import 'package:ginza_coffee_app/screens/cashier/widgets/payment.dart';
import 'package:ginza_coffee_app/screens/login.dart';

class Cashier extends StatefulWidget {

  @override
  _CashierState createState() => _CashierState();
}

class _CashierState extends State<Cashier> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    Order(),
    Payment()

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(27, 27, 27, 1)),
        title: Container(
          width: 150,
          child: Image.asset("assets/images/GinzaCashier.png")
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(178, 124, 85, 1),
              ),
              child: Text(
                'davismaulana05@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
        ],
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(178, 124, 85, 1),
        onTap: _onItemTapped,
      ),

    );
  }
}
