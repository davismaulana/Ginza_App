import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/models/product_model.dart';
import 'package:ginza_coffee_app/screens/user/detailscreen.dart';
import 'package:ginza_coffee_app/screens/user/widget/products.dart';
import 'package:ginza_coffee_app/services/auth_services.dart';
import 'package:provider/provider.dart';
import 'cart.dart';


class HomeScreen extends StatefulWidget {

  final User user;

  const HomeScreen({Key key, this.user, }) : super(key: key); 


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String imgPath;

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<AuthServices>(context);

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection("products");

    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width / 4;
    final double heightScreen = mediaQueryData.size.height / 6;

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
        actions: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Color.fromRGBO(27, 27, 27, 1),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Cart(user: widget.user,);
                  },
                ),
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: Text(widget.user.email),
              decoration: BoxDecoration(
                color: Color.fromRGBO(178, 124, 85, 1),
              ),
            ),
           
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async => await loginProvider.logout(),
            ),
          ],
        ),
      ),
      body: Container(
          child: ProductsWidget()
        // StreamBuilder(
        //   stream: products.snapshots(),
        //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
        //     return GridView.builder(
        //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //         crossAxisCount: 2,
        //         crossAxisSpacing: 20,
        //         mainAxisSpacing: 20,
        //         childAspectRatio: widthScreen / heightScreen,
        //       ),
        //       itemCount: snapshot.hasData?snapshot.data.docs.length:0, 
        //       itemBuilder: (_,index){
        //         return GestureDetector(
        //           child: Container(
        //             padding:
        //                 EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        //             decoration: BoxDecoration(
        //                 color: Color.fromRGBO(27, 27, 27, 1),
        //                 borderRadius: BorderRadius.all(Radius.circular(20))),
        //             child: Column(
        //               children: [
        //                 Container(
        //                   child: Image(
        //                     image: NetworkImage(snapshot.data.docs[index]["image"]),
        //                     fit: BoxFit.cover,
        //                   )
        //                 ),
        //                 Container(
        //                   alignment: Alignment.topLeft,
        //                   child: Text(
        //                     "${snapshot.data.docs[index]['product_name']}",
        //                     style: TextStyle(
        //                         fontFamily: "Economica",
        //                         color: Colors.white,
        //                         fontSize: 20,
                                
        //                       ),
        //                   ),
        //                 ),
        //                 Container(
        //                   child: Row(
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Text(
        //                         "Rp. ${snapshot.data.docs[index]['price']}",
        //                         style: TextStyle(
        //                           fontFamily: "Neuton",
        //                           color: Color.fromRGBO(178, 124, 85, 1),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //           onTap: (){
        //             Navigator.push(context, MaterialPageRoute(builder: (_)=>Detail(detailProduct: snapshot.data.docs[index], user: widget.user,)));
        //           },
        //         );
        //       }
        //     );
        //   }
        // ),
      ),
      
    );
  }
  
}
