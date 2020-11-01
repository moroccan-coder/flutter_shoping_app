import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoping/authentication/firebase_auth.dart';
import 'package:flutter_shoping/screens/home.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splash> {
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FlutterLogo(
              size: 150,
            ),
          ),
        ],
      ),
    );
  }



  Future getCurrentUser() async {
    User _user = await FirebaseAuth.instance.currentUser;

    if(_user ==null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        },));
      }
    else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Home();
      },));
    }
  }
}
