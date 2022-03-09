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
        List<dynamic> data = response.data;
        List<String> categories = data.map((e) => e.toString()).toList();
        return Left(categories);
      } else {
        return Right(returnResponse(response));
      }
    } on DioError catch (dioException) {
      return Right(
          dioError(errorType: dioException, response: dioException.response));
    }
  }

  Future<Either<List<Product>, ErrorResult>> getHomeProducts() async {
    try {
      var response = await DioHelper.getData(url: 'products');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> products = data.map((e) => Product.fromMap(e)).toList();
        return Left(products);
      } else {
        return Right(returnResponse(response));
      }
    } on DioError catch (dioException) {
      return Right(
          dioError(errorType: dioException, response: dioException.response));
    }
  }

  Future<Either<List<Product>, ErrorResult>> getProductsByCategory(
      {required String categoryKey}) async {
    try {
      var response =
          await DioHelper.getData(url: 'products/category/$categoryKey');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Product> products = data.map((e) => Product.fromMap(e)).toList();
        return Left(products);
      } else {
        return Right(returnResponse(response));
      }
    } on DioError catch (dioException) {
      return Right(
          dioError(errorType: dioException, response: dioException.response));
    }
  }
}
