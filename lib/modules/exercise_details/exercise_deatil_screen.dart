import 'package:flutter/material.dart';
import 'package:zerofats/models/exercise_api_data.dart';
import 'package:zerofats/modules/exercise/exercise_screen.dart';

class ExerciseDetailsScreen extends StatelessWidget {

  ExerciseDetailsScreen({this.exerciseId , this.exerciseData});

 final String exerciseId;
 final ExerciseData exerciseData;
  @override
  Widget build(BuildContext context) {
    print('ex id $exerciseId');
    print('ex data : ${exerciseData.title}');
    print('ex gif : ${exerciseData.gif}');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top:38.0),
        child: Column(
          children: <Widget>[
            Image(
              image: NetworkImage(exerciseData.gif),
              width: 800.0,
              height: 400.0,
            ),

            SizedBox(height: 20.0,),

            Text('${exerciseData.seconds} Seconds' ,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black54,
            ),
            ),

            SizedBox(height: 130.0,),
            RaisedButton(
              child: Text('Complete' , style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
              ),

              color: Colors.green.shade400,
              onPressed: (){
                Navigator.pushNamed(context, ExerciseScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
