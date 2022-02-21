import 'package:get/get.dart';
import 'package:shop_store/logic/controller/layout_controller.dart';

class LayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LayoutController());
  }
}
