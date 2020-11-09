import 'package:dio/dio.dart';
import 'package:my_flutter/request/HttpConfig.dart';

class RequestMethod {
  // ignore: non_constant_identifier_names
  static var ForPost = "post";
  // ignore: non_constant_identifier_names
  static var ForGet = "get";
}

class HttpRequest {
  static final BaseOptions baseOpion = BaseOptions(
      baseUrl: HttpConfig.baseURL, connectTimeout: HttpConfig.timeOut);
  static final Dio dio = Dio(baseOpion);

  static Future<T> requestForCustorm<T>(String url,
      {String method = "get", Map<String, dynamic> params}) async {
    final option = Options(method: method);
    try {
      Response response =
          await dio.request(url, queryParameters: params, options: option);
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
