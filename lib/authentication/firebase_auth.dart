import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shoping/user/userr.dart';

class FirebaseAuthentication {
  FirebaseAuth _auth = FirebaseAuth.instance;



  Future<void> signOut() async {
     _auth.signOut();
  }

  Future<User> getCurrentUser() async{
    User user = await _auth.currentUser;
    print(user);
    return user;
  }

  Future<User> signIn(String email, String password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future<User> register(String email, String password) async {
   UserCredential userCredential  = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }
}
