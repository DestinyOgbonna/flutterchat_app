// import 'package:flutter/material.dart';
// import 'package:flutterchat_app/screens/sign_in.dart';
// import 'package:flutterchat_app/screens/sign_up.dart';
//
// class AuthenticateWidget extends StatefulWidget {
//   const AuthenticateWidget({Key? key}) : super(key: key);
//
//   @override
//   _AuthenticateWidgetState createState() => _AuthenticateWidgetState();
// }
//
// class _AuthenticateWidgetState extends State<AuthenticateWidget> {
//   bool showSignIn = true;
//
//   void toggleView(){
//     setState(() {
//       showSignIn = !showSignIn;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (showSignIn) {
//       return SignIn(toggleView, toggle: null,);
//     } else {
//       return  SignUp(toggleView);
//     }
//   }
// }
