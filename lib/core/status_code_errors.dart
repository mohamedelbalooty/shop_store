import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:shop_store/model/error_result.dart';
import 'server_exception.dart';

ErrorResult returnResponse(dio.Response response) {
  switch (response.statusCode) {
    case 400:
      return BadRequestException().errorResult();
    case 401:
    case 403:
      return UnauthorisedException().errorResult();
    case 404:
    case 500:
    case 503:
    default:
      return FetchDataException().errorResult();
  }
}

ErrorResult dioError(
    {required dio.DioError errorType, dio.Response? response}) {
  ErrorResult connectionError = ErrorResult(
      errorMessage: 'socketException'.tr,
      errorImage: 'assets/images/socket_exception.svg');
  switch (errorType.type) {
    case dio.DioErrorType.response:
      return returnResponse(response!);
    case dio.DioErrorType.cancel:
      return ErrorResult(
          errorMessage: 'canceledException'.tr,
          errorImage: 'assets/images/socket_exception.svg');
    case dio.DioErrorType.connectTimeout:
      return ErrorResult(
          errorMessage: 'connectTimeoutException'.tr,
          errorImage: 'assets/images/socket_exception.svg');
    case dio.DioErrorType.receiveTimeout:
      return connectionError;
    case dio.DioErrorType.sendTimeout:
      return connectionError;
    case dio.DioErrorType.other:
      return connectionError;
  }
}
