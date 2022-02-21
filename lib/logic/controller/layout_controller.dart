import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/utils/colors.dart';
import 'package:shop_store/view/layout_view/categories_view/categories_view.dart';
import 'package:shop_store/view/layout_view/favourite_view/favourite_view.dart';
import 'package:shop_store/view/layout_view/home_view/home_view.dart';
import 'package:shop_store/view/layout_view/settings_view/settings_view.dart';

class LayoutController extends GetxController {
  final selectedItemColor = Get.isDarkMode ? secondDarkColor : secondLightColor;

  final unselectedItemColor = Colors.white54;

  final selectedBgColor = Get.isDarkMode ? mainDarkColor : mainLightColor;

  final unselectedBgColor = secondaryColor;

  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  Color getBgColor(int index) =>
      selectedIndex.value == index ? selectedBgColor : unselectedBgColor;

  Color getItemColor(int index) =>
      selectedIndex.value == index ? selectedItemColor : unselectedItemColor;

  RxList<Widget> screens = <Widget>[
    const HomeView(),
    const CategoriesView(),
    const FavouriteView(),
    const SettingsView(),
  ].obs;

  RxList<String> appBarTitles = <String>[
    'Home screen',
    'Categories screen',
    'Favourite screen',
    'Settings screen'
  ].obs;
}
