import 'package:zerofats/models/exercise_api_data.dart';

class ExerciseHub {
  List<ExerciseData> exercises;

  ExerciseHub({this.exercises});

  ExerciseHub.fromJson(Map<String, dynamic> json)  {
    if (json['exercises'] != null) {
      exercises = new List<ExerciseData>();
      json['exercises'].forEach((v) {
        exercises.add(new ExerciseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercises != null) {
      data['exercises'] = this.exercises.map((v) => v.toJson()).toList();
    }
    return data;
  }
}