import 'package:flutter/material.dart';
import 'package:zerofats/models/exercise_api_data.dart';
import 'package:zerofats/modules/exercise_details/exercise_deatil_screen.dart';

class ExerciseList extends StatelessWidget {
  ExerciseList({@required this.exercisesList});

  final List<ExerciseData> exercisesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context , index){
        final  exercise = exercisesList[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(
              context,
                MaterialPageRoute(
                   builder: (context) => ExerciseDetailsScreen(exerciseId: exercise.id, exerciseData: exercise,),
                ),
            );
          },
          child: Padding(
            padding:  EdgeInsets.only(top:18.0 , right: 18.0 , left: 18.0),
            child: Row(
              children: <Widget>[
                Image(
                  image: NetworkImage(exercise.thumbnail),
                  width: 80.0,
                  height: 65.0,
                ),
                SizedBox(width: 20.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(exercise.title
                      , style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),

                    Text('${exercise.seconds} Second '
                      , style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }, itemCount: 5,
    );
  }
}
//
// ExerciseView(
// exerciseName: exercise.title,
// exerciseTime: exercise.seconds,
// exerciseImageURL: exercise.thumbnail,
//
// );