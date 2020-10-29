
import 'dart:async';

import 'package:flutter_shoping/authentication/authenticatable.dart';
import 'package:flutter_shoping/user/userr.dart';

class FirebaseAuthenticationController implements Authenticatable{


 

  @override
  Future<bool> login(String email, String password) {
    // TODO: implement Login
    throw UnimplementedError();
  }

  @override
  Future<Userr> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }


  @override
  Future<Userr> updateProfile(Userr user) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }




}