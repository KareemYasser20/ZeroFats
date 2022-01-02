import 'package:flutter/material.dart';
class TextFields extends StatelessWidget {

  TextFields({ @required this.onChanged , @required this.hintText , this.controller , this.inputType});


final TextInputType inputType;
  final String hintText;
  final TextEditingController controller;

  final Function onChanged ;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        keyboardType : inputType,
        textAlign: TextAlign.center,
        controller: controller,
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
