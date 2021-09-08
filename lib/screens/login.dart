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
