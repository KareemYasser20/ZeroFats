import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:zerofats/models/exercise_api_data.dart';

class NetworkHelper{

  NetworkHelper(this.url);
  final String url ;

  Future fetchData() async{
    //'https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json'
    http.Response response = await http.get(url);
    if(response.statusCode == 200 ){
      String data = response.body;

      return jsonDecode(data);

    }else{print(response.statusCode);}
  }
}
