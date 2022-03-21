import 'package:get/get.dart';
import 'package:shop_store/model/error_result.dart';

abstract class ServerException {
  ErrorResult errorResult();
}

class BadRequestException extends ServerException {
  @override
  ErrorResult errorResult() {
    return ErrorResult(
        errorMessage: 'badRequestException'.tr,
        errorImage: 'assets/images/server_exception.svg');
  }
}

class UnauthorisedException extends ServerException {
  @override
  ErrorResult errorResult() {
    return ErrorResult(
        errorMessage: 'unauthorisedException'.tr,
        errorImage: 'assets/images/server_exception.svg');
  }
}

class FetchDataException extends ServerException {
  @override
  ErrorResult errorResult() {
    return ErrorResult(
        errorMessage: 'fetchDataException'.tr,
        errorImage: 'assets/images/data_exception.svg');
  }
}
