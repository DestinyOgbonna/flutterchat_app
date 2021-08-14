import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/model/user.dart';
import 'package:flutterchat_app/screens/chatroom_screen.dart';
import 'package:flutterchat_app/screens/sign_up.dart';
import 'package:flutterchat_app/widgets/app_widgets.dart';

class AuthMethods {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Users? _userFromFirebaseUser(User? user) {
    return user != null ? Users(userId: user.uid) : null;
  }

  Future signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = credential.user;
      displayToastMessage('Login Successful', context);
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      // ignore: avoid_print
     // print(e);
      displayToastMessage('Error' + e.toString(), context);
    }
  }

  Future signUpWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? firebaseUser = credential.user;
     // displayToastMessage('Registration Successful', context);
      return _userFromFirebaseUser(firebaseUser);

    } catch (e) {
      // ignore: avoid_print
      displayToastMessage('Error' + e.toString(), context);
      // ignore: unnecessary_null_comparison
      if(e != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUp()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ChatPage()));
      }

    }
  }

// ignore: non_constant_identifier_names
  Future ResetPass(String email, BuildContext context) async {
    try {
      return await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // ignore: avoid_print
      displayToastMessage('Error' + e.toString(), context);
     // print(e.toString());
    }
  }

  Future signOut(BuildContext context) async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      // ignore: avoid_print
      // print(e.toString());
      displayToastMessage('Error' + e.toString(), context);
    }
  }
}

