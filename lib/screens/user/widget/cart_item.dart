import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String productName;
  final int price;
  DocumentSnapshot docToDelete;

  CardItem({Key key, this.productName, this.price, this.docToDelete}) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  int count = 1;
  double get subtotal => (widget.price ?? 0.0) * (count ?? 1);

  @override
  Widget build(BuildContext context) { 
    
    return Container(
      width: 400,
      margin: EdgeInsets.only(bottom: 20),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: Color.fromRGBO(27, 27, 27, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          // Coffee name

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.productName,
                  style: TextStyle(
                      fontFamily: "Economica", color: Colors.white, fontSize: 30),
                ),
              ),

              GestureDetector(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                onTap: (){
                  widget.docToDelete.reference.delete();
                },
              )
              
            ],
          ),

          SizedBox(
            height: 20,
          ),

          // Price

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontFamily: "Neuton",
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Text(
                "Rp. ${widget.price.toString()}",
                style: TextStyle(
                    fontFamily: "Neuton",
                    color: Color.fromRGBO(178, 124, 85, 1),
                    fontSize: 20),
              ),
            ],
          ),

          SizedBox(
            height: 10,
          ),

          // Quantity

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Quantity",
                style: TextStyle(
                  fontFamily: "Neuton",
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(178, 124, 85, 1),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (count > 1) {
                            count--;
                          }
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        count.toString(),
                        style: TextStyle(
                          fontFamily: "Neuton",
                          color: Color.fromRGBO(178, 124, 85, 1),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color.fromRGBO(178, 124, 85, 1),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}