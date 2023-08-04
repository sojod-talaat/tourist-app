import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather_project/firabase/firestore.dart';
import 'package:weather_project/models/user_model.dart';
import 'package:weather_project/utils/Approuat.dart';

class AuthFirebaseHelper {
  AuthFirebaseHelper._();

  static AuthFirebaseHelper authhelper = AuthFirebaseHelper._();

  FirebaseAuth _auth = FirebaseAuth.instance;
//SIGNUP:
  Future<UserCredential?> SignUp(String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {}
  }

//SIGNING:
  Future<UserCredential?> signin(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //checks
  checkUser(BuildContext context) async {
    User? user = _auth.currentUser;
    if (user == null) {
      Navigator.pushNamed(context, AppRouat.login);
      //NavigateTo(router: WelcomeScreen());
    } else {
      Navigator.pushNamed(context, AppRouat.home);
    }
  }

  //snout
  signout(BuildContext context) async {
    print('object');
    print(_auth.currentUser!.uid);
    await _auth.signOut();
  }

  String getCurrentUse() {
    return _auth.currentUser!.uid;
  }
}
