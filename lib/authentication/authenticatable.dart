import 'package:flutter_shoping/user/userr.dart';

class Authenticatable{


 Future<Userr> register(String email,String password){}

  Future<bool> login(String email,String password){}

  Future<bool> resetPassword(String email){}

  Future<Userr> updateProfile(Userr user){}

}