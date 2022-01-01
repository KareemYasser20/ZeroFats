import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zerofats/models/exercise_hub.dart';
import 'package:zerofats/widgets/exercise_list.dart';


class ExerciseScreen extends StatefulWidget {
  static const String id = 'exercise_screen';

  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  ExerciseHub exerciseHub;
  final String apiURL ="https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  @override
  void initState() {
    super.initState();
    getExercise();
  }

  void getExercise() async {
    var rep = await http.get(apiURL);
    var body=rep.body;

    var decodeJson=jsonDecode(body);
     exerciseHub= ExerciseHub.fromJson(decodeJson);
    setState(() {
    });

     // print('exerciseHub : ${exerciseHub.exercises[20].title}');

  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Image(
              image: AssetImage('images/exercise_screen_image.png'),
              height: 340.0,
              width: 500.0,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0) , topLeft: Radius.circular(20.0)),
                ),
                child: ExerciseList(exercisesList: exerciseHub.exercises,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
