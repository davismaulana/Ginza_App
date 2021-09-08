
import 'package:flutter/material.dart';

class OfficerProfile extends StatefulWidget {
  const OfficerProfile({ Key key }) : super(key: key);

  @override
  _OfficerProfileState createState() => _OfficerProfileState();
}

class _OfficerProfileState extends State<OfficerProfile> {
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
                  "Officer Profile",
                  style: TextStyle(
                    fontFamily: "Economica",
                    color: Colors.black,
                    fontSize: 40
                  ),
                ),
              ),

              SizedBox(height: 30,),
              
              Container(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/images/chrisdavis.jpg"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: 400,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(27, 27, 27, 1),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [

                    // Name

                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Name     : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Economica",
                              fontSize: 30
                            ),
                          ),

                          Container(
                            width: 180,
                            child: Text(
                              "Christ Davis",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Economica",
                                fontSize: 30
                              ),
                            ),
                          ),
                        ],
                      )
                    ),

                    SizedBox(height: 10,),

                    // Email

                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Email     : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Economica",
                              fontSize: 30
                            ),
                          ),

                          Container(
                            width: 180,
                            child: Text(
                              "christdavis@gmail.com",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Economica",
                                fontSize: 30
                              ),
                            ),
                          ),
                        ],
                      )
                    ),

                    SizedBox(height: 10,),

                    // Address

                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Address : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Economica",
                              fontSize: 30
                            ),
                          ),

                          Container(
                            width: 180,
                            child: Text(
                              "Downtown",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Economica",
                                fontSize: 30
                              ),
                            ),
                          ),
                        ],
                      )
                    ),

                    SizedBox(height: 10,),

                    // Job

                    Container(
                      child: Row(
                        children: [
                          Text(
                            "Job         : ",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Economica",
                              fontSize: 30
                            ),
                          ),

                          Container(
                            width: 180,
                            child: Text(
                              "Chasier",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Economica",
                                fontSize: 30
                              ),
                            ),
                          ),
                        ],
                      )
                    ),

                    SizedBox(height: 10,),

                  ],
                ),
              ),

              SizedBox(height: 20,),

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
                          "Delete Officer",
                          style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      )
                    )
                  ),
            ],
          ),
        ),
      ),
    );
  }
}