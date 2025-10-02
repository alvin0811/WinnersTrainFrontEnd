import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:winner_trains_app/data/app_excaption.dart';
import 'package:winner_trains_app/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetRresponse(String url) async{
    dynamic responseJson;
    try{
final Response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10,),);
responseJson = returnResponse(Response,);
    }on SocketException{
      throw FetchDataException("No internet connection",);
    }
    return responseJson;
  }

  @override
  Future getPostRresponse(String url,dynamic data)async {
    dynamic responseJson;
    try{
Response  response  =await http.post(Uri.parse(url),
headers: {
  
},
body: data);

    }on SocketException{
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }
  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400:
      throw BadRequestException();
      case 404:
      throw BadRequestException();
       case 500:
      throw BadRequestException();
      default:
      throw FetchDataException(""+response.statusCode.toString()); 
    }
  }
}