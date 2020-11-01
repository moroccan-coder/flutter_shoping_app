import 'package:flutter/material.dart';
import 'package:flutter_shoping/authentication/firebase_auth.dart';
import 'package:flutter_shoping/screens/home.dart';
import 'package:flutter_shoping/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuthentication firebaseAuthentication = FirebaseAuthentication();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Screen"),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Email is required!';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'password',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is required!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              _showLoaderDialog(context);
                              var user = await firebaseAuthentication.signIn(_emailController.text, _passwordController.text).then((value) {
                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Home(),
                                    ));
                              }).catchError((onError) {
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Text("Login"),
                        ),
                        FlatButton(onPressed: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                        }, child: Text("Register"))
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7), child: Text("Login...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
