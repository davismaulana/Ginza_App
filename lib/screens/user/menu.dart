// import 'package:flutter/material.dart';
// import 'detailscreen.dart';

// class Menu extends StatefulWidget {
//   const Menu({Key key}) : super(key: key);

//   @override
//   _MenuState createState() => _MenuState();
// }

// class _MenuState extends State<Menu> {
//   @override
//   Widget build(BuildContext context) {
//     var mediaQueryData = MediaQuery.of(context);
//     final double widthScreen = mediaQueryData.size.width / 5;
//     final double heightScreen = mediaQueryData.size.height / 4;

//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           // Search

//           SizedBox(
//             height: 50,
//             child: TextField(
//               onChanged: null,
//               controller: null,
//               decoration: InputDecoration(
//                   labelText: "Search",
//                   labelStyle: TextStyle(
//                       color: Color.fromRGBO(178, 124, 85, 1),
//                       fontFamily: "Economica",
//                       fontSize: 20),
//                   prefixIcon: Icon(Icons.search),
//                   enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       borderSide: BorderSide(
//                           width: 1, color: Color.fromRGBO(241, 224, 212, 1))),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       borderSide: BorderSide(
//                           width: 1, color: Color.fromRGBO(178, 124, 85, 1))),
//                   filled: true,
//                   fillColor: Color.fromRGBO(224, 210, 199, 1)),
//             ),
//           ),

//           SizedBox(
//             height: 20,
//           ),

//           // List menu

//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 2,
//               crossAxisSpacing: 20,
//               mainAxisSpacing: 20,
//               childAspectRatio: widthScreen / heightScreen,
//               children: [
//                 Container(
//                   padding:
//                       EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
//                   decoration: BoxDecoration(
//                       color: Color.fromRGBO(27, 27, 27, 1),
//                       borderRadius: BorderRadius.all(Radius.circular(20))),
//                   child: Column(
//                     children: [
//                       Container(
//                         child: Image.asset("assets/images/rabusta.png"),
//                       ),
//                       Text(
//                         "Robusta Black Coffee",
//                         style: TextStyle(
//                             fontFamily: "Economica",
//                             color: Colors.white,
//                             fontSize: 20),
//                       ),
//                       Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Rp.15,000",
//                               style: TextStyle(
//                                 fontFamily: "Neuton",
//                                 color: Color.fromRGBO(178, 124, 85, 1),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 GestureDetector(
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         top: 20, left: 20, right: 20, bottom: 10),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(27, 27, 27, 1),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Image.asset("assets/images/coffee-cup-7.png"),
//                         ),
//                         Text(
//                           "Cappuchino Creamy",
//                           style: TextStyle(
//                               fontFamily: "Economica",
//                               color: Colors.white,
//                               fontSize: 20),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Rp.18,000",
//                                 style: TextStyle(
//                                   fontFamily: "Neuton",
//                                   color: Color.fromRGBO(178, 124, 85, 1),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return Detail();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 GestureDetector(
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         top: 20, left: 20, right: 20, bottom: 10),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(27, 27, 27, 1),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Image.asset(
//                               "assets/images/cup-mug-coffee-64.png"),
//                         ),
//                         Text(
//                           "Expresso Creamy Latte",
//                           style: TextStyle(
//                               fontFamily: "Economica",
//                               color: Colors.white,
//                               fontSize: 20),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Rp.20,000",
//                                 style: TextStyle(
//                                   fontFamily: "Neuton",
//                                   color: Color.fromRGBO(178, 124, 85, 1),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return Detail();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 GestureDetector(
//                   child: Container(
//                     padding: EdgeInsets.only(
//                         top: 20, left: 20, right: 20, bottom: 10),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(27, 27, 27, 1),
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Image.asset(
//                               "assets/images/cup-mug-coffee-39.png"),
//                         ),
//                         Text(
//                           "Ristretto Chocolate",
//                           style: TextStyle(
//                               fontFamily: "Economica",
//                               color: Colors.white,
//                               fontSize: 20),
//                         ),
//                         Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Rp18,000",
//                                 style: TextStyle(
//                                   fontFamily: "Neuton",
//                                   color: Color.fromRGBO(178, 124, 85, 1),
//                                 ),
//                               ),
                            
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return Detail();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
