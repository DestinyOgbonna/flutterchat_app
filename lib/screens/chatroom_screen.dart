import 'package:flutter/material.dart';
import 'package:flutterchat_app/screens/search.dart';
// import 'package:flutterchat_app/Aunthications/authenticate.dart';
import 'package:flutterchat_app/screens/sign_in.dart';
import 'package:flutterchat_app/services/auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //instantiating auth methods
  AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Chat', style: GoogleFonts.montserrat(fontWeight:FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut(context);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=> const SignIn()));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Icon(Icons.exit_to_app),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const  SearchScreen()));
        },
        child: const Icon(Icons.search),

      ),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(

          child:const Text('Chat Room'),
        ),
      ),
    );
  }
}
