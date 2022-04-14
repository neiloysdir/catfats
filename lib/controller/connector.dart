import 'package:dio/dio.dart';

class Connector {
  Future<Response<dynamic>?> getData(String url) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(url);
      return response;
    } on DioError catch (error) {
      print(error);
      return error.response;
    }
  }
}
