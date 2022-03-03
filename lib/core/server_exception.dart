import 'package:shop_store/model/error_result.dart';

abstract class ServerException {
  ErrorResult errorResult();
}

class BadRequestException extends ServerException {
  @override
  ErrorResult errorResult() {
    return const ErrorResult(
        errorMessage: 'BadRequestException',
        errorImage: 'assets/images/cover.png');
  }
}

class UnauthorisedException extends ServerException {
  @override
  ErrorResult errorResult() {
    return const ErrorResult(
        errorMessage: 'UnauthorisedException',
        errorImage: 'assets/images/cover.png');
  }
}

class FetchDataException extends ServerException {
  @override
  ErrorResult errorResult() {
    return const ErrorResult(
        errorMessage: 'FetchDataException',
        errorImage: 'assets/images/cover.png');
  }
}
