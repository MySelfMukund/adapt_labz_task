import 'package:dio/dio.dart';

import '../constants/global.dart';

Map<String, dynamic> map = {};

Dio _instance() {
  var dio = Dio();
  dio.options.baseUrl = baseApiUrl;
  dio.options.connectTimeout = const Duration(milliseconds: 35000);
  dio.options.receiveTimeout = const Duration(milliseconds: 35000);
  map["accept"] = "application/json";
  dio.options.responseType = ResponseType.json;

  return dio;
}

final dio = _instance();
