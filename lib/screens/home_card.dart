import 'package:flutter/material.dart';
import 'package:zerofats/constants.dart';
import 'package:zerofats/models/home_card_data.dart';

class HomeCard extends StatelessWidget{

  HomeCard ({this.card});

  final CardData card;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: GestureDetector(
          onTap: card.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: card.icon,
                color: Colors.black54,
                width: 50.0,
                height: 50.0,
              ),
              SizedBox(height: 10.0,),
              Text(card.title, style: TextStyle(
                color: kDarkBlueColor,
                fontSize: 18.0,
              ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
