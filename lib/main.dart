import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ginza_coffee_app/constans/firebase.dart';
import 'package:ginza_coffee_app/controllers/product_controller.dart';
import 'package:ginza_coffee_app/screens/firstScreen.dart';
import 'package:ginza_coffee_app/screens/login.dart';
import 'package:ginza_coffee_app/screens/wrapper.dart';
import 'package:ginza_coffee_app/services/auth_services.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(ProductController());
  });
  runApp(
    MyApp()  
  );
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot){
        if (snapshot.hasError) {
          return Loading();
        }else if (snapshot.hasData){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthServices>.value(value: AuthServices()),
              StreamProvider<User>.value(value: AuthServices().user, initialData: null)
            ],
            child: MaterialApp(
              theme: ThemeData(
                primarySwatch: Colors.brown
              ),
              debugShowCheckedModeBanner: false,
              home: FirstScreen(),
            ),
          );
        }else{
          return Loading();
        }
      }
    );
  }
}


class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.error),
              Text("Something went wrong !")
            ],
          ),
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}