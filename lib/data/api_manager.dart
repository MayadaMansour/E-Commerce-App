import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../core/constants.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(Constants.baseURL + endPoint,
        queryParameters: queryParameters,
        options: Options(validateStatus: ((status) => true)));
  }

  Future<Response> postData(String endPoint,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? body}) {
    return dio.post(Constants.baseURL + endPoint,
        queryParameters: queryParameters,
        data: body,
        options: Options(validateStatus: ((status) => true)));
  }
}
