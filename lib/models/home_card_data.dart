import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardData{

  CardData({this.icon , this.title , this.onTap});

  final AssetImage icon;
  final String title;
  final Function onTap;

}