import 'package:ginza_coffee_app/screens/admin/widgets/productdetail.dart';

class CartItemModel {

  static const PRODUCT_NAME = "product_name";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const QUANTITY = "quantity";
  static const COST = "cost";

  String productName;
  String image;
  int quantity;
  double cost;
  double price;

  CartItemModel({this.productName, this.image, this.quantity, this.cost, this.price});

  CartItemModel.fromMap(Map<String, dynamic> data){
    productName = data[PRODUCT_NAME];
    image = data[IMAGE];
    quantity = data[QUANTITY];
    cost = data[COST].toDouble();
    price = data[PRICE].toDouble();
  }
  
  Map toJson() => {
    PRODUCT_NAME: productName,
    IMAGE: image,
    QUANTITY: quantity,
    COST: price * quantity,
    PRICE: price
  };
}