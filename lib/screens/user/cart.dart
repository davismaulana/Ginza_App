import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/login.dart';
import 'package:ginza_coffee_app/screens/user/ordersuccess.dart';
import 'package:ginza_coffee_app/screens/user/widget/cart_item.dart';


class Cart extends StatefulWidget {

  final User user;

  const Cart({Key key, this.user}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  int count = 1;

  @override
  Widget build(BuildContext context) {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference CartUser = firestore.collection("cart_user"); 

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(27, 27, 27, 1)),
        title: Container(
          width: 150,
          child: Image.asset("assets/images/titledake.png")
        ),
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(27, 27, 27, 1),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "My Cart",
                  style: TextStyle(
                      fontFamily: "Economica",
                      color: Color.fromRGBO(27, 27, 27, 1),
                      fontSize: 35),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Cart Item

              StreamBuilder(
                stream: CartUser.where("user_id", isEqualTo: widget.user.uid).snapshots(), 
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }else if(!snapshot.hasData){
                    return Center(
                      child: Text("No data"),
                    );
                  }else{
                    return Column(
                      children: snapshot.data.docs.map((e) =>  
                        CardItem(productName: e["product_name"], price: e["price"],)
                      ).toList(),
                    );
                  }
                },
              ),

              

              SizedBox(
                height: 10,
              ),

              // Table Number

              Container(
                width: 400,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(224, 210, 199, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Table Number",
                      style: TextStyle(
                          fontFamily: "Neuton",
                          color: Color.fromRGBO(27, 27, 27, 1),
                          fontSize: 25),
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      child: TextField(
                        textAlign: TextAlign.center,
                        onChanged: null,
                        controller: null,
                        decoration: InputDecoration(
                          hintText: "Input here",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontFamily: "Neuton",
                              fontSize: 20),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(178, 124, 85, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(178, 124, 85, 1))),
                          filled: true,
                        ),
                        style: TextStyle(
                            color: Color.fromRGBO(178, 124, 85, 1),
                            fontFamily: "Neuton",
                            fontSize: 25),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              // Total pay

              Container(
                width: 400,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(178, 124, 85, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Pay",
                      style: TextStyle(
                          fontFamily: "Neuton", color: Color.fromRGBO(27, 27, 27, 1), fontSize: 25),
                    ),
                    Text(
                      "Rp.30.000",
                      style: TextStyle(
                          fontFamily: "Neuton", color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
              
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Pay at the ",
                      style: TextStyle(
                        fontFamily: "Neuton",
                        fontSize: 18
                      ),
                    ),
                    Text(
                      "Cashier",
                      style: TextStyle(
                        fontFamily: "Neuton",
                        fontSize: 18,
                        color: Color.fromRGBO(178, 124, 85, 1)
                      ),
                    )
                  ],
                )
              ),

              SizedBox(height: 30,),

              // Button

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // Buy button

                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(224, 210, 199, 1),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                      
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 15,
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontFamily: "Economica",
                                color: Color.fromRGBO(178, 124, 85, 1),
                                fontSize: 20),
                          ),
                        )),
                  ),

                  // Cancel button

                  Container(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(27, 27, 27, 1),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderSuccess();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: 10,
                            bottom: 15,
                          ),
                          child: Text(
                            "Order",
                            style: TextStyle(
                                fontFamily: "Economica",
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        )),
                  ),

                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
