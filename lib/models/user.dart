import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ginza_coffee_app/constans/app_constans.dart';
import 'package:ginza_coffee_app/models/cart_item.dart';

class UserModel{
  static const ID = "id";
  static const EMAIL = "email";
  static const CART = "cart";
  
  String id;
  String email;
  List<CartItemModel> cart;

  UserModel({this.id, this.email});

  UserModel.fromSnapshot(DocumentSnapshot snapshot){
    id = snapshot[ID];
    email = snapshot[EMAIL];
    cart = _convertCartItem(snapshot[CART] ?? []);
  }

  List<CartItemModel> _convertCartItem(List cartFomDb){
    List<CartItemModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });

    return _result;
  }

  List cartItemToJson() => cart.map((item) => item.toJson()).toList();
}