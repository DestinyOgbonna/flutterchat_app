import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterchat_app/screens/sign_up.dart';
// import 'package:flutterchat_app/Aunthications/authenticate.dart';
import 'package:flutterchat_app/widgets/app_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  // final Function? toggle;

 // const SignIn(void Function() toggleView, {Key? key,}) : super(key: key);

  const SignIn( {Key? key,}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: appBarMain()),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 150,),

                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text('Sign In', style: GoogleFonts.montserrat(fontSize: 39,
                      fontWeight: FontWeight.w700, color: Colors.white)),
                ),

                const SizedBox(height: 190),

                TextFormField(
                  style: textStyling(),
                  decoration: textFormFields('email'),
                ),

                const SizedBox(height: 5,),
                TextFormField(
                  style: textStyling(),
                  decoration: textFormFields('password'),
                ),
                const SizedBox(height: 5,),
                const SizedBox(
                  height: 19,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: GoogleFonts.montserrat(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),

                //buttons
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                //buttons
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Sign in with Google',
                      style: GoogleFonts.montserrat(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 13,),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account?", style: textStyling(),),
                      GestureDetector(
                        onTap: (){
                          // widget.toggle!();
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                        },
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                           padding: EdgeInsets.symmetric(horizontal: 13),
                          child: Text('Register now.', style: GoogleFonts.montserrat(
                            decoration: TextDecoration.underline,color: Colors.blueAccent,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),]
      ),


          ),
        ));
  }
}
