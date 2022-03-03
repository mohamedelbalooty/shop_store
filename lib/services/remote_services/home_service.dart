import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_store/core/status_code_errors.dart';
import 'package:shop_store/model/error_result.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/helper/dio_helper.dart';

class HomeService {
  Future<Either<List<String>, ErrorResult>> getCategories() async {
    try {
      var response = await DioHelper.getData(url: 'products/categories');
      if (response.statusCode == 200) {
        print(response.data);
        List<dynamic> data = response.data;
        List<String> categories = data.map((e) => e.toString()).toList();
        return Left(categories);
      } else {
        return Right(returnResponse(response));
      }
    } on DioError catch (dioException) {
      if (dioException.type == DioErrorType.response) {
        return Right(returnResponse(dioException.response!));
      } else if(dioException.type == DioErrorType.other) {
        ErrorResult errorResult = const ErrorResult(
            errorMessage: 'errorMessage',
            errorImage: 'assets/images/cover.png');
        return Right(errorResult);
      }else{
        ErrorResult errorResult = const ErrorResult(
            errorMessage: 'errorMessage',
            errorImage: 'assets/images/cover.png');
        return Right(errorResult);
      }
    }
  }

  Future<Either<List<Product>, ErrorResult>> getHomeProducts() async {
    try {
      var response = await DioHelper.getData(url: 'products?limit=10');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(response.data);
        print(data);
        List<Product> products = data.map((e) => Product.fromMap(e)).toList();
        print(products.first);
        return Left(products);
      } else {
        return Right(returnResponse(response));
      }
    } on DioError catch (dioException) {
      print(dioException.type);
      if (dioException.type == DioErrorType.response) {
        print(dioException.type);
        return Right(returnResponse(dioException.response!));
      } else if(dioException.type == DioErrorType.other) {
        ErrorResult errorResult = const ErrorResult(
            errorMessage: 'errorMessage',
            errorImage: 'assets/images/cover.png');
        return Right(errorResult);
      }else{
        print(dioException.type);
        ErrorResult errorResult = const ErrorResult(
            errorMessage: 'errorMessage',
            errorImage: 'assets/images/cover.png');
        return Right(errorResult);
      }
    }catch(e){
      print('e => $e');
      ErrorResult errorResult = const ErrorResult(
          errorMessage: 'errorMessage',
          errorImage: 'assets/images/cover.png');
      return Right(errorResult);
    }
  }
}
