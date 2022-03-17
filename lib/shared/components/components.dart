import 'package:flutter/material.dart';

import '../../constants.dart';

Widget defaultButton ({
  double width = 130.0,
  double height = 90.0,
  Color background = kDarkBlueColor,
  @required Function function,
  @required String text,
  @required double radius,
  double padding = 35.0,
  
}) => Container(
  width: width,
  height: height,
  child: Padding(
    padding:  EdgeInsets.only(top:padding),
    child: RaisedButton(
      textColor: Colors.white,
      color: background,
      child: Text(text,
        style: TextStyle(
          fontSize: 24.0,
        ),

      ),
      shape:  RoundedRectangleBorder(
        borderRadius:  BorderRadius.circular(radius),
      ),
      onPressed: function,
    ),
  ),
);

Widget defaultAskText ({
  Color textColor = kDarkBlueColor,
}) => Text('you aren\'t a member?',
  style: TextStyle(
    fontSize: 14.0,
    color: textColor,
  ),
);

Widget defaultRegisterButton({
  @required Function function,
  String text ='Register',
  Color textColor = KGreenColor,
}) => FlatButton(
  child: Text(text ,
    style: TextStyle(
      fontSize: 14.0,
      color: textColor,
    ),
  ),
  onPressed: function,
);


Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onchange,
  bool isPassword = false,
  IconData suffix,
  @required Function validate,
  @required String labelText,
  // @required IconData prefixIcon,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  textAlign: TextAlign.center,
  onChanged: onchange,
  obscureText: isPassword,
  validator: validate,

  decoration: KTextFieldDecoration.copyWith(
          hintText: labelText,
      ),
);