import 'package:get/get.dart';
import 'package:shop_store/logic/controller/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchController());
  }
}
