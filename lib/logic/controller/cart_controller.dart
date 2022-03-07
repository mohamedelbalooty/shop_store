import 'dart:convert';

import 'package:get/get.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/helper/storage_helper.dart';

class CartController extends GetxController {
  RxMap<Product, dynamic> cartProducts = <Product, dynamic>{}.obs;
  RxDouble totalPrice = 0.0.obs;
  RxList productSubTotalPrice = [].obs;
  RxInt productsQuantity = 0.obs;

  void addProductToCart({required Product product}) {
    if (cartProducts.containsKey(product)) {
      cartProducts[product] += 1;
      totalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .reduce((value, element) => value + element)
          .roundToDouble()
          .obs;
      productSubTotalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .obs;
      productsQuantity.value = cartProducts.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    } else {
      cartProducts[product] = 1;
      totalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .reduce((value, element) => value + element)
          .roundToDouble()
          .obs;
      productSubTotalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .obs;
      productsQuantity.value = cartProducts.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  void deleteProductFromCart({required Product product}) {
    cartProducts.removeWhere((key, value) => key == product);
    totalPrice = cartProducts.entries
        .map((element) => element.key.price * element.value)
        .toList()
        .reduce((value, element) => value + element)
        .roundToDouble()
        .obs;
    productSubTotalPrice = cartProducts.entries
        .map((element) => element.key.price * element.value)
        .toList()
        .obs;
    productsQuantity.value = cartProducts.entries
        .map((element) => element.value)
        .toList()
        .reduce((value, element) => value + element);
  }

  void deleteCart() {
    cartProducts.clear();
    productsQuantity.value = 0;
  }

  void minimizeProductNumberFromCart({required Product product}) {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      cartProducts.removeWhere((key, value) => key == product);
      totalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .reduce((value, element) => value + element)
          .roundToDouble()
          .obs;
      productSubTotalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .obs;
      productsQuantity.value = cartProducts.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    } else {
      cartProducts[product] -= 1;
      totalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .reduce((value, element) => value + element)
          .roundToDouble()
          .obs;
      productSubTotalPrice = cartProducts.entries
          .map((element) => element.key.price * element.value)
          .toList()
          .obs;
      productsQuantity.value = cartProducts.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Map<List<Product>, dynamic> data = {
      [
        Product(
          id: 1,
          title: 'yyy',
          price: 3.0,
          description: 'xxx',
          category: 'ddd',
          image: 'rrr',
          rating: Rating(count: 3, rate: 9.0),
        ),
      ]: 1,
      [
        Product(
          id: 2,
          title: 'yyy',
          price: 4.0,
          description: 'xrxx',
          category: 'ddrd',
          image: 'rrrr',
          rating: Rating(count: 3, rate: 9.0),
        ),
      ]: 2
    };

    // var z = data.entries.map((e) => e.key.map((e) => e.toMap()).toList()).toList();
    // print(z);
    // func(){
    //   for(var item in z){
    //     print('item => $item');
    //   }
    // }

    // StorageHelper.setMapData(key: 'isCart', value: );
  //   // Map? localCartProducts = StorageHelper.getMapData(key: 'isCart');
  //   // if(localCartProducts != null){
  //   //   var keys = localCartProducts.keys.map((element) => Product.fromMap(element)).toList();
  //   //   // var value = localCartProducts.values.
  //   //   // cartProducts = {
  //   //   //
  //   //   // };
  //   // }
  }

}
