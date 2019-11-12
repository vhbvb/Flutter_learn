import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/joke_model.dart';

class FTJokeRequest {
  static void getJokes(String type, String maxTime, Function(List<FTJokeModel>) f) {

    Map params = {
      "a":"list",
      "c":"data",
      "type":type,
    };

    if(maxTime != null){
      params["maxtime"] = maxTime;
    }
    
    Future<http.Response> res = http.Client().post("http://api.budejie.com/api/api_open.php",body:params);

    res.then((http.Response response){
      Map<String,dynamic> obj = jsonDecode(response.body);

      print(obj.runtimeType);
      print(obj);
      print(obj["list"].runtimeType);

      if (obj["list"] != null){
        List<dynamic> data = obj["list"];

        List<FTJokeModel> details = data.map((dynamic json){
          return FTJokeModel.fromJson(json);
        }).toList();
        
        print(details);
        f(details);
      }else{
        f(null);
      }
    });
  }

  static void getComment(String id, Function f) {
    
  }
}