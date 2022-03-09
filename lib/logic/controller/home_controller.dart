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
  RxList<Product> homeProducts = <Product>[].obs;
  RxList<Product> productsByCategory = <Product>[].obs;

  Rx<ErrorResult> error =
      const ErrorResult(errorMessage: '', errorImage: '').obs;
  RxBool categoryIsLoading = true.obs;
  RxBool homeProductsIsLoading = true.obs;
  RxBool productsByCategoryIsLoading = true.obs;
  RxBool categoryIsError = false.obs;
  RxBool homeProductsIsError = false.obs;
  RxBool productsByCategoryIsError = false.obs;

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
    homeProductsIsLoading(true);
    homeProductsIsError(false);
    homeProducts.clear();
    await _service.getHomeProducts().then((value) {
      value.fold((left) {
        homeProducts.addAll(left);
        homeProductsIsLoading(false);
      }, (right) {
        error.value = right;
        homeProductsIsLoading(false);
        homeProductsIsError(true);
      });
    });
  }

  Future<void> getProductsByCategory({required String categoryKey}) async {
    productsByCategoryIsLoading(true);
    productsByCategory.clear();
    _service.getProductsByCategory(categoryKey: categoryKey).then((value) {
      value.fold((left) {
        productsByCategory.addAll(left);
        productsByCategoryIsLoading(false);
      }, (right) {
        error = right.obs;
        productsByCategoryIsLoading(false);
        productsByCategoryIsError(true);
      });
    });
  }

  Future<void> refreshHomePage() async {
    await getCategories();
    await getHomeProducts();
  }
}
