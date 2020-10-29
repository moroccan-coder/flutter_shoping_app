import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoping/admin/add_product.dart';
import 'package:flutter_shoping/admin/products.dart';
import 'package:flutter_shoping/authentication/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: AuthTest(),
    );
  }
}

class AuthTest extends StatefulWidget {
  @override
  _AuthTestState createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {

  @override
  Widget build(BuildContext context) {
    return AddProduct();
  }
}
















/*
* Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               /* Text(
                  "Register",
                  style: TextStyle(fontSize: 28),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    var user = await firebaseAuthentication.register(_emailController.text, _passwordController.text);

                    print('\n\n\n\n $user \n\n\n\n');
                  },
                  child: Text("Register"),
                ),
                SizedBox(height: 16,),*/

                Text(
                  "SigIn",
                  style: TextStyle(fontSize: 28),
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password',
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    var user = await firebaseAuthentication.signIn(_emailController.text, _passwordController.text);

                    print('\n\n\n\n $user \n\n\n\n');
                  },
                  child: Text("SignIn"),
                ),
                SizedBox(height: 16,),



                RaisedButton(
                  onPressed: () async {
                    firebaseAuthentication.signOut();
                  },
                  child: Text("SignOut"),
                )
              ],
            ),
          ),
        ),
      )
* */
