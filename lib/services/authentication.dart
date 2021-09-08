import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/login.dart';
import 'package:ginza_coffee_app/screens/register.dart';

class Authentication extends StatefulWidget {
  const Authentication({ Key key }) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {

  bool isToggle= false;
  void toggleScreen(){
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isToggle) {
      return Register(toggleScreen: toggleScreen);
    }else{
      return Login(toggleScreen:toggleScreen);
    }
  }
}