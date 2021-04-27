class ExerciseData {

  String id;
  String title;
  String thumbnail;
  String gif;
  String seconds;

  ExerciseData({this.id , this.title , this.thumbnail , this.gif , this.seconds});

  factory ExerciseData.fromJson(Map<String, dynamic> json) {
    return ExerciseData(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      gif: json['gif'],
      seconds: json['seconds'],
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['gif'] = this.gif;
    data['seconds'] = this.seconds;
    return data;
  }

}