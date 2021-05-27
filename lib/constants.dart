import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kDarkBlueColor = Color(0xFF2F4858);
const kUserCollection = 'Users';
const kUserBMI = 'BMi';
const kUserBirthYear ='BirthYear';
const kUserEmail ='Email';
const kUserGender ='Gender';
const kUserHeight='Height';
const kUserSteps = 'Steps';
const kUserId = 'UserID';
const kUserWeight='Weight';
const kUserName = 'name';
const KUserBmiCategory = 'bmiCategory';

const KTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  filled: true,
  fillColor: Colors.white,
  contentPadding:
  EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0 , right: 14.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  // UnderlineInputBorder
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(25.7)), //25.7
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(25.7)), // 25.7
  ),
);