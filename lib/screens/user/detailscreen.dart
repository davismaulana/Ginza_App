import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/cashier/widgets/order.dart';
import 'cart.dart';

class Detail extends StatefulWidget {
  final User user;

  DocumentSnapshot detailProduct;
  Detail({
    this.detailProduct,
    this.user,
  });

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference CartUser = firestore.collection("cart_user");

    Future<void> addCart() {
      return CartUser.add({
        'user_id': widget.user.uid,
        'product_name': widget.detailProduct["product_name"],
        'price': widget.detailProduct["price"],
      }).whenComplete(() => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return Cart(user: widget.user,);
              },
            ),
          ));
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(27, 27, 27, 1)),
        title: Container(
            width: 150, child: Image.asset("assets/images/titledake.png")),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(27, 27, 27, 1),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromRGBO(27, 27, 27, 1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(
                      user: widget.user,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 250,
                  child: Image(
                    image: NetworkImage(widget.detailProduct["image"]),
                    fit: BoxFit.cover, 
                  )
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.detailProduct["product_name"],
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Rp. ${widget.detailProduct['price']}",
                          style: TextStyle(
                              fontFamily: "Neuton",
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color.fromRGBO(178, 124, 85, 1),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {
                              addCart();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                                bottom: 15,
                              ),
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontFamily: "Neuton",
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 15,
                ),

                // Description

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description",
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Color.fromRGBO(27, 27, 27, 1),
                              fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.detailProduct["description"],
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
