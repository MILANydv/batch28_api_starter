import 'package:batch28_api_starter/utils/url.dart';
import 'package:dio/dio.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices.internal();
  factory HttpServices() => _instance;
  HttpServices.internal();

  Dio? _dio;
  Dio getDioInstance() {
    if (_dio == null) {
      return _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: 5000,
        ),
      );
    } else {
      return _dio!;
    }
  }
}
