import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/cashier/widgets/detailpayment.dart';

class Payment extends StatefulWidget {
  const Payment({ Key key }) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            alignment: Alignment.topLeft,
            child: Text(
              "Payment",
              style: TextStyle(
                fontFamily: "Economica",
                color: Colors.black,
                fontSize: 30
              ),
            ),
          ),

          SizedBox(height: 20,),

          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: Color.fromRGBO(27, 27, 27, 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Number Table",
                    style: TextStyle(
                      fontFamily: "Economica",
                      color: Colors.white,
                      fontSize: 30
                    ),
                  ),

                  Text(
                    "23",
                    style: TextStyle(
                      fontFamily: "Economica",
                      color: Colors.white,
                      fontSize: 30
                    ),
                  ),
                ],
              ),
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPayment();
                  },
                ),
              );
            },
          ),

          SizedBox(height: 10,),

          
        ],
      ),
    );
  }
}