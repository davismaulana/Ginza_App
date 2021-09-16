import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/models/product_model.dart';
import 'package:ginza_coffee_app/screens/user/detailscreen.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;
  final User user;

  const SingleProductWidget({Key key, this.product, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(27, 27, 27, 1),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  product.image,
                  width: double.infinity,
                )),
          ),
          Text(
            product.name,
            style: TextStyle(
              fontFamily: "Economica",
              color: Colors.white,
              fontSize: 20,
                                
            ),
          ),
  
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Rp. ${product.price}",
                  style: TextStyle(
                    fontFamily: "Economica",
                    color: Colors.white,
                    fontSize: 20,
                                      
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(Icons.add_box_outlined, color: Colors.white,),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Detail(detailProduct: product, user: user,)));
                  })
            ],
          ),
        ],
      ),
    );
  }
}