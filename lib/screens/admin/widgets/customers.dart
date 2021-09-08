import 'package:flutter/material.dart';

class CustomersData extends StatefulWidget {
  const CustomersData({ Key key }) : super(key: key);

  @override
  _CustomersDataState createState() => _CustomersDataState();
}

class _CustomersDataState extends State<CustomersData> {
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
                  "Customers (2)",
                  style: TextStyle(
                    fontFamily: "Economica",
                    color: Colors.black,
                    fontSize: 40
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Container(
                  padding:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(20), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(20))
                  ),
                  child: Row(
                    children: [

                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white
                          
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 40,
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 170,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Rinrin",
                                style: TextStyle(
                                  fontFamily: "Economica",
                                  color: Colors.white,
                                  fontSize: 30
                                ),
                                textAlign: TextAlign.center
                              ),
                            ),
                          ],
                        ),
                      )
                    
                    ],
                  ),
              ),

              SizedBox(height: 10,),

              Container(
                  padding:EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(27, 27, 27, 1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(20), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(20))
                  ),
                  child: Row(
                    children: [

                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white
                          
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.black54,
                          size: 40,
                        ),
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 170,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Rinrin",
                                style: TextStyle(
                                  fontFamily: "Economica",
                                  color: Colors.white,
                                  fontSize: 30
                                ),
                                textAlign: TextAlign.center
                              ),
                            ),
                          ],
                        ),
                      )
                    
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Clear Customers', style: TextStyle(fontFamily: "Economica", fontSize: 25),),
        icon: const Icon(Icons.delete_forever),
        backgroundColor: Colors.red,
      ),
    );
  }
}