import 'package:dio/dio.dart';
import 'package:shop_store/model/error_result.dart';
import 'server_exception.dart';

ErrorResult returnResponse(Response response) {
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

ErrorResult dioError({required DioError errorType, Response? response}) {
  const ErrorResult connectionError = ErrorResult(
      errorMessage: 'Check your connection and try again!',
      errorImage: 'assets/images/socket_exception.svg');
  switch (errorType.type) {
    case DioErrorType.response:
      return returnResponse(response!);
    case DioErrorType.cancel:
      return const ErrorResult(
          errorMessage: 'You canceled connection try again!',
          errorImage: 'assets/images/socket_exception.svg');
    case DioErrorType.connectTimeout:
      return const ErrorResult(
          errorMessage: 'Your connection time out try again!',
          errorImage: 'assets/images/socket_exception.svg');
    case DioErrorType.receiveTimeout:
      return connectionError;
    case DioErrorType.sendTimeout:
      return connectionError;
    case DioErrorType.other:
      return connectionError;
  }
}
