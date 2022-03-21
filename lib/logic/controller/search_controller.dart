import 'package:get/get.dart';
import 'package:shop_store/logic/controller/home_controller.dart';
import 'package:shop_store/model/product.dart';

class SearchController extends GetxController {
  late HomeController _homeController;
  late List<Product> displayedProducts;
  bool isSearchingByPrice = false;

  void onChangeSearchOption(String option) {
    if (option == 'price'.tr) {
      isSearchingByPrice = true;
    } else {
      isSearchingByPrice = false;
    }
    update();
  }

  void searchQueryByName(String searchKey) {
    searchKey = searchKey.toLowerCase();
    displayedProducts = displayedProducts.where((element) {
      var searchTerm = element.title.toLowerCase();
      return searchTerm.contains(searchKey);
    }).toList();
    update();
  }

  void searchQueryByPrice(String searchKey) {
    searchKey = searchKey.toLowerCase();
    displayedProducts = displayedProducts.where((element) {
      var searchTerm = (element.price).toInt().toString().toLowerCase();
      return searchTerm.contains(searchKey);
    }).toList();
    update();
  }

  void onClearSearchKey() {
    displayedProducts = _homeController.homeProducts.value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    _homeController = Get.find<HomeController>();
    displayedProducts = _homeController.homeProducts.value;
  }
}
