import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';
import 'package:shop_store/logic/controller/payment_controller.dart';
import 'package:shop_store/logic/controller/setting_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
    Get.put(SettingController());
    Get.lazyPut(() => PaymentController());
  }
}
