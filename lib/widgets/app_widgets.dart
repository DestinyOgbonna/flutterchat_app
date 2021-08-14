import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';


Widget appBarMain(){
  return AppBar(
 title: Text('Chat', style: GoogleFonts.montserrat(fontWeight:FontWeight.w600),),
  );
}

InputDecoration textFormFields(String hintText){
  return InputDecoration(
      hintText: hintText, hintStyle: GoogleFonts.montserrat(color:const Color(0xff9af3f0f0)),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color:Colors.white30),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white30),
      )
  );
}
TextStyle textStyling(){
  return  GoogleFonts.montserrat(
  color:Colors.white, fontWeight: FontWeight.w300, fontSize: 15,
  );
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}