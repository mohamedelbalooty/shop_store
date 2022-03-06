import 'package:get/get.dart';
import 'package:shop_store/logic/controller/cart_controller.dart';
import 'package:shop_store/logic/controller/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.lazyPut(() => CartController());
  }
}