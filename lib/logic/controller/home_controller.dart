import 'package:get/get.dart';
import 'package:shop_store/model/error_result.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/services/remote_services/home_service.dart';

class HomeController extends GetxController {
  int selectedBanner = 0;

  void onBannerChanged(int index) {
    selectedBanner = index;
    update();
  }

  RxList<String> categories = <String>[].obs;
  RxList<Product> products = <Product>[].obs;
  Rx<ErrorResult> error =
      const ErrorResult(errorMessage: '', errorImage: '').obs;
  RxBool categoryIsLoading = true.obs;
  RxBool productsIsLoading = true.obs;
  RxBool categoryIsError = false.obs;
  RxBool productsIsError = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCategories();
    getHomeProducts();
  }

  final HomeService _service = HomeService();

  Future<void> getCategories() async {
    categoryIsLoading(true);
    categoryIsError(false);
    categories.clear();
    await _service.getCategories().then((value) {
      value.fold((left) {
        categories.addAll(left);
        categoryIsLoading(false);
      }, (right) {
        error.value = right;
        categoryIsLoading(false);
        categoryIsError(true);
      });
    });
  }

  Future<void> getHomeProducts() async {
    productsIsLoading(true);
    productsIsError(false);
    products.clear();
    await _service.getHomeProducts().then((value) {
      value.fold((left) {
        products.addAll(left);
        productsIsLoading(false);
      }, (right) {
        error.value = right;
        productsIsLoading(false);
        productsIsError(true);
      });
    });
  }

  Future<void> refreshHomePage() async {
    await getCategories();
    await getHomeProducts();
  }
}
