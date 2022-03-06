import 'package:get/get.dart';
import 'package:shop_store/model/product.dart';

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

  void deleteCart() => cartProducts.clear();

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
          .toList().obs;
      productsQuantity.value = cartProducts.entries
          .map((element) => element.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
