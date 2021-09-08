
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/admin/widgets/officerprofile.dart';

class OfficerData extends StatefulWidget {
  const OfficerData({ Key key }) : super(key: key);

  @override
  _OfficerDataState createState() => _OfficerDataState();
}

class _OfficerDataState extends State<OfficerData> {
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
                  "Officers",
                  style: TextStyle(
                    fontFamily: "Economica",
                    color: Colors.black,
                    fontSize: 40
                  ),
                ),
              ),

              SizedBox(height: 30,),

              GestureDetector(
                child: Container(
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
                          image: DecorationImage(image: AssetImage("assets/images/chrisdavis.jpg"), fit: BoxFit.cover),
                          color: Colors.white
                          
                        )
                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 170,
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                "Christ Davis",
                                style: TextStyle(
                                  fontFamily: "Economica",
                                  color: Colors.white,
                                  fontSize: 30
                                ),
                                textAlign: TextAlign.center
                              ),
                            ),

                            Container(
                              child: Text(
                                "Cashier",
                                style: TextStyle(
                                  fontFamily: "Economica",
                                  color: Color.fromRGBO(178, 124, 85, 1),
                                  fontSize: 20
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    
                    ],
                  ),
                ),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OfficerProfile();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        label: const Text('Add Officer', style: TextStyle(fontFamily: "Economica", fontSize: 25),),
        icon: const Icon(Icons.add),
        backgroundColor: Color.fromRGBO(178, 124, 85, 1),
      ),
    );
  }
}