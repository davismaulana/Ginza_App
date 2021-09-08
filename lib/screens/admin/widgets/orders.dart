import 'package:flutter/material.dart';

class OrdersDetail extends StatefulWidget {
  const OrdersDetail({ Key key }) : super(key: key);

  @override
  _OrdersDetailState createState() => _OrdersDetailState();
}

class _OrdersDetailState extends State<OrdersDetail> {
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
        )
          
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Orders Detail",
                  style: TextStyle(
                    fontFamily: "Economica",
                    color: Colors.black,
                    fontSize: 40
                  ),
                ),
              ),

              SizedBox(height: 30,),

              // Table

              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(27, 27, 27, 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                      ),
                      child: Row(
                        children: [
                          Container(
                            width:130,
                            child: Text(
                              "Product",
                              style: TextStyle(
                                fontFamily: "Economica",
                                color: Colors.white,
                                fontSize: 20
                              ),
                            ),
                          ),

                          Container(
                            width: 60,
                            child: Text(
                              "Quantity",
                              style: TextStyle(
                                fontFamily: "Economica",
                                color: Colors.white,
                                fontSize: 20
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          Container(
                            width: 90,
                            child: Text(
                              "Total",
                              style: TextStyle(
                                fontFamily: "Economica",
                                color: Colors.white,
                                fontSize: 20
                              ),
                              textAlign: TextAlign.right,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: Colors.white
                      ),
                      child: Column(
                        children: [

                          // Data order

                          Row(
                            children: [
                              Container(
                                width:130,
                                child: Text(
                                  "Robusta Black Coffee",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                ),
                              ),

                              Container(
                                width: 60,
                                child: Text(
                                  "10",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black54,
                                    fontSize: 20
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              Container(
                                width: 90,
                                child: Text(
                                  "Rp.150,000",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),

                          SizedBox(height: 10,),  

                          Row(
                            children: [
                              Container(
                                width:130,
                                child: Text(
                                  "Cappuccino",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                ),
                              ),

                              Container(
                                width: 60,
                                child: Text(
                                  "100",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black54,
                                    fontSize: 20
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),

                              Container(
                                width: 90,
                                child: Text(
                                  "Rp.3,000,000",
                                  style: TextStyle(
                                    fontFamily: "Economica",
                                    color: Colors.black,
                                    fontSize: 20
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              )
                            ],
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(width: 1.0, color: Colors.black12)
                              )
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Total - ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: "Economica",
                                  fontSize: 20
                                ),
                              ),

                              Text(
                                "Rp.3,150,000",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Economica",
                                  fontSize: 30
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Clear Orders', style: TextStyle(fontFamily: "Economica", fontSize: 25),),
        icon: const Icon(Icons.delete_forever),
        backgroundColor: Colors.red,
      ),
    );
  }
}