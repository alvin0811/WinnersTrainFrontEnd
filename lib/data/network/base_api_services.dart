import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getGetRresponse(String url);
  Future<dynamic> getPostRresponse(String url, dynamic data);
 
}