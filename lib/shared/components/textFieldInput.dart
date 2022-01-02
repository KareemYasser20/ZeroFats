import 'package:flutter/material.dart';

class TextFieldsInput extends StatelessWidget {

  TextFieldsInput({ @required this.onChanged , @required this.hintText , this.controller , this.inputType});


  final TextInputType inputType;
  final String hintText;
  final TextEditingController controller;
  final Function onChanged ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left :15.0 , right: 15.0 ),
      child: TextField(
        obscureText: hintText == 'Password' || hintText == 'Confirm Password' ? true : false ,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            hintText: hintText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
