

import 'package:http/http.dart';

class NetworkService{
  static const String _baseUrl = "dummyjson.com";
  static const String baseApi = "/products";

  static Future<String> getAllData(String api)async{
    Uri url =  Uri.https(_baseUrl, api);
    Response response = await get(url);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
     return "Something went wrong ${response.statusCode}";
    }
  }
}