
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/screens/admin/widgets/customers.dart';
import 'package:ginza_coffee_app/screens/admin/widgets/officer.dart';
import 'package:ginza_coffee_app/screens/admin/widgets/orders.dart';
import 'package:ginza_coffee_app/screens/admin/widgets/products.dart';

class Admin extends StatefulWidget {
  const Admin({ Key key }) : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width / 1;
    final double heightScreen = mediaQueryData.size.height / 2;

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 224, 212, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(241, 224, 212, 1),
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color.fromRGBO(27, 27, 27, 1)),
        title: Container(
          width: 150,
          child: Image.asset("assets/images/GinzaAdmin.png")
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(178, 124, 85, 1),
              ),
              child: Text(
                'davismaulana05@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome Davis",
                style: TextStyle(
                  fontFamily: "Economica",
                  fontSize: 40,
                  color: Colors.black
                ),
              ),
            ),

            SizedBox(height: 40,),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: widthScreen / heightScreen,
                children: [

                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Icon(
                            Icons.people, color: Colors.white, size: 50,
                          ),
                          Text(
                            "Officers",
                            style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 40
                            ),
                          )
                        ],
                      )
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OfficerData();
                          },
                        ),
                      );
                    },
                  ),

                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Icon(
                            Icons.fastfood_outlined, color: Colors.white, size: 50,
                          ),
                          Text(
                            "Products",
                            style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 40
                            ),
                          )
                        ],
                      )
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductsData();
                          },
                        ),
                      );
                    },
                  ),

                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Icon(
                            Icons.people_alt_outlined, color: Colors.white, size: 50,
                          ),
                          Text(
                            "Customers",
                            style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 30
                            ),
                          )
                        ],
                      )
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CustomersData();
                          },
                        ),
                      );
                    },
                  ),
                  
                  GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(27, 27, 27, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_basket_outlined, color: Colors.white, size: 50,
                          ),
                          Text(
                            "Orders",
                            style: TextStyle(
                              fontFamily: "Economica",
                              color: Colors.white,
                              fontSize: 30
                            ),
                          )
                        ],
                      )
                    ),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OrdersDetail();
                          },
                        ),
                      );
                    },
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}