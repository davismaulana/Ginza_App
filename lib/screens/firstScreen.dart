import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/wrapper.dart';
import 'package:ginza_coffee_app/services/authentication.dart';

import 'login.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(27, 27, 27, 1),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Norican', fontSize: 40),
              ),
            ),
            Image.asset(
              "assets/images/logoCoffee.png",
            ),
            Container(
              child: Text(
                "Ginza Coffee",
                style: TextStyle(
                    fontFamily: 'Economica', fontSize: 40, color: Colors.white),
              ),
            ),
            Container(
              child: Text(
                "App",
                style: TextStyle(
                    fontFamily: 'Neuton', fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(27, 27, 27, 1),
                      elevation: 3,
                      side: BorderSide(
                        width: 4.0,
                        color: Color.fromRGBO(178, 124, 85, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Wrapper();
                        },
                      ),
                    );
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Color.fromRGBO(178, 124, 85, 1),
                        size: 50,
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
