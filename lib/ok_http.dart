import 'package:dio/dio.dart';

class OkHttp {
 static Future getHttp(String url) async {
      var response = await Dio().get(url);
      return response.data;

  }
}