import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {

  RadioWidget({@required this.onChanged , @required genderType , @required this.selectGender});

final Function onChanged ;
// 0 for male , 1 for female
 int genderType;
final String selectGender;


  @override
  Widget build(BuildContext context) {
    List gender=["Male","Female"];
    return Radio(
      activeColor: Colors.white,
      value: gender[genderType],
      groupValue: selectGender,
      onChanged: onChanged,
    );
  }
}
