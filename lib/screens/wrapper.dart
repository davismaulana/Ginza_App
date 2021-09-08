import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/firstScreen.dart';
import 'package:ginza_coffee_app/screens/user/homescreen.dart';
import 'package:ginza_coffee_app/services/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user != null) {
      return HomeScreen(user: user,);
    }else{
      return Authentication();
    }
  }
}