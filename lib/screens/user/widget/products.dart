import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ginza_coffee_app/constans/controllers.dart';
import 'package:ginza_coffee_app/controllers/product_controller.dart';
import 'package:ginza_coffee_app/models/product_model.dart';
import 'package:ginza_coffee_app/screens/user/widget/single_product.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> GridView.count(
      crossAxisCount: 2,
      childAspectRatio: .70,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 10,
      children: productController.product.map((ProductModel product){
        return SingleProductWidget(product: product,);
      }).toList(),
    ));
  }
}