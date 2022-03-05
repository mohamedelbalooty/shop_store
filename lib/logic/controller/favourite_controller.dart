import 'package:get/get.dart';
import 'package:shop_store/model/product.dart';
import 'package:shop_store/utils/constants.dart';
import 'package:shop_store/utils/helper/storage_helper.dart';

class FavouriteController extends GetxController {
  RxList<Product> favouriteProducts = <Product>[].obs;

  void addToFavourite(
      {required List<Product> products, required int productId}) {
    int selectedIndex =
        favouriteProducts.indexWhere((element) => element.id == productId);
    if (selectedIndex >= 0) {
      favouriteProducts.removeAt(selectedIndex);
      StorageHelper.removeListData(key: favouriteKey);
    } else {
      favouriteProducts
          .add(products.firstWhere((element) => element.id == productId));
      StorageHelper.setListData(
          key: favouriteKey,
          value: favouriteProducts.map((element) => element.toMap()).toList());
    }
  }

  bool isFavourite({required int productId}) =>
      favouriteProducts.any((element) => element.id == productId);

  @override
  void onInit() {
    super.onInit();
    List? localFavouriteProducts = StorageHelper.getListData(key: favouriteKey);
    if (localFavouriteProducts != null) {
      favouriteProducts = localFavouriteProducts
          .map((element) => Product.fromMap(element))
          .toList()
          .obs;
    }
  }
}
