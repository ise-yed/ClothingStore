import 'package:clothingstore/main.dart';
import 'package:dio/dio.dart';


Dio dio = Dio(
  
  BaseOptions(baseUrl: 'https://flutter.vesam24.com/api/'))
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      String? token = prefs.getString("token");
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      handler.next(options);
    },
    onError: (error, handler) {
      if (error.response != null) {
        switch (error.response!.statusCode) {
          case 401:
            print("401");
            break;
        }
      } else {
        print("خطای نامشخص");
      }
      throw Exception();
    },
  ));
