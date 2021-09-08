import 'package:flutter/material.dart';

class DetailCashier extends StatefulWidget {
  const DetailCashier({Key key}) : super(key: key);

  @override
  _DetailCashierState createState() => _DetailCashierState();
}

class _DetailCashierState extends State<DetailCashier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(27, 27, 27, 1)),
        title: Container(
            width: 150, child: Image.asset("assets/images/GinzaCashier.png")),

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
      
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Table Number 23",
                  style: TextStyle(
                      fontFamily: "Economica",
                      color: Colors.black,
                      fontSize: 40),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Order

              Container(
                alignment: Alignment.topLeft,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Robusta Black Coffee",
                        style: TextStyle(
                            fontFamily: "Economica",
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              fontFamily: "Neuton",
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontSize: 25),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                alignment: Alignment.topLeft,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        "Robusta Black Coffee",
                        style: TextStyle(
                            fontFamily: "Economica",
                            color: Colors.white,
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 25),
                        ),
                        Text(
                          "2",
                          style: TextStyle(
                              fontFamily: "Neuton",
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontSize: 25),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),

              // Button

              Container(
                  width: 400,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 15,
                        ),
                        child: Text(
                          "Ready to deliver",
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
