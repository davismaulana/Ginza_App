import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
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
                width: 150, child: Image.asset("assets/images/GinzaAdmin.png")),
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(27, 27, 27, 1),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            )),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Product Detail",
                    style: TextStyle(
                        fontFamily: "Economica",
                        color: Colors.black,
                        fontSize: 40),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/rabusta.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(27, 27, 27, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      // Product Name

                      Container(
                        child: Text(
                          "Rabusta Black Coffee",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Economica",
                              fontSize: 30
                          ),
                          textAlign: TextAlign.center
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      // Price

                      Container(
                        child: Text(
                          "Rp.15,000,00",
                          style: TextStyle(
                              color: Color.fromRGBO(178, 124, 85, 1),
                              fontFamily: "Economica",
                              fontSize: 30
                          ),
                          textAlign: TextAlign.center
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                // Button delete

                Container(
                    width: 400,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
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
                            "Delete Product",
                            style: TextStyle(
                                fontFamily: "Economica",
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}
