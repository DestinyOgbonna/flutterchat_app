import 'package:flutter/material.dart';
import 'package:flutterchat_app/screens/chatroom_screen.dart';
import 'package:flutterchat_app/screens/sign_in.dart';
// import 'package:flutterchat_app/Aunthications/authenticate.dart';
import 'package:flutterchat_app/services/auth.dart';
import 'package:flutterchat_app/services/database.dart';
import 'package:flutterchat_app/widgets/app_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  // final Function? toggle;
  // const SignUp(void Function() toggleView, {Key? key, this.toggle}) : super(key: key);
  const SignUp({Key? key,}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // instantiating the auth configurations to have access to them

  AuthMethods authMethods = AuthMethods();

  // instantiating the database auth to accept details inputted in the signUp Screen
  DataBaseMethods dataBaseMethods = DataBaseMethods();

//bool isregistered = false;
  bool isloading = false;

// a key to validate the forms
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  signUpUser() {
    //================= creating a form key for form validation  Start==================
    if (formKey.currentState!.validate()) {
      //=====Storing registered user details to  Database Start ==================

      //string dataType was used because the values in the database is a string.
      // if not string we use dynamic  to access the listing of different dataTypes

      Map<String, String> userInfoMap = {
        'name': usernameTextEditingController.text,
        'email': emailTextEditingController.text,
      };

      //=====Storing registered user details to  Database End ==================

      //setting the state of the circular loading bar
      setState(() {
        isloading = true;
        // isregistered = true;
      });
      //================= creating a form key for form validation  End==========

      //======== Signing up User to database  Start======================
      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text, context)
          .then((val) {
        //print('${val.uid}');
        displayToastMessage('Registration Successful', context);

        //Calling up the Created userinfoMap to store the values start===
        dataBaseMethods.uploadUserInfo(userInfoMap);
        //Calling up the Created userinfoMap to store the values End===
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const ChatPage()));

        //======== Signing up User to database  End======================
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: appBarMain()),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const SizedBox(
                height: 130,
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text('Sign Up',
                    style: GoogleFonts.montserrat(
                        fontSize: 39,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        if (val!.isEmpty || val.length < 4) {
                          return 'Must be at least 5 characters';
                        } else {
                          return null;
                        }
                      },
                      controller: usernameTextEditingController,
                      style: textStyling(),
                      decoration: textFormFields('username'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_"
                                r"`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)) {
                          return null;
                        } else {
                          return 'Invalid Email';
                        }
                      },
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      style: textStyling(),
                      decoration: textFormFields('email'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 6) {
                          return null;
                        } else {
                          return 'Password must be atleast 6 characters';
                        }
                      },
                      controller: passwordTextEditingController,
                      obscureText: true,
                      style: textStyling(),
                      decoration: textFormFields('password'),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                  ],
                ),
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
              GestureDetector(
                onTap: () {
                  signUpUser();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                    //circular loader appears when signup button is clicked
                    // ignore: avoid_unnecessary_containers
                    child: isloading
                        ? Container(
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: Colors.white,
                            )),
                          )
                        : Text(
                            'Sign Up',
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              //buttons
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      'Sign Up with Google',
                      style: GoogleFonts.montserrat(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Have an account?",
                      style: textStyling(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                        // widget.toggle!();
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ]),
          ),
        ));
  }
}
