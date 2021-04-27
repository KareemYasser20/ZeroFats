import 'package:flutter/material.dart';

class HomeBarColumn extends StatelessWidget {

  HomeBarColumn({@required this.textValue , @required this.text });

  final String textValue;
  final String text;
  // final Color colour;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(textValue ,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 24.0,
          ),
        ),
        SizedBox(height: 8.0,),
        Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.green.shade400,
          ),
        ),
      ],
    );
  }
}