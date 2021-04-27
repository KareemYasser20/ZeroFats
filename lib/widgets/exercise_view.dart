import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {

  ExerciseView({this.exerciseImageURL , this.exerciseName , this.exerciseTime});

  String exerciseImageURL;
  String exerciseName;
  String exerciseTime;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Image(
            image: NetworkImage(exerciseImageURL),
          width: 100.0,
          height: 100.0,
        ),
        Column(
          children: <Widget>[
            Text(exerciseName
              , style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),

            Text('$exerciseTime Second '
              , style: TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],

    );
  }
}
