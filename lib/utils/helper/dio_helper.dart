import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
    );
  }

  static Future<Response> getData(
      {required String url, Options? options}) async {
    return await dio.get(url, options: options);
  }
}
