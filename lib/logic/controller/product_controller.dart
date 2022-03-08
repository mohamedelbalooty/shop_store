import 'package:get/get.dart';

class ProductController extends GetxController{
  int selectedIndex = 0;
  void onProductImageChanged(int index){
    selectedIndex = index;
    update();
  }
}