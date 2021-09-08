import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:ginza_coffee_app/main.dart';
import 'package:ginza_coffee_app/screens/admin/admin.dart';
import 'package:ginza_coffee_app/screens/cashier/cashier.dart';
import 'package:ginza_coffee_app/screens/register.dart';
import 'package:ginza_coffee_app/services/auth_services.dart';
import 'package:provider/provider.dart';

import 'user/homescreen.dart';

class Login extends StatefulWidget {

  final Function toggleScreen;

  const Login({Key key, this.toggleScreen}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).primaryColor,),),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "Wellcome back",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: _emailController,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Please input your Email"),
                        EmailValidator(errorText: "Email is invalid"),
                      ]),
                      decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Please input your Password"),
                        MinLengthValidator(6,
                            errorText:
                                "Password must be at least 6 characters long"),
                      ]),
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.vpn_key),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      )
                  ),
                  SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print("Email: ${_emailController.text}");
                        print("Email: ${_passwordController.text}");
                        await loginProvider.login(_emailController.text.trim(), _passwordController.text.trim());
                      }
                    },
                    height: 70,
                    minWidth: loginProvider.isLoading ? null : double.infinity,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child:loginProvider.isLoading 
                      ? CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                      ) 
                      : Text(
                          "Login",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?"),
                      SizedBox(width: 5,),
                      TextButton(
                        onPressed: () => widget.toggleScreen(), 
                        child: Text("Register"))
                    ],
                  ),
                  SizedBox(height: 20,),
                  if (loginProvider.errorMessage != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.amberAccent,
                    child: ListTile(
                      title: Text(loginProvider.errorMessage),
                      leading: Icon(Icons.error),
                      trailing: IconButton(onPressed: () => loginProvider.setMessage(null), icon: Icon(Icons.close)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController password = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference users = firestore.collection('users');

//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//             image: new DecorationImage(
//                 image: new AssetImage('assets/images/coffeebeans2.jpg'),
//                 fit: BoxFit.cover)),
//         child: SingleChildScrollView(
//             child: Column(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height / 2.8,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(50),
//                     topRight: Radius.circular(50)),
//                 color: Color.fromRGBO(27, 27, 27, 1),
//               ),
//               child: Center(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 50),
//                     Text(
//                       "Login",
//                       style: TextStyle(
//                         fontFamily: "Norican",
//                         color: Colors.white,
//                         fontSize: 40,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 40),
//                       child: Form(
//                         key: _formKey,
//                         autovalidate: true,
//                         child: Column(
//                           children: [
//                             // Email

//                             TextFormField(
//                               style: TextStyle(
//                                   color: Color.fromRGBO(224, 210, 199, 1)),
//                               decoration: InputDecoration(
//                                   labelText: "Email",
//                                   labelStyle: TextStyle(
//                                       color: Color.fromRGBO(224, 210, 199, 1),
//                                       fontFamily: "Economica"),
//                                   filled: true,
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 3,
//                                           color:
//                                               Color.fromRGBO(178, 124, 85, 1)),
//                                       borderRadius: BorderRadius.circular(20))),
//                               keyboardType: TextInputType.emailAddress,
//                               validator: MultiValidator([
//                                 RequiredValidator(
//                                     errorText: "Please input your Email"),
//                                 EmailValidator(errorText: "Email is invalid"),
//                               ]),
//                               controller: email,
//                             ),

//                             SizedBox(
//                               height: 20,
//                             ),

//                             // Password

//                             TextFormField(
//                               style: TextStyle(
//                                   color: Color.fromRGBO(224, 210, 199, 1)),
//                               decoration: InputDecoration(
//                                   labelText: "Password",
//                                   labelStyle: TextStyle(
//                                       color: Color.fromRGBO(224, 210, 199, 1),
//                                       fontFamily: "Economica"),
//                                   filled: true,
//                                   enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                           width: 3,
//                                           color:
//                                               Color.fromRGBO(178, 124, 85, 1)),
//                                       borderRadius: BorderRadius.circular(20))),
//                               obscureText: true,
//                               validator: MultiValidator([
//                                 RequiredValidator(
//                                     errorText: "Please input your Password"),
//                                 MinLengthValidator(8,
//                                     errorText:
//                                         "Password must be at least 8 characters long"),
//                               ]),
//                               controller: password,
//                             ),

//                             SizedBox(
//                               height: 30,
//                             ),

//                             // Button

//                             SizedBox(
//                               width: 300,
//                               height: 50,
//                               child: ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     primary: Color.fromRGBO(178, 124, 85, 1),
//                                     elevation: 3,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(30))),
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) {
//                                         return HomeScreen();
//                                       },
//                                     ),
//                                   );
//                                 },
//                                 child: const Text(
//                                   'Submit',
//                                   style: TextStyle(
//                                       fontFamily: "Economica", fontSize: 25),
//                                 ),
//                               ),
//                             ),

//                             SizedBox(
//                               height: 10,
//                             ),

//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   "Don't you have an account ?",
//                                   style: TextStyle(
//                                       fontFamily: "Economica",
//                                       color: Colors.white,
//                                       fontSize: 20),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) {
//                                           return Register();
//                                         },
//                                       ),
//                                     );
//                                   },
//                                   child: Text(
//                                     " Sign Up",
//                                     style: TextStyle(
//                                         fontFamily: "Economica",
//                                         color: Color.fromRGBO(178, 124, 85, 1),
//                                         fontSize: 20),
//                                   ),
//                                 ),
//                               ],
//                             ),

//                             SizedBox(height: 50),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }