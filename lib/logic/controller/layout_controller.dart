import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/layout_view/categories_view/categories_view.dart';
import 'package:shop_store/view/layout_view/favourite_view/favourite_view.dart';
import 'package:shop_store/view/layout_view/home_view/home_view.dart';
import 'package:shop_store/view/layout_view/settings_view/settings_view.dart';

class LayoutController extends GetxController {
  final selectedItemColor = whiteColor;

  final unselectedItemColor = Colors.white54;

  final unselectedBgColor = secondaryColor;

  RxInt selectedScreen = 0.obs;

  void onItemTapped(int index) {
    selectedScreen.value = index;
  }

  Color getBgColor(int index) {
    if (Get.isDarkMode) {
      return selectedScreen.value == index ? mainDarkColor : secondDarkColor;
    }
    return selectedScreen.value == index ? mainLightColor : unselectedBgColor;
  }

  Color getItemColor(int index) =>
      selectedScreen.value == index ? whiteColor : unselectedItemColor;

  RxList<Widget> screens = <Widget>[
    const HomeView(),
    CategoriesView(),
    FavouriteView(),
    const SettingsView(),
  ].obs;
}
