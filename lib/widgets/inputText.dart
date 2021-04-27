import 'package:flutter/material.dart';
class TextFields extends StatelessWidget {

  TextFields({ @required this.onChanged , @required this.hintText , this.controller , this.inputType});


final TextInputType inputType;
  final String hintText;
  final TextEditingController controller;

  // String _ErrorMessage (String str){
  //   switch(hintText)
  //   {
  //     case 'Enter your Name' : return 'please enter your name';
  //     case 'Enter your Email' : return 'please enter your E-mail';
  //     case 'Enter your Password' : return 'please enter your password';
  //   }
  // }
  final Function onChanged ;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        keyboardType : inputType,
        textAlign: TextAlign.center,
        controller: controller,
        // validator: (value)
        // {
        //   if(value.isEmpty){
        //     return _ErrorMessage(hintText);
        //   }
        //
        // },
        onChanged: onChanged,
        obscureText: hintText == 'Enter your Password' ? true : false ,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            hintText: hintText
        ),

      ),
      );
  }
}
