import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:ginza_coffee_app/constans/firebase.dart';

class AuthServices with ChangeNotifier{
  bool _isLoading = false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String email, String password) async {
    setLoading(true);
    try {
      final authResult = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
       _addUserToFirestore(user.uid,user.email);
      setLoading(false);
      return user;
    } on SocketException{
      setLoading(false);

      setMessage("No internet, please connect to internet");
    }
    catch (e) {
      setLoading(false);

      setMessage(e.message);
    }
    notifyListeners();
  }

  Future login(String email, String password) async {
    try {
      setLoading(true);
      final authResult = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      User user = authResult.user;
      setLoading(false);
      return user;
    } on SocketException{
      setLoading(false);

      setMessage("No internet, please connect to internet");
    }
    catch (e) {
      setLoading(false);
      
      setMessage(e.message);
    }
    notifyListeners();
  }

  

  Future logout() async {
    await firebaseAuth.signOut();
  }

  void setLoading(val){
    _isLoading = val;
    notifyListeners();
  }

  _addUserToFirestore(String userId, email){
    firebaseFirestore.collection("users").doc(userId).set({
      "id": userId,
      "email": email,
      "cart": []
    });
  }

  void setMessage(message){
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User> get user =>firebaseAuth.authStateChanges().map((event) => event);
}

