import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/cashier/cashier.dart';
import 'package:ginza_coffee_app/screens/user/homescreen.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key key}) : super(key: key);

  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              child: Image.asset("assets/images/ordersuccess.png"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Wait for your order to arrive",
                style: TextStyle(fontFamily: "Economica", fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Color.fromRGBO(27, 27, 27, 1)),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(40),
              child: Text(
                "If your order does not arrive more than 30 minutes, please contact the cashier immediately",
                style: TextStyle(
                    fontFamily: "Economica", fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(27, 27, 27, 1),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          fontFamily: "Economica",
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
